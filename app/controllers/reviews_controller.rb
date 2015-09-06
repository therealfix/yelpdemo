# This is the BaseRails' 'official' version from
# https://github.com/BaseRails/yelpdemo/blob/master/app/controllers/reviews_controller.rb

# The old old, buggy review_controller.rb has been moved to yelpdemo/old_review_controller.txt
# It can also be found as a jpg at 
# https://www.dropbox.com/sh/fztp1gk95z52z3x/AAAjqA5NfKT7oZAXDtWK1Se5a?dl=0&preview=Yelpdemo+buggy+reviews+controller.JPG

# I've made many changes (commenting out, more) to the 'offical' version by side-by-side comparison of the video. 
# I'm changing the code because I'm only at step 7. Build a review scaffold at the moment.
# Eventually the controller will look exactly the same as the official.

class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
 
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save             # changed from redirect_to @restaurant
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        #  format.html { redirect_to restaurant_path(@restaurant),
        format.html { redirect_to (@review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      # format.html { redirect_to restaurant_path(@restaurant),
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # The private functions below are from the finalized master from BaseRails GitHub. They probably (probably!) won't cause any issue from now until I'm done with the project. 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def check_user
      unless (@review.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end