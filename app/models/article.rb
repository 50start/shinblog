class Article < ApplicationRecord
has_one_attached :image

belongs_to :user, optional: true

validates :title, presence: true
validates :body, presence: true
validates :image, presence: true

end
