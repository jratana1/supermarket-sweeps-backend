class ScoresController < ApplicationController
    def index
        scores = Score.all
        render json: ScoreSerializer.new(scores)
    end

    def create
        user = User.find_by(id: params[:user_id])
        score = user.scores.build(score_params)
        if score.save
            render json: ScoreSerializer.new(score)
        end
    end

    private
    def score_params
        params.require(:score).permit(:score, :user_id)
    end
end
