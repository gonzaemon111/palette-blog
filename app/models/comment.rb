class Comment < ApplicationRecord
  belongs_to :blog, required: true
end
