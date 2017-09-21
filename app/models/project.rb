class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :user, :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_future

  def start_date_future
    if start_date < Date.today
      errors.add(:start_date, message:"Start date should be in the future.")
    end
  end

  def end_date_later_than_start_date
    if start_date < end_date
      errors.add(:end_date, message: "End date has to be later than start date.")

    end


  end
end
