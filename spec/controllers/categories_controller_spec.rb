require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "populates an array of categories" do
      category1, category2 = FactoryGirl.create(:category), FactoryGirl.create(:other_category)
      get :index
      expect(assigns(:categories)).to eq([category1, category2])
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
      it "creates a new category" do
        expect {
          post :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category, :count).by(1)
      end
    
      it "redirects to the new category" do
        post :create, category: FactoryGirl.attributes_for(:category)
        expect(response).to redirect_to Category.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new category" do
        expect {
          post :create, category: FactoryGirl.attributes_for(:invalid_category)
        }.to_not change(Category, :count)
      end
    
      it "re-renders the new template" do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET show" do
    before :each do
      @category = FactoryGirl.create(:category)
    end

    it "has a 200 status code" do
      get :show, id: @category
      expect(response.status).to eq(200)
    end

    it "assigns the requested category to @category" do
      get :show, id: @category
      expect(assigns(:category)).to eq(@category)
    end
    
    it "renders the show template" do
      get :show, id: @category
      expect(response).to render_template(:show)
    end
  end

  describe "GET edit" do
    it "assigns the requested category to @category" do
      category = FactoryGirl.create(:category)
      get :edit, id: category
      expect(assigns(:category)).to eq(category)
    end
    
    it "renders the edit template" do
      get :edit, id: FactoryGirl.create(:category)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    before :each do
      @category = FactoryGirl.create(:category, name: "Common goods")
    end
    
    context "with valid attributes" do
      it "located the requested @category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:category)
        expect(assigns(:category)).to eq(@category)
      end
      
      it "changes @category's name" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:category, name: "Drinks & Beer")
        @category.reload
        expect(@category.name).to eq("Drinks & Beer")
      end
      
      it "redirects to updated category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:category)
        expect(response).to redirect_to @category
      end
    end
    
    context "with invalid attributes" do
      it "locates the requested @category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:invalid_category)
        expect(assigns(:category)).to eq(@category)
      end
      
      it "doesn't change @category's attributes" do
        put :update, id: @category,
          category: FactoryGirl.attributes_for(:category, name: "Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer")
        @category.reload
        expect(@category.name).to_not eq("Drinks & Beer Drinks & Beer Drinks & Beer Drinks & Beer")
        expect(@category.name).to eq("Common goods")
      end
      
      it "re-renders the edit template" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:invalid_category)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @category = FactoryGirl.create(:category)
    end
    
    it "deletes the category" do
      expect {
        delete :destroy, id: @category
      }.to change(Category, :count).by(-1)
    end
    
    it "redirects to categories#index" do
      delete :destroy, id: @category
      expect(response).to redirect_to categories_url
    end
    #delete all purchases where category_id = params[:id]
  end
end
