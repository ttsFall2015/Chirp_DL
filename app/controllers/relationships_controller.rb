class RelationshipsController < ApplicationController

	def create 
		@Relationship = current_user.relationship.build(friend_id: params[:friend_id])

		if @relationship.save 
			flash[:notice] = "Followed Succesfully"
			redirect_to profile_path(current_user.id) 

		else 
			flash[:notice] = "unable to follow"
			redirect_to root_path 	
		end
		
		def destroy 
			@relationship = 
			current_user.relationships.find(params[:id])
			@relationship.destroy
			flash[:notice] = "No Longer Following"
			redirect_to profile_path(current_user.id)
		end

		private
		def relationship_params
			params.require(:relationship) .permit(:user_id, :friend_id)
		end
	end
end