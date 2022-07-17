class Item < ApplicationRecord
  enum item_type: %i(story comment)

  has_many :items
end
