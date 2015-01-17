class WikiPolicy < ApplicationPolicy

	def show?
		!record.private? || user.admin? || user.premium?
	end
end