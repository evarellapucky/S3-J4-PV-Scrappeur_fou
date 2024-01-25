require_relative '../lib/00_dark_trader'

describe "the perform method" do
  it "should return a non-empty array of hashes" do
    expect(perform).not_to be_empty
    expect(perform).to be_an_instance_of(Array)
  end

  it "should contain at least 5 entries" do
    expect(perform.length).to be >= 5
  end

  it "should include some crypto" do
    expect(perform).to include({ "BTC" => be >= 0 })
    expect(perform).to include({ "ETH" => be  >= 0 })
  end
end

