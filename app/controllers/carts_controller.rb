class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]


  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(user_id: current_user.id, purchased: false)
    
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    render json: @cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.find_by(user_id: current_user.id ,product_id: cart_params[:product_id], purchased: false)
    if @cart.present?
      @cart.quantity += 1
      @cart.total_price += cart_params[:total_price].to_f
    else
      @cart = Cart.new(cart_params)
      @cart.user_id = current_user.id
      @cart.quantity = 1
    end
    if @cart.save
        render json: @cart, status: 200
    else
        render json: {errors: @cart.errors.full_messages}, status: 400
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:quantity, :total_price, :product_id)
    end
end
