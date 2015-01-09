class Wiki < ActiveRecord::Base
	belongs_to :user

	scope :privatewiki, -> { where(private: true) }
	scope :publicwiki, -> { where(private: false) }

	def self.visible_to(user)
		user && ["admin", "premium"].include?(user.role) ? self.all : self.publicwiki
	end
end
