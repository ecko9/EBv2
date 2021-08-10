class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :participations
  has_many :participants, through: :participations, class_name: "User"

  validates :start_date, presence: true, if: :start_date_need_be_positive
  validates :duration, presence: true, if: :duration_need_be_multiple_of_five_and_positive
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, less_than: 1001, greater_than: 0 }
  validates :location, presence: true


  def start_date_need_be_positive
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def duration_need_be_multiple_of_five_and_positive
    if (duration % 5) != 0 && duration < 0
      errors.add(:duration, "need be multiple of 5 and positive")
    end
  end
end
