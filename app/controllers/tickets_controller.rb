class TicketsController < ApplicationController

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
end
