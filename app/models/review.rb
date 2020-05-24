class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :reviewer, class_name: 'User', foreign_key: :user_id
end
