json.extract! book, :id, :title, :author_id, :status, :why_want_read, :review, :raiting, :data_insert, :date_start_reading, :date_finish_reading, :created_at, :updated_at
json.url book_url(book, format: :json)
