class ScoresController < ApplicationController
    def index
        scores = Score.order(score: :desc).limit(3)
        render json: ScoreSerializer.new(scores)
    end

    def create
        user = User.find_by(username: params[:username])
        score = Score.new(:user_id => user.id, :score => params[:score])
        if score.save
            scores= Score.order(score: :desc).limit(3)
            render json: ScoreSerializer.new(scores)
        end
    end

    private
    def score_params
        params.require(:score).permit(:score, :username)
    end
end
