require_relative '../lib/01_mairie_christmas'

describe "the get_townhalls_url method" do
  it "shoul return a non-empty array" do
    expect(get_townhalls_url).to be_an_instance_of(Array)
    expect(get_townhalls_url).not_to be_empty
  end
end

describe "the get_emails method" do 
  it "should contain at least 5 entries" do
    expect(get_emails.length).to be >= 10
  end

  it "should return a city name with an email adress" do
    expect(get_emails).to include({"Vienne-en-arthies"=>"mairie.viennearthies@wanadoo.fr"})
    expect(get_emails).to include({"Bouffemont"=>"info@ville-bouffemont.fr"})
  end
end
