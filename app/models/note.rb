class Note < ApplicationRecord

  validates :subject, presence: true
  validates :content, presence: true
  belongs_to :appointment, counter_cache: false
  belongs_to :user




end
