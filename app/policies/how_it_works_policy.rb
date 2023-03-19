class HowItWorksPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Define any authorization policies for this model
  # Example: def update?
  #              user.admin? || record.owner == user
  #          end
end
