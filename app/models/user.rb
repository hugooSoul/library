class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, with: :validate_name_regex, on: :create
  validates :last_name, presence: true, with: :validate_last_name_regex, on: :create


  private

  def validate_name_regex
    unless name =~ /^[a-zA-Z\s]*$/
      errors.add(:name,"This field just can have a-z or A-Z")
      errors.add(:name,"The field must to start with a-z")
    end
  end

  def validate_last_name_regex
    unless last_name =~ /^[a-zA-Z\s]*$/
      errors.add(:last_name,"This field just can have a-z or A-Z")
      errors.add(:last_name,"The field must to start with a-z")
    end
  end

end
