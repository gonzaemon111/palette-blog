class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy, class_name: "Comment"
end
