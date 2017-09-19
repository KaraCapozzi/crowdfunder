class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cant_back_own_project

  # Owner should not be able to pledge towards own project

  def owner_cant_back_own_project
    # @user = user
    user = @project.user
    @project = self.project.user

    if @pledge.user == owner
      error[notice: "cant pledge to own project"]
    end


  end

end
