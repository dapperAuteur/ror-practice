# this is the solution I created on my own
# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.first_name.starts_with? 'A' || 'E' || 'I' || 'O' || 'U'
#       record.errors[:first_name] << 'Need a first name starting with a vowel please!'
#     end
#   end
# end

class Player < ApplicationRecord
  validates :first_name, :presence => true
  validates :last_name, presence: true, on: :create
  validates :age, presence: true, numericality: { greater_than: 0, less_than: 100 }
  # the next two lines are part of the solution I created on my own
  # includes ActiveModel::Validations
  # validates_with MyValidator

  validate :first_name, :first_name_starts_with_vowel

  def first_name_starts_with_vowel
    vowels = ['a', 'e', 'i', 'o', 'u']
    unless vowels.include? self.first_name[0].downcase
      errors.add(:first_name, "must start with a vowel")
    end
  end
end
