class ScoresController < ApplicationController
    def index
        scores = Score.all
        render json: ScoreSerializer.new(scores).to_serialized_json
    end
      
    def show
        score = Score.find(params[:id])
        render json: ScoreSerializer.new(score).to_serialized_json
    end
end
