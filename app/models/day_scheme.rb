class DayScheme < ApplicationRecord

  include GenericResourceCommon
  setup_model('life-ring',
              'type_name',
              @@routes.enterprise_human_resources_payroll_day_schemes_path,
              Enterprise::HumanResources::Payroll::DaySchemesController )

  include Remark
  include ImplementedAt
  validates :implemented_at, presence: true

  validates :type_name, length: { in: 2..64 }, presence: true
  validates_numericality_of :base_multiplier
  validates_numericality_of :overtime_multiplier
  validates_numericality_of :rest_day_multiplier
  validates_numericality_of :overtime_rest_day_multiplier


end
