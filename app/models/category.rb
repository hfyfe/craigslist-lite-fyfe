class Category < ApplicationRecord
  has_many :articles

  validates_uniqueness_of :name
  validates :name , {presence: true}
end