require "spec_helper"

describe WeighInsController do
  describe "routing" do

    it "routes to #index" do
      get("/weigh_ins").should route_to("weigh_ins#index")
    end

    it "routes to #new" do
      get("/weigh_ins/new").should route_to("weigh_ins#new")
    end

    it "routes to #show" do
      get("/weigh_ins/1").should route_to("weigh_ins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weigh_ins/1/edit").should route_to("weigh_ins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weigh_ins").should route_to("weigh_ins#create")
    end

    it "routes to #update" do
      put("/weigh_ins/1").should route_to("weigh_ins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weigh_ins/1").should route_to("weigh_ins#destroy", :id => "1")
    end

  end
end
