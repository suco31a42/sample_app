class User < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "gender", "height", "id", "name", "updated_at", "weight"]
  end
end
