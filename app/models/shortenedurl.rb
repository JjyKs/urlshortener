class Shortenedurl < ActiveRecord::Base
  validates :original, presence: true, uniqueness: true
  validates :shortened, uniqueness: true
end
