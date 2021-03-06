class Enterprise::GeneralManagement::ContactDetails::LinksController < GenericResourceController

  def setup_controller
    setup_variables( Link,
                     'Link',
                     'Communication Assets',
                     ['contact_detail_id'],
                     ['label','owner'],
                     @@routes.enterprise_general_management_contact_details_path)
  end

  def process_form(my_link, current_params, wizard_mode = nil)

    link_processing = Proc.new do
      my_link.service = current_params[:service]
      my_link.url = current_params[:url]
      my_link.remark = current_params[:remark]
      my_link.contact_detail_id = current_params[:contact_detail_id]
      my_link.save!
    end

    setup_process(my_link, link_processing, wizard_mode)
  end

end
