class ApplicationDecorator < Drape::Decorator

  delegate_all
  @@routes = Rails.application

  include TimestampDecorator
  include IdentificationDecorator

  require 'mab/kernel_method'

  def output_html_structure(html_structure)
    html_structure.to_s.html_safe
  end

end