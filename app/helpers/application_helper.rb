module ApplicationHelper

	def admin_menu
		menu = [
			{ name: '出品', url: new_admin_product_path},
			{ name: '在庫管理', url: admin_products_path},
			{ name: 'カテゴリ管理', url: admin_categories_path},
			{ name: 'オーダー管理', url: admin_purchasers_path},
			{ name: 'ユーザー管理', url: admin_users_path}
		]
		menu
	end

	def full_title(page_title = '')
		base_title = "shop_on_rails"
		if page_title.empty?
			base_title
		else
			page_title + "|" + base_title
		end
	end
end
