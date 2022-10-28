class Note < ApplicationRecord

  validates :subject, presence: true
  validates :content, presence: true
  belongs_to :appointment, counter_cache: false #Note: counter_cache is used for notes_counts
  belongs_to :user




end
