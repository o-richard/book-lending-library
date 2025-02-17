require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create(title: "Test Book", author: "Test Author", description: "Test Description")
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should get show" do
    get book_path(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_path
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count', 1) do
      post books_path, params: { book: { title: "New Book", author: "New Author", description: "New Description" } }
    end
    assert_redirected_to book_path(Book.last)
  end

  test "should get edit" do
    get edit_book_path(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_path(@book), params: { book: { title: "Updated Title" } }
    assert_redirected_to book_path(@book)
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_path(@book)
    end
    assert_redirected_to books_path
  end
end
