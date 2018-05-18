require 'faker'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
      self.find(Faker::Number.between(0, self.count))
  end
end
