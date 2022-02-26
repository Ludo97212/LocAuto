class BookingsController < ApplicationController
  def new
    set_car
    @booking = Booking.new
    @bookings = Booking.all
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_at,
        to: booking.end_at
      }
    end
  end

  def create
    set_car
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.end_at >= @booking.start_at
      if @booking.save
        redirect_to car_path(@car)
        flash[:notice] = "Réservation envoyée! Vous pouvez consulter vos demandes depuis votre profil."
        # redirect_to my_bookings_path
      else
        render :new
      end
    else
      render :new
      flash[:alert] = "Erreur au niveau des dates !"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user).order(created_at: :desc)
  end

  def my_demands
    @bookings = Booking.joins(:car).where(cars: { user_id: current_user }).order(created_at: :desc)

    # @booking = Booking.find(params[:id])
    # if @booking.update
    #   redirect_to my_demands_path
    # end
  end

  def show_demand
    @booking = Booking.find(params[:id])
    if @booking.update
      redirect_to my_demands_path
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :car_id, :user_id)
  end
end
