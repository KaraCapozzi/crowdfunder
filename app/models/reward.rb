class Reward < ActiveRecord::Base
  belongs_to :project
  validates :description, :dollar_amount, presence: true
  validate :reward_must_be_positive

  def reward_must_be_positive
    if  dollar_amount.present? &&  dollar_amount.negative?
      errors.add(:dollar_amount, message: "Dollar amount must be positive.")
    end
  end
end
