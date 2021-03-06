class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authors_all, only: [:show, :edit, :new]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.date_insert = DateTime.now.to_date
    @book.status=@book.status.to_i
    # @book.status = "queue"

    # respond_to do |format|
      if @book.save
        # format.html { redirect_to @book, notice: 'Book was successfully created.' }
        # format.json { render :show, status: :created, location: @book }
        flash[:notice] = "Book saved"
        redirect_to books_path
      else
        authors_all
        # format.html { render :new }
        # format.json { render json: @book.errors, status: :unprocessable_entity }        
        render action: 'new'
      end
    # end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    #@book.status = Book.read_statuses.index(@book.status).to_i

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def authors_all
      @authors = Author.all
    end

    def set_statuses
      @statuses = Book.status.map
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author_id, :status, :why_want_read, :review, :raiting, :date_insert, :date_start_reading, :date_finish_reading)
    end
end
