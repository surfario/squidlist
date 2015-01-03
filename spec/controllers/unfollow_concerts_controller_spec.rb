require 'rails_helper'

RSpec.describe UnfollowConcertsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to be_success
    end
  end

  describe "GET destory" do
    it "returns http success" do
      get :destory
      expect(response).to be_success
    end
  end

end
