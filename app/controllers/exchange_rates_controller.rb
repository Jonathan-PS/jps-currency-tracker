class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: %i[ show edit update destroy ]

  # GET /exchange_rates or /exchange_rates.json
  def index
    @exchange_rates = ExchangeRate.all
  end

  # GET /exchange_rates/1 or /exchange_rates/1.json
  def show
  end

  # GET /exchange_rates/new
  def new
    @exchange_rate = ExchangeRate.new
  end

  # GET /exchange_rates/1/edit
  def edit
  end

  # POST /exchange_rates or /exchange_rates.json
  def create
    @exchange_rate = ExchangeRate.new(exchange_rate_params)

    respond_to do |format|
      if @exchange_rate.save
        format.html { redirect_to @exchange_rate, notice: "Exchange rate was successfully created." }
        format.json { render :show, status: :created, location: @exchange_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchange_rates/1 or /exchange_rates/1.json
  def update
    respond_to do |format|
      if @exchange_rate.update(exchange_rate_params)
        format.html { redirect_to @exchange_rate, notice: "Exchange rate was successfully updated." }
        format.json { render :show, status: :ok, location: @exchange_rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchange_rates/1 or /exchange_rates/1.json
  def destroy
    @exchange_rate.destroy!

    respond_to do |format|
      format.html { redirect_to exchange_rates_path, status: :see_other, notice: "Exchange rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange_rate
      @exchange_rate = ExchangeRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exchange_rate_params
      params.require(:exchange_rate).permit(:timestamp, :date, :base_symbol, :target_symbol, :rate)
    end
end
