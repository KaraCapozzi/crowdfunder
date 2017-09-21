class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :user, :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_future
  validate :end_date_later_than_start_date
  validate :goal_must_be_positive_number


  def start_date_future
    if start_date < Date.today
      errors.add(:start_date, message:"Start date should be in the future.")
    end
  end

  def end_date_later_than_start_date
    if end_date < start_date
      errors.add(:end_date, message: "End date has to be later than start date.")
    end
  end

  def goal_must_be_positive_number
    if !goal.positive?
      errors.add(:goal, message: "Goal must be a positive number")
    end
  end
end
