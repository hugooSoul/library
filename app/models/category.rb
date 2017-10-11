class Category < ApplicationRecord

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  validates :name, presence: true, with: :validate_name_regex, on: :create
  validates :description, presence: true, on: :create

  private

  def slug_candidates
    [
      :name,
      [:name]
    ]
  end

  def validate_name_regex
    unless name =~ /^[a-zA-Z\s]*$/
      errors.add(:name,"This field just can have a-z or A-Z")
      errors.add(:name,"The field must to start with a-z")
    end
  end

end
