class Tag < ApplicationRecord
	has_many :posttags, dependent: :destroy
	has_many :posts, through: :posttags
	validates :tagname, presence: true, uniqueness: {case_sensitive: false}
	
end
