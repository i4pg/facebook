class Friend < ApplicationRecord
  belongs_to :requestor_user
  belongs_to :receiver_user
end
