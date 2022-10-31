class BookCommentsController < ApplicationController

  def create
    # params[:book_id] book の id を取得
    # :book_id の部分は routes のネストしたところで確認できる
    book = Book.find(params[:book_id])

    comment = current_user.book_comments.new(book_comment_params)
    # 以下の2行の省略形
    # comment = BookComment.new(book_comment_params)
    # comment.user_id = current_user.id

    comment.book_id = book.id

    if comment.save()
      redirect_to book_path(book)
    else
      @new_book = Book.new()
      @book = Book.find(params[:book_id])
      @book_comment = BookComment.new()
      render template: "books/show"
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy()
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
