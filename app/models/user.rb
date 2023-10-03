class User < ApplicationRecord
  has_one :league_admin
  has_one :team_admin
  has_one :team_member

  has_secure_password

  enum team_role: {
    system_admin: 'system_admin',
    league_admin: 'league_admin',
    team_admin: 'team_admin',
    team_member: 'team_member'
  }

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
