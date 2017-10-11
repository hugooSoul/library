class Book < ApplicationRecord

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true, with: :validate_name_regex, on: :create
  validates :author, presence: true, with: :validate_author_regex, on: :create
  validates :category, :published_date, presence: true, on: :create

  validates :published_date, date: { before: Proc.new { Date.today }, message: 'must be before today' }, on: :create
  validates :published_date, date: { before: Proc.new { Date.today }, message: 'must be before today' }, on: :update

  private

  def slug_candidates
    [
      :name,
      [:name  , :name]
    ]
  end

  def validate_name_regex
    unless name =~ /^[a-zA-Z\s]*$/
      errors.add(:name,"This field just can have a-z or A-Z")
      errors.add(:name,"The field must to start with a-z")
    end
  end

  def validate_author_regex
    unless author =~ /^[a-zA-Z\s]*$/
      errors.add(:author,"This field just can have a-z or A-Z")
      errors.add(:author,"The field must to start with a-z")
    end
  end

end
