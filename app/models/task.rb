class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :priority

  scope :active, -> (cond) {
    return where(:completed => false, :deleted => false) if cond == 1
    return where(:completed => true, :deleted => false) if cond == 2
    return where(:deleted => false)
  }
end
