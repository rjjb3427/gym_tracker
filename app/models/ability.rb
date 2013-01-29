class Ability
	include CanCan::Ability

	def initiliaze(user)
		can :read, :all
	end
end