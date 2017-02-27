class RegularWorkPeriodDecorator < ApplicationDecorator
  delegate_all

  include ImplementedAtDecorator
  include AssociatedEmployeeDecorator
  include TimePrecedenceDecorator

end