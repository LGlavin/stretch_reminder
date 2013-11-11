class Reminder < ActiveRecord::Base
validates :description, presence: true, length: { maximum: 200 }
validates :dispatch_time, presence: true
validates :user, presence: true

belongs_to :user
end