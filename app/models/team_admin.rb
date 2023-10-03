class TeamAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :team_admin, class_name: 'User'
end
