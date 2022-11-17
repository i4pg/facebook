class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    respond_to do |format|
      if @like.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('posts', @like) }
        format.html { redirect_to posts_path, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('posts', @like) }
      format.html { redirect_to root_path, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
