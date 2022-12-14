class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save()
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all()
      render :index
    end
  end

  def index
    @book = Book.new()
    @books = Book.all()
  end

  def show
    # 新規投稿用
    @new_book = Book.new()

    @book = Book.find(params[:id])

    # コメント用
    @book_comment = BookComment.new()
  end

  def edit
    @book = Book.find(params[:id])
    # 他ユーザーが投稿した book の編集画面に遷移しない設定
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy()
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
