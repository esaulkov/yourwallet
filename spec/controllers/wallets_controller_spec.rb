require 'rails_helper'

RSpec.describe WalletsController, :type => :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "populates an array of wallets" do
      wallet1 = FactoryGirl.create(:wallet)
      wallet2 = FactoryGirl.create(:other_wallet)
      get :index
      expect(assigns(:wallets)).to eq([wallet1, wallet2])
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
      it "creates a new wallet" do
        expect {
          post :create, wallet: FactoryGirl.attributes_for(:wallet)
        }.to change(Wallet, :count).by(1)
      end
    
      it "redirects to the new wallet" do
        post :create, wallet: FactoryGirl.attributes_for(:wallet)
        expect(response).to redirect_to Wallet.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new wallet" do
        expect {
          post :create, wallet: FactoryGirl.attributes_for(:invalid_wallet)
        }.to_not change(Wallet, :count)
      end
    
      it "re-renders the new template" do
        post :create, wallet: FactoryGirl.attributes_for(:invalid_wallet)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    before :each do
      @wallet = FactoryGirl.create(:wallet)
    end

    it "has a 200 status code" do
      get :show, id: @wallet
      expect(response.status).to eq(200)
    end

    it "assigns the requested wallet to @wallet" do
      get :show, id: @wallet
      expect(assigns(:wallet)).to eq(@wallet)
    end
    
    it "renders the show template" do
      get :show, id: @wallet
      expect(response).to render_template(:show)
    end
  end

  describe "GET edit" do
    it "assigns the requested wallet to @wallet" do
      wallet = FactoryGirl.create(:wallet)
      get :edit, id: wallet
      expect(assigns(:wallet)).to eq(wallet)
    end
    
    it "renders the edit template" do
      get :edit, id: FactoryGirl.create(:wallet)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    before :each do
      @wallet = FactoryGirl.create(:wallet, name: "Credit card",
        user_id: 1)
    end
    
    context "with valid attributes" do
      it "located the requested @wallet" do
        put :update, id: @wallet, wallet: FactoryGirl.attributes_for(:wallet)
        expect(assigns(:wallet)).to eq(@wallet)
      end
      
      it "changes @wallet's attributes" do
        put :update, id: @wallet, wallet: FactoryGirl.attributes_for(:wallet, name: "Cash", user_id: 2)
        @wallet.reload
        expect(@wallet.name).to eq("Cash")
        expect(@wallet.user_id).to eq(2)
      end
      
      it "redirects to updated wallet" do
        put :update, id: @wallet, wallet: FactoryGirl.attributes_for(:wallet)
        expect(response).to redirect_to @wallet
      end
    end
    
    context "with invalid attributes" do
      it "locates the requested @wallet" do
        put :update, id: @wallet, wallet: FactoryGirl.attributes_for(:invalid_wallet)
        expect(assigns(:wallet)).to eq(@wallet)
      end
      
      it "doesn't change @wallet's attributes" do
        put :update, id: @wallet,
          wallet: FactoryGirl.attributes_for(:wallet, name: "Invalid card with very long name and wrong card number", user_id: nil)
        @wallet.reload
        expect(@wallet.name).to_not eq("Invalid card with very long name and wrong card number")
        expect(@wallet.user_id).to eq(1)
      end
      
      it "re-renders the edit template" do
        put :update, id: @wallet, wallet: FactoryGirl.attributes_for(:invalid_wallet)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @wallet = FactoryGirl.create(:wallet)
    end
    
    it "deletes the wallet" do
      expect {
        delete :destroy, id: @wallet
      }.to change(Wallet, :count).by(-1)
    end
    
    it "redirects to wallets#index" do
      delete :destroy, id: @wallet
      expect(response).to redirect_to wallets_url
    end
  end
end
