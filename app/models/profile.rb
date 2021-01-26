class Profile < ApplicationRecord
has_one_attached :image

belongs_to :user, optional: true

validates :text, presence: true
validates :body, presence: true
validates :image, presence: true

end
