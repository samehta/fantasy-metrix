class ReceivingGameLogPolicy < ApplicationPolicy 
  def create?
    user.present? && user.admin?
  end
 
  def update?
    create?
  end
end