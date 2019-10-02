module ApplicationHelper

	def admin_menu
		[
			{ name: '出品', url: new_admin_product_path},
			{ name: '在庫管理', url: admin_products_path},
			{ name: 'カテゴリ管理', url: admin_categories_path},
			{ name: 'オーダー管理', url: admin_purchasers_path},
			{ name: 'ユーザー管理', url: admin_users_path},
			{ name: 'お問い合わせ', url: admin_contacts_path}
		]
	end

	def full_title(page_title = '')

		"#{page_title.blank?? nil : page_title+' | '}shop_on_rails"
	end

	
end
