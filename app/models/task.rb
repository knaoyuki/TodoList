class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :priority

  scope :active, -> (cond,id,t_id) {
    return where(:user_id => id, :user_id => t_id, :completed => false, :deleted => false) if cond == 1
    return where(:user_id => id, :user_id => t_id, :completed => true, :deleted => false) if cond == 2
    return where(:user_id => id, :user_id => t_id, :deleted => false)
  }
end
