class Note < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :maintag, presence: true, length: { maximum: 30 }
end