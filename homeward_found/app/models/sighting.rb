class Sighting < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :style => {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
