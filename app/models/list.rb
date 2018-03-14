class List < ApplicationRecord
  validates_presence_of :name, :due_time, :note
end
