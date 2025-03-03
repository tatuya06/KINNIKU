class TrainingResult < ApplicationRecord
    belongs_to :user
  
    validates :bench_press, :deadlift, :barbell_squat, :dumbbell_arm_curl, :pullup, numericality: { only_integer: true, allow_nil: true }
  end