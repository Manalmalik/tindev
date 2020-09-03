class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @category = Category.find(params[:category_id])
    @tickets = policy_scope(Ticket)
  end

  def new
    @ticket = Ticket.new
    @category = Category.find(params[:category_id])
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @category = Category.find(params[:category_id])
    @ticket.category = @category
    authorize @ticket
    authorize @category
    if @ticket.save
      redirect_to filtered_category_tickets_path(@category.id), notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @ticket = Ticket.find(params[:id])
    @user = User.find(@ticket.user_id)
    authorize @ticket
    authorize @category
  end

  def edit
    @category = Category.find(params[:category_id])
    @ticket = Ticket.find(params[:id])
    authorize @category
    authorize @ticket
  end

  def update
    @category = Category.find(params[:category_id])
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    authorize @category
    if @ticket.update(ticket_params)
      redirect_to category_ticket_path(@category, @ticket), notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    authorize @category
    @ticket.destroy
    redirect_to filtered_category_tickets_path
  end

  def filtered
    @category = Category.find(params[:category_id])
    @tickets = Ticket.where(category: params[:category_id])
    authorize @tickets
    authorize @category
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
