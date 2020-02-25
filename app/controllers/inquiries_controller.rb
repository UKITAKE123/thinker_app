class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to root_path, notice: "お問い合わせを受付しました。"
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.permit(inquiry: [:name, :email, :message])
  end
end
