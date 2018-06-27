class Post < ApplicationRecord
	has_many :comments
	has_many :posttags, dependent: :destroy
	has_many :tags, through: :posttags
	belongs_to :user
	mount_uploader :image, PictureUploader
	validates :title, presence: true
	validates :content, presence: true
	validates :summary, presence: true
	before_validation :sanitize, :slugify, :transyear
	def slugify
		self.slug = self.title.downcase.gsub(" ","-")
	end
	def sanitize
		self.title = self.title.strip
	end
	def transyear
		begin
			self.year = self.created_at.year
		rescue
			
		end
	end
	
#Thêm tag và posttag

	def all_tags=(names)
		self.tags = names.split(', ').map do |name| 
			Tag.where(tagname: name).first_or_create!
		end
	end

	def all_tags
		tags.map(&:tagname).join(", ")
	end
#Hàm để lấy ra tất cả các post có chung 1 tag
	def self.tagged_with(name)

			Tag.find_by!(tagname: name).posts	

	end
end
