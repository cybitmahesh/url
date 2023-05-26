class Url < ApplicationRecord
    validates :original, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  
    before_create :generate_shortened_url
  
    def generate_shortened_url
      self.shortened = SecureRandom.hex(4)
    end
  end