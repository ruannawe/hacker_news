class Item < ApplicationRecord
  enum :type, %i(story comment)
end
