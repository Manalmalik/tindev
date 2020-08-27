class CategoriesController < ApplicationController
  after_action :verify_policy_scoped, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @categories = policy_scope(Category)
  end

end
