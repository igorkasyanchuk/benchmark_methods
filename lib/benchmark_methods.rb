require 'securerandom'
require 'benchmark'
require 'benchmark_methods/version'

module BenchmarkMethods

  def self.included(base_klass)
    base_klass.extend(ClassMethods)
    unless Object.const_defined?("#{base_klass.name.demodulize}Interceptor")
      interceptor = const_set("#{base_klass.name.demodulize}Interceptor", Module.new)
      base_klass.send(:prepend, interceptor)
    end
  end

  def self.log(report)
    if Object.const_defined?("Rails")
      Rails.logger.debug("  --> #{report.label}")
      Rails.logger.debug("#{Benchmark::CAPTION}#{report.to_s}")
    else
      puts("  --> #{report.label}")
      puts(Benchmark::CAPTION)
      puts(report)
    end
  end

  def self.measure(label, &block)
    t0, r0 = Process.times, Time.now
    result = yield
    t1, r1 = Process.times, Time.now
    report = Benchmark::Tms.new(t1.utime  - t0.utime,
                       t1.stime  - t0.stime,
                       t1.cutime - t0.cutime,
                       t1.cstime - t0.cstime,
                       r1 - r0,
                       label)
    BenchmarkMethods::log(report)
    result
  end

  module ClassMethods

    def cbenchmark(*cmethods)
      interceptor = const_get("#{name.demodulize}Interceptor")
      klass = const_get(name)
      helper = const_set("BenchmarkMethods#{SecureRandom.hex}Helper", Module.new)
      cmethods.each do |method_name|
        interceptor.module_eval do
          helper.send :define_singleton_method, :prepended do |base|
            define_method(method_name) do |*args, &block|
              BenchmarkMethods::measure("#{klass}.#{method_name}") do
                super(*args, &block)
              end
            end
          end
          (class << klass; self; end).module_eval do
            prepend(helper)
          end
        end
      end
    end

    def benchmark(*cmethods)
      interceptor = const_get("#{name.demodulize}Interceptor")
      klass = const_get(name)
      cmethods.each do |method_name|
        interceptor.module_eval do
          define_method(method_name) do |*args, &block|
            BenchmarkMethods::measure("#{klass} #{method_name}") do
              super(*args, &block)
            end
          end
        end
      end
    end

  end
end