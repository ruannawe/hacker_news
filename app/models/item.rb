class Item < ApplicationRecord
  enum item_type: %i(story comment)
end
