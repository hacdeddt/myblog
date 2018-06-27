module ApplicationHelper
	def full_title(page_title='')
		base_title = "My Blog"
		if (page_title.empty?)
			base_title
		else
			page_title + " | " + base_title
		end
	end
	def title_post(title='')
		base_title = "My Blog"
		if (title.empty?)
			base_title
		else
			title
		end
	end
	def poster(username='')
		string = "Welcome to My Blog!"
		if (username.empty?)
			string
		else
			 username
		end
	end
	def date(date='')
		base_title = ""
		if (date.empty?)
			base_title
		else
			 " vào " + date + " ago"
		end
	end
	def string(username='')
		s1 = "Được đăng bởi "
		if (!username.empty?)
			s1
		end
	end
	def userid(user)
		if (!user.empty?)
			user.to_s
		end
	end
	def coverimage(img='')
		i = 'http://www.codeblocq.com/assets/projects/hexo-theme-clean-blog/img/home-bg.jpg'
		if (img.empty?)
			i
		else
			img
		end
	end
end
