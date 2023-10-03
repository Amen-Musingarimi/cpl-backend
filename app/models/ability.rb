class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.system_admin?
      can :manage, :all
    elsif user.league_admin?
      can :manage, League # Example: Allow league admins to manage leagues
    elsif user.team_admin?
      can :manage, Team # Example: Allow team admins to manage teams
    elsif user.team_member?
      can :read, Team # Example: Allow team members to view teams
    else
      # Default abilities for non-logged-in users
    end
  end
end
