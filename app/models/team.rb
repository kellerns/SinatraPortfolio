class Team < ActiveRecord::Base
  belongs_to :user
  validates :name, :league, :quarterback, :running_back_one, :running_back_two, :wide_receiver_one, :wide_receiver_two, :tight_end, :kicker, :defense, :wins, :losses, presence: true
end
