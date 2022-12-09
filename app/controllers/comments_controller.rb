class CommentsController < ApplicationController
  before_action :set_travel_plan, only: [:create, :edit, :update]
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    # @team = Team.find(params[:id])
    # @team = Team.find(params[:team_id])
    # @travel_plan = TravelPlan.find(params[:travel_plan_id])
    # @comment = @team.comments.build(comment_params)
    @comment = @travel_plan.comments.build(comment_params)
    # byebug
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to team_travel_plan_comments_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = @travel_plan.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @travel_plan.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:content)
  end
  def set_travel_plan
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
  end
end
