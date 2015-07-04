class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :priority

  scope :active, -> {
    where(:completed => false)
  }
end
