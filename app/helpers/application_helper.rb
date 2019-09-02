module ApplicationHelper

	def full_title(page_title = '')
		base_title = "shop_on_rails"
		if page_title.empty?
			base_title
		else
			page_title + "|" + base_title
		end
	end
end
