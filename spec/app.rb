ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string :name
  end

  create_table :comments, :force => true do |t|
    t.integer :user_id
    t.string :comment
  end

  create_table :accounts, :force => true do |t|
    t.string :name
  end
end

class User < ActiveRecord::Base
  include BenchmarkMethods

  has_many :comments

  cbenchmark :create_user_and_comments
  benchmark :create_test_friend

  def self.create_user_and_comments
    user = User.create(:name => 'John Smith')
    user.comments.create(:comment => 'This is Comment #1')
    user.comments.create(:comment => 'This is Comment #2')
    user.comments.create(:comment => 'This is Comment #3')
    user
  end

  def create_test_friend
    User.create(:name => 'My Friend')
  end
end

class Comment < ActiveRecord::Base
  include BenchmarkMethods

  belongs_to :user
end

module Db
  class Account < ActiveRecord::Base
    include BenchmarkMethods

    cbenchmark :sample_class_method_nested

    benchmark :sample_intance_method_nested

    def self.return_value
      42
    end

  end
end