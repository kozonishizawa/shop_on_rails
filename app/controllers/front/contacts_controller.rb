class Front::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      redirect_to root_path, flash: {success: 'お問い合わせを送信しました'}
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit :name, :title, :organization, :email, :tel, :body
    end
end
