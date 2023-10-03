class TeamMember < ApplicationRecord
  belongs_to :user
  belongs_to :team_admin
end
