class Note < ActiveRecord::Base
  belongs_to :user
  validates :note, presence: true

end
