require 'rails_helper'

RSpec.describe PurchasesController, :type => :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "populates an array of purchases" do
      purchase1 = FactoryGirl.create(:purchase)
      purchase2 = FactoryGirl.create(:other_purchase)
      get :index
      expect(assigns(:purchases)).to eq([purchase1, purchase2])
    end
  end

  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new purchase" do
        expect {
          post :create, purchase: FactoryGirl.attributes_for(:purchase)
        }.to change(Purchase, :count).by(1)
      end
    
      it "redirects to the new purchase" do
        post :create, purchase: FactoryGirl.attributes_for(:purchase)
        expect(response).to redirect_to Purchase.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new purchase" do
        expect {
          post :create, purchase: FactoryGirl.attributes_for(:invalid_purchase)
        }.to_not change(Purchase, :count)
      end
    
      it "re-renders the new template" do
        post :create, purchase: FactoryGirl.attributes_for(:invalid_purchase)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    before :each do
      @purchase = FactoryGirl.create(:purchase)
    end

    it "has a 200 status code" do
      get :show, id: @purchase
      expect(response.status).to eq(200)
    end

    it "assigns the requested purchase to @purchase" do
      get :show, id: @purchase
      expect(assigns(:purchase)).to eq(@purchase)
    end
    
    it "renders the show template" do
      get :show, id: @purchase
      expect(response).to render_template(:show)
    end
  end

  describe "GET edit" do
    it "assigns the requested purchase to @purchase" do
      purchase = FactoryGirl.create(:purchase)
      get :edit, id: purchase
      expect(assigns(:purchase)).to eq(purchase)
    end
    
    it "renders the edit template" do
      get :edit, id: FactoryGirl.create(:purchase)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    before :each do
      @purchase = FactoryGirl.create(:purchase, name: "Common goods",
        category_id: 1)
    end
    
    context "with valid attributes" do
      it "located the requested @purchase" do
        put :update, id: @purchase, purchase: FactoryGirl.attributes_for(:purchase)
        expect(assigns(:purchase)).to eq(@purchase)
      end
      
      it "changes @purchase's attributes" do
        put :update, id: @purchase, purchase: FactoryGirl.attributes_for(:purchase, name: "Drinks & Beer", category_id: 2)
        @purchase.reload
        expect(@purchase.name).to eq("Drinks & Beer")
        expect(@purchase.category_id).to eq(2)
      end
      
      it "redirects to updated purchase" do
        put :update, id: @purchase, purchase: FactoryGirl.attributes_for(:purchase)
        expect(response).to redirect_to @purchase
      end
    end
    
    context "with invalid attributes" do
      it "locates the requested @purchase" do
        put :update, id: @purchase, purchase: FactoryGirl.attributes_for(:invalid_purchase)
        expect(assigns(:purchase)).to eq(@purchase)
      end
      
      it "doesn't change @purchase's attributes" do
        put :update, id: @purchase,
          purchase: FactoryGirl.attributes_for(:purchase, name: "Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer", category_id: nil)
        @purchase.reload
        expect(@purchase.name).to_not eq("Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer")
        expect(@purchase.category_id).to eq(1)
      end
      
      it "re-renders the edit template" do
        put :update, id: @purchase, purchase: FactoryGirl.attributes_for(:invalid_purchase)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @purchase = FactoryGirl.create(:purchase)
    end
    
    it "deletes the purchase" do
      expect {
        delete :destroy, id: @purchase
      }.to change(Purchase, :count).by(-1)
    end
    
    it "redirects to purchases#index" do
      delete :destroy, id: @purchase
      expect(response).to redirect_to purchases_url
    end
    #delete all purchases where category_id = params[:id]
  end
end
