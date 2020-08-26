class CategoriesController < ApplicationController
  after_action :verify_policy_scoped, only: [:show, :index]

  def index
    @categories = policy_scope(Category)
  end

end
