class CategoriesController < ApplicationController

  def index
    @category = policy_scope(Category)
  end
end
