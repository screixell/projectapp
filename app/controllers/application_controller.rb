class ApplicationController < ActionController::Base
  before_action(:load_current_borrower)
  
  # Uncomment line 5 in this file and line 3 in BorrowerAuthenticationController if you want to force borrowers to sign in before any other actions.
  # before_action(:force_borrower_sign_in)
  
  def load_current_borrower
    the_id = session[:borrower_id]
    
    @current_borrower = Borrower.where({ :id => the_id }).first
  end
  
  def force_borrower_sign_in
    if @current_borrower == nil
      redirect_to("/borrower_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
