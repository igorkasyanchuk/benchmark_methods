require 'spec_helper'

describe BenchmarkMethods do

  before :each do
    clean_db
  end

  it 'has a version number' do
    expect(BenchmarkMethods::VERSION).not_to be_nil
  end

  it 'can benchmark class method 1' do
    expect{User.create_user_and_comments}.not_to raise_error
  end

  it 'can benchmark class method 2' do
    expect(User.create_user_and_comments.class.to_s).to eq('User')
  end

  it 'can benchmark instance method 1' do
    expect{User.new.create_test_friend}.not_to raise_error
  end

  it 'can benchmark instance method 2' do
    expect(User.new.create_test_friend.class.to_s).to eq('User')
  end
end
