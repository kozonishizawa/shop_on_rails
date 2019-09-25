class PurchaserMailer < ApplicationMailer
  default from: 'mildsurfclub@example.com'

  #購入者に対する注文確認メール
  def purchaser_email(purchaser)
    @purchaser = purchaser
    mail(
      subject: 'ご注文の確認',
      to: @purchaser.email,
      from: 'mildsurfclub@example.com'
    )
  end

  #管理者全員に対する新規オーダー通知
  def order_notification
    admin_users = User.where(admin: true)
    mail(
      subject: '新規オーダー通知',
      to: admin_users.pluck(:email),
      from: 'mildsurfclub@example.com'
    )
  end
end
