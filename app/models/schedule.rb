class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :master_menu, foreign_key: 'menu_id'

  validates :youbi_kbn, presence: true
  validates :menu_id, presence: true
  validates :weight, numericality: true
  # 他のバリデーションがあれば確認
end
