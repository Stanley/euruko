require 'paperclip'

class Presentation < ActiveRecord::Base
  validates_inclusion_of :length, :in => ["standard", "long", "lightning"]

  validates_presence_of :topic
  validates_presence_of :description
  validates_presence_of :user

  belongs_to :user

  has_attached_file :photo, :styles => { :normal => "300x300", :thumb => "100x100" }

  before_validation :assign_user
  after_validation :add_speaker_errors

  attr_accessor :speaker_id

  alias owner user

  def assign_user
    self.user = User.find(speaker_id) unless user rescue nil
  end

  def add_speaker_errors
    errors.add(:speaker_id, "Choose user") if user.blank?
  end
end
