class MasterMenu < ApplicationRecord
    # バリデーション（必要に応じて追加）
    validates :menu_name, presence: true
  
    # 関連付け（例: schedule との関連付け）
    has_many :schedules, foreign_key: :menu_id, dependent: :destroy
  end
  