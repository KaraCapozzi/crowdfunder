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
end
