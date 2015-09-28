class Log < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  belongs_to :user
  has_many :topics

  accepts_nested_attributes_for :topics
end
