class WikiPolicy < ApplicationPolicy

	def show?
		!record.private? || user.role?("admin", "premium")
	end
end