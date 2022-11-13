class FriendRequest < ApplicationRecord
  belongs_to :requestor
  belongs_to :receiver
end
