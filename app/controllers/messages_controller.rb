class MessagesController < ApplicationController
  def create
    @application = Application.find(params[:application_id])
    @message = Message.new(message_params)
    @message.application = @application
    @message.user = current_user
    authorize @application, :show?
    if @message.save
      ApplicationChannel.broadcast_to(@application, render_to_string(partial: "message", locals: { message: @message }))
      redirect_to application_path(@application, anchor: "message-#{@message.id}")

    else
      render "applications/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
