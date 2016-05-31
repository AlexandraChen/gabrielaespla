class Text < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :published_date
  validates_presence_of :place
end
