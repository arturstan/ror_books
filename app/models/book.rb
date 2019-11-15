class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :author, presence: true
  validates :status, presence: true
  enum status: {queue: "queue 2", reading: "reading 2", suspended: "suspended 2", read: "read 2"} #, _prefix: :status
  STATUS_SELECT = statuses.map {|r| [r.second.to_s, statuses.index(r.second)] }
end
