class Article < ApplicationRecord
  belongs_to :category

  validates :category, :title, :contact_email , {presence: true}

  before_save :create_key

  def create_key
    self.key = ""
    8.times {|n| self.key += ("a".."z").to_a.sample}
  end
end