class Post < ApplicationRecord
  validates_presence_of :description
  belongs_to :user
end
