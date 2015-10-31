require 'set'

class Log < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  include ActiveModel::Dirty

  LABEL_REGEXP = /(#(?<label>[\w]+)|\[(?<label>[\w]+)\])+/i


  belongs_to :user
  has_many :topics

  accepts_nested_attributes_for :topics
  acts_as_taggable_on :labels

  before_save :set_labels

  def set_labels
    if title_changed?
      labels = extract_labels title
      self.label_list = labels
    end
  end

  # @param [String] input_text
  # @param [Set]    labels      Cumulative list of found labels
  #
  # @return [Array] List of found labels
  def extract_labels input_text, labels = Set.new
    found = input_text.match(LABEL_REGEXP)

    if found && found[:label]
      labels << found[:label].downcase

      extract_labels input_text.gsub(found[:label], ''),
                     labels
    else
      labels.to_a
    end
  end
end
