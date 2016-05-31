class Piece < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  validates_presence_of :published_date
  validates_presence_of :title
  validates_presence_of :place
  validates_presence_of :piece_type
  validates_presence_of :tech_spec
  validates_presence_of :measurement

end
