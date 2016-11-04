class Enterprise::GeneralManagement::VehiclesController < Enterprise::GeneralManagementController

  ApplicationController.new.setup_resource_controller(Vehicle,
                                                      'fa fa-bus',
                                                      'Vehicles',
                                                      'Transportation Assets', @@routes.enterprise_general_management_vehicles_path)

  def index
    setup_table(['primary_image'])
  end

  def search_suggestions
    setup_search_suggestions
  end

  def process_form(my_vehicle, current_params)

    modal_message = "There was a problem with the operation you've requested. Please contact Network Administrator"

    begin
      ActiveRecord::Base.transaction do
        my_vehicle.color = current_params[:color]
        my_vehicle.make = current_params[:make]
        my_vehicle.brand = current_params[:brand]
        my_vehicle.plate_number = current_params[:plate_number]
        my_vehicle.fuel_type = current_params[:fuel_type]
        my_vehicle.description = current_params[:description]
        my_vehicle.date_of_registration = current_params[:date_of_registration]

        uploader = VehicleUploader.new
        uploader.store!(current_params[:primary_image])

        my_vehicle.save!
        modal_message = 'Successful Operation! '

      end
    rescue => ex
      puts ' --------- ERROR START --------- '
      puts ex
      puts ' ---------- ERROR END ---------- '
    end


    redirect_to @@main_resource_path
  end

  def new
    setup_form
  end

  def create
    process_form(Vehicle.new, params[:vehicle])
  end

  def show

  end

  def edit

  end

  def update
    process_form(Vehicle.find(params[:id]), params[@@base_section])
  end

  def destroy

  end

end
