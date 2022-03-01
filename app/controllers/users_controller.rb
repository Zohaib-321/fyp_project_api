class UsersController < ApplicationController
skip_before_action :authenticate_request

 
 def create
    @user = User.new(user_params)
    @user.save
    if params[:detail_type] == "distributor"
        
        @distributor = Distributor.create( 
          name: params[:name],
          license: params[:license],
          number: params[:number],
          users_id: @user.id
          )
          @distributor.save
      
        
    elsif params[:detail_type] == "manufactor"
        @manufactor = Manufactor.create(
          name: params[:name],
          license: params[:license],
          address: params[:address],
          number: params[:number],
          distributor_id: params[:distributor_id],
          users_id: @user.id
        )
        @manufactor.save
    
    elsif params[:detail_type] == "medstore"
        @medstore = Medstore.create(
          name: params[:name],
          license: params[:license],
          number: params[:number],
          address: params[:address],
          users_id: @user.id
        )
        @medstore.save
    end
    render json: @user

end




private

  def user_params
    params.permit(:username, :email, :password, :detail_type)
  end

 # def manufactor_params
  #params.permit(:name, :address, :license, :number)
  #end
end