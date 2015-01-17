class Wiki < ActiveRecord::Base
	belongs_to :user  # the user that created the wiki
	has_many :collaborators
	has_many :users, through: :collaborators  # the users that are collaborators

	scope :privatewiki, -> { where(private: true) }
	scope :publicwiki, -> { where(private: false) }

	def self.visible_to(user)
		user && ["admin", "premium"].include?(user.role) ? self.all : self.publicwiki
	end

	def collaborator_for(user)
		self.collaborators.where(user_id: user.id).first
	end
end
