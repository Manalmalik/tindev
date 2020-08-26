class TicketsController < ApplicationController

  def index
    @ticket = policy_scope(Ticket)
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    authorize @ticket
    if @ticket.save
      redirect_to ticket_path(@ticket), notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
