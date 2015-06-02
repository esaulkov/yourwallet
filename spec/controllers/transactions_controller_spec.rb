require 'rails_helper'

RSpec.describe TransactionsController, :type => :controller do
  
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "populates an array of transactions" do
      transaction1 = FactoryGirl.create(:transaction)
      transaction2 = FactoryGirl.create(:other_transaction)
      get :index
      expect(assigns(:transactions)).to eq([transaction1, transaction2])
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
      it "creates a new transaction" do
        expect {
          post :create, transaction: FactoryGirl.attributes_for(:transaction)
        }.to change(Transaction, :count).by(1)
      end
    
      it "redirects to the new transaction" do
        post :create, transaction: FactoryGirl.attributes_for(:transaction)
        expect(response).to redirect_to Transaction.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new transaction" do
        expect {
          post :create, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        }.to_not change(Transaction, :count)
      end
    
      it "re-renders the new template" do
        post :create, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    before :each do
      @transaction = FactoryGirl.create(:transaction)
    end

    it "has a 200 status code" do
      get :show, id: @transaction
      expect(response.status).to eq(200)
    end

    it "assigns the requested transaction to @transaction" do
      get :show, id: @transaction
      expect(assigns(:transaction)).to eq(@transaction)
    end
    
    it "renders the show template" do
      get :show, id: @transaction
      expect(response).to render_template(:show)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction to @transaction" do
      transaction = FactoryGirl.create(:transaction)
      get :edit, id: transaction
      expect(assigns(:transaction)).to eq(transaction)
    end
    
    it "renders the edit template" do
      get :edit, id: FactoryGirl.create(:transaction)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    before :each do
      @transaction = FactoryGirl.create(:transaction, wallet_id: 1,
        purchase_id: 1, sum: 100, date_time: Time.now)
    end
    
    context "with valid attributes" do
      it "located the requested @transaction" do
        put :update, id: @transaction, transaction: FactoryGirl.attributes_for(:transaction)
        expect(assigns(:transaction)).to eq(@transaction)
      end
      
      it "changes @transaction's attributes" do
        put :update, id: @transaction, transaction: FactoryGirl.attributes_for(:transaction, sum: 48.59)
        @transaction.reload
        expect(@transaction.sum).to eq(48.59)
        expect(@transaction.purchase_id).to eq(1)
      end
      
      it "redirects to updated transaction" do
        put :update, id: @transaction, transaction: FactoryGirl.attributes_for(:transaction)
        expect(response).to redirect_to @transaction
      end
    end
    
    context "with invalid attributes" do
      it "locates the requested @transaction" do
        put :update, id: @transaction, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        expect(assigns(:transaction)).to eq(@transaction)
      end
      
      it "doesn't change @transaction's attributes" do
        put :update, id: @transaction,
          transaction: FactoryGirl.attributes_for(:transaction, sum: 0.00, purchase_id: 2)
        @transaction.reload
        expect(@transaction.sum).to_not eq(0.00)
        expect(@transaction.purchase_id).to eq(1)
      end
      
      it "re-renders the edit template" do
        put :update, id: @transaction, transaction: FactoryGirl.attributes_for(:invalid_transaction)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @transaction = FactoryGirl.create(:transaction)
    end
    
    it "deletes the transaction" do
      expect {
        delete :destroy, id: @transaction
      }.to change(Transaction, :count).by(-1)
    end
    
    it "redirects to transactions#index" do
      delete :destroy, id: @transaction
      expect(response).to redirect_to transactions_url
    end
  end
end
