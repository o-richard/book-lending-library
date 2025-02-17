require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create(title: "Test Book", author: "Test Author", description: "Test Description")
    @borrowing = @book.borrowings.create(borrower_name: "John Doe", borrowed_at: Time.current)
  end

  test "should create borrowing" do
    assert_difference("Borrowing.count", 1) do
      post book_borrowings_path(@book), params: { borrowing: { borrower_name: "Jane Doe" } }
    end
    assert_redirected_to book_path(@book)
  end

  test "should update borrowing (return book)" do
    patch book_borrowing_path(@book, @borrowing), params: { borrowing: { returned_at: Time.current } }
    assert_redirected_to book_path(@book)
    @borrowing.reload
    assert_not_nil @borrowing.returned_at
  end
end
