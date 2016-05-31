class Project < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :published_date

end
