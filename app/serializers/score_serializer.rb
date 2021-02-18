class ScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :score, :user
end
