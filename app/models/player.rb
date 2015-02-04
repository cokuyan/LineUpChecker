class Player < ActiveRecord::Base
  validates :name, :rank, :school_id, presence: :true
  validates :gender, presence: { in: ['m', 'f'] }

  belongs_to :school
end
