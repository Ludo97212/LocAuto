class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      sql_query = "brand ILIKE :query OR model ILIKE :query OR address ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%").order(brand: :asc)
    else
      @cars = Car.order(brand: :asc).limit(15)
    end
  end

  def my_cars
    @cars = Car.where(user_id: current_user.id)
  end

  def show
    set_car
  end

  def edit
    set_car
  end

  def update
    set_car
    if @car.user == current_user
      if @car.update(car_params)
        redirect_to car_path(@car)
      else
        render :edit
      end
    else
      flash[:alert] = "Vous n'avez pas l'autorisation !!!"
      redirect_to car_path(@car)
    end
  end

  def destroy
    set_car
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production, :address, :price_per_day, :photo)
  end
end
