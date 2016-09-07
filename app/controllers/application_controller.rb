class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_book #now available in all views

  def most_recent_book
    book = Book.find_by(id: session[:most_recent_book_id]) if session[:most_recent_book_id]
    if book
      book
    else
      session[:most_recent_book_id] = Book.last.id
      Book.last
    end
  end

end
