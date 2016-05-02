class Photo < ActiveRecord::Base
  belongs_to :project, polymorphic: true
  belongs_to :piece, polymorphic: true

  has_attached_file :img, styles: { medium: "640x480>", thumb: "200x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  # validates_attachment_size :img, :less_than => 3.megabytes
  validates_with AttachmentSizeValidator, attributes: :img, less_than: 1.megabytes
end
