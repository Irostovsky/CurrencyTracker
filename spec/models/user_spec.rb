require 'spec_helper'

describe User do
  
  describe "validation" do
    it "should create valid user" do
      Factory :user
    end
  end

  describe "after_create" do
    it "should call update_data" do
      User.any_instance.expects(:update_data)
      Factory :user
    end
  end
  
  describe "update_data" do
    it "should raise error if bad response" do
      DataUpdater.any_instance.stubs(:parsed_response).returns({})
      lambda { Factory :user }.should raise_error
    end

    it "should insert data if no data found for user" do
      DataUpdater.any_instance.stubs(:parsed_response).returns(
        {
          :countries => [
            { :name => 'USA', :code => 'usa'},
            { :name => 'India', :code => 'ind'}
          ], 
          :currencies => [
            { :name => 'Dollar', :code => 'usd', :country_id => 'usa'},
            { :name => 'Rupi', :code => 'rp', :country_id => 'ind'}
          ]
        }
      )
      user = Factory :user
      countries = user.countries
      countries.count.should == 2
      countries.map(&:name).should == ['USA', 'India']
      countries.map(&:code).should == ['usa', 'ind']
      
      user.currencies.count.should == 2
      countries[0].currencies[0].name.should == 'Dollar'
      countries[1].currencies[0].name.should == 'Rupi'
    end

    it "should not insert country if country presents for user" do
      DataUpdater.any_instance.stubs(:parsed_response).returns(
        {
          :countries => [
            { :name => 'USA', :code => 'usa'},
            { :name => 'India', :code => 'ind'}
          ], 
          :currencies => [
            { :name => 'Dollar', :code => 'usd', :country_id => 'usa'},
            { :name => 'Rupi', :code => 'rp', :country_id => 'ind'}
          ]
        }
      )
      user = Factory :user
      user.update_data
      countries = user.countries
      countries.count.should == 2
      countries.map(&:name).should == ['USA', 'India']
      countries.map(&:code).should == ['usa', 'ind']
      
      user.currencies.count.should == 2
      countries[0].currencies[0].name.should == 'Dollar'
      countries[1].currencies[0].name.should == 'Rupi'
    end
        
  end
  
  
end
