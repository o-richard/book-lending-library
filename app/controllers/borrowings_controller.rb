class BorrowingsController < ApplicationController
  before_action :set_book

  def create
    @borrowing = @book.borrowings.new(borrowing_params.merge(borrowed_at: Time.current))
    if @borrowing.save
      redirect_to @book, notice: "Book borrowed successfully."
    else
      redirect_to @book, alert: "Failed to borrow book."
    end
  end

  def update
    @borrowing = @book.borrowings.find(params[:id])
    @borrowing.update(returned_at: Time.current)
    redirect_to @book, notice: "Book returned successfully."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:borrower_name)
  end
end
