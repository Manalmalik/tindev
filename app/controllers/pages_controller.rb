require 'rubygems'
require 'twilio-ruby'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def videocall
    @chat = Chat.find(params[:chat_id])
    @message = Message.new
    @ticket = Ticket.find(params[:ticket_id])
    @category = Category.find(params[:category_id])
    authentication
  end

  def authentication
    @user = current_user
    # Substitute your Twilio AccountSid and ApiKey details
    account_sid = 'AC638feb082b61d31367ebbb7eff9aa107'
    api_key_sid = 'SKebe62a6f39022a88251f4bfededae19a'
    api_key_secret = 'X5tk5A5bwMD4BPHbvGMHNscsIeKHrYpr'

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new account_sid, api_key_sid, api_key_secret,
        ttl: 3600,
        identity: @user.id

    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = @chat_id
    token.add_grant grant

    # Serialize the token as a JWT
    @token = token.to_jwt

  end
end

