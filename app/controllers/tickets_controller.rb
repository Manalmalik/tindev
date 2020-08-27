class TicketsController < ApplicationController

  def index
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
      redirect_to category_tickets_path(@category.id), notice: 'Ticket was successfully created.'
      # redirect_to category_ticket(@category.id, @ticket.id), notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
