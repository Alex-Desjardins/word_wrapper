require 'pry'
require 'rspec'
require '../lib/wrapper.rb'

RSpec.describe "wrap" do
  before(:each) do
    @wrapper = Wrapper.new
  end

  it "returns empty string" do
    expect(@wrapper.word_wrap("", 1)).to eq("")
  end

  it "returns string if shorter than column number" do
    expect(@wrapper.word_wrap("test", 8)).to eq("test")
  end

  it "wraps continuous string if length greater than column value" do
    expect(@wrapper.word_wrap("testtesttest", 4)).to eq("test\ntest\ntest")
  end

  it "wraps at space after column length" do
    expect(@wrapper.word_wrap("test test test", 12)).to eq("test test\ntest")
  end

  it "wraps when space is at column length" do
    expect(@wrapper.word_wrap("test test", 5)).to eq("test\ntest")
  end

  it "wraps when space is before column length" do
    expect(@wrapper.word_wrap("test test", 6)).to eq("test\ntest")
  end

  it "wraps strings as sentences" do
    expect(@wrapper.word_wrap("This is an example", 7)).to eq("This is\nan\nexample")
  end
end
