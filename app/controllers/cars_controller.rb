class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :filter_search]
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
      @cars = Car.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
    else
      @cars = Car.order(created_at: :desc).limit(15)
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end

  # def filter_search

  # end

  def automatics
    @cars = Car.where(engine: "automatique")
  end

  def manuels
    @cars = Car.where(engine: "manuelle")
  end

  def my_cars
    @cars = Car.where(user_id: current_user.id)
  end

  def show
    set_car
    @booking = Booking.new
    @marker = @car.geocode.map do {
      lat: @car.latitude,
      lng: @car.longitude
    }
    end
    @bookings = @car.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_at,
        to: booking.end_at
      }
    end
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

  # ----------------------------------------------------- #
  def filter
    # .where(engine: "Automatique")
    # .where(engine: "Manuelle")

    # .where(fuel: "Essence")
    # .where(fuel: "Diesel")

    # .where(seats: 3)
    # .where(seats: 4)
    # .where(seats: 5)
    # .where(seats: 6)
    # .where(:seats > 6)

    # .where(:year_of_production < 2000)
    # .where(:year_of_production.between?(2000,2010))
    # .where(:year_of_production > 2010)

    # .where(:price_per_day < 20)
    # .where(:price_per_day.between?(20..50))
    # .where(:price_per_day.between?(50..100))
    # .where(:price_per_day > 100)

    # --------------------------------------------------#

    # @cars = Car.where
  end
  # ----------------------------------------------------- #

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production,
                                :address, :price_per_day, :engine, :fuel,
                                :kilometers, :seats, :photo)
  end
end
