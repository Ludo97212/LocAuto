class ProductsController < CarsController
  before_action :authenticate_user!
  include Wicked::Wizard
  steps :infos_1, :infos_2, :address, :photo
  def show
    @car = Car.new
    @user = current_user
    render_wizard
  end

  def update
    redirect_to wizard_path(@current_step, { brand: params[:brand], model: params[:model],
                            engine: params[:engine], fuel: params[:fuel],
                            kilometers: params[:kilometers], seats: params[:seats],
                            year_of_production: params[:year_of_production],
                            price_per_day: params[:price_per_day],
                            adress: params[:adress], photo: params[:photo] })
  end

  def finish_wizard_path
    car_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production,
                                :address, :price_per_day, :engine, :fuel,
                                :kilometers, :seats, :photo)
  end
end
