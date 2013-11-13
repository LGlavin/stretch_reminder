class Reminder < ActiveRecord::Base
validates :description, presence: true, length: { maximum: 160 }
validates :dispatch_time, presence: true
#validates :user, presence: true
validates_presence_of :datetime

belongs_to :user

DAYS = [['Sunday', 0], ['Monday', 1], ['Tuesday', 2], ['Wednesday', 3], ['Thursday', 4], ['Friday', 5], ['Saturday', 6]]
end
