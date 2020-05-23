class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :author, presence: true
  validates :status, presence: true
  
  enum read_status: {queue: "queue desc", reading: "reading", suspended: "suspended", read: "read"} #, _prefix: :status
  STATUS_SELECT = read_statuses.map.with_index {|r, i| [r.second.to_s, i] }

  def status_desc
    Book.read_statuses.map {|r| [r] }[status].first.second.to_s
  end
end
