class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_membership, only: [:edit, :update]

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to root_path, notice: "You've been added as an #{@membership.role} to the selected company."
    else
      flash.now[:alert] = 'Something went wrong. Please try again.'
      render :new
    end
  end

  def edit
  end

  def update
    if @membership.update(membership_params)
      redirect_to root_path, notice: 'Membership was successfully updated.'
    else
      flash.now[:alert] = 'Something went wrong. Please try again.'
      render :edit
    end
  end

  private

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:company_id, :user_id, :role)
  end
end
