class Article < ApplicationRecord
  belongs_to :category

  validates :category, :title, :contact_email , {presence: true}
end