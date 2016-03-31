class AttachmentsController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def destroy
    @attachment = Attachment.find(params[:id])
  end
end