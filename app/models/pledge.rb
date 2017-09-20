class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cant_back_own_project

  # Owner should not be able to pledge towards own project

  def owner_cant_back_own_project
    if user == project.user
      errors.add(:name, message: "cant pledge to own project")
    end
#if owners is is in project
#return error


end

end
