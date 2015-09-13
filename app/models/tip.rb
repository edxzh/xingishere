class Tip < ActiveRecord::Base
  validates :content, presence: true
end
