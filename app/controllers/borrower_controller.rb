class BorrowerController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force borrowers to sign in before any other actions.
  skip_before_action(:force_borrower_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def index
    render({ :template => "borrower/index.html.erb" })
  end

  def sign_in_form
    render({ :template => "borrower/sign_in.html.erb" })
  end

  def create_cookie
    borrower = Borrower.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if borrower != nil

      if borrower.status=="Inactive"
        redirect_to("/borrower_sign_in", { :alert => "User not active. Please contact an admin" })
        
      else
            are_they_legit = borrower.authenticate(the_supplied_password)
          
             
          
            if are_they_legit == false
              redirect_to("/borrower_sign_in", { :alert => "Incorrect password." })
            else
              session[:borrower_id] = borrower.id
              session[:username] = borrower.username
              session[:status]= borrower.status

              redirect_to("/", { :notice => "Signed in successfully." })
            end
      end
    else
      redirect_to("/borrower_sign_in", { :alert => "No borrower with that email address." })
    end
  end


  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "borrower/sign_up.html.erb" })
  end

  def create
    @borrower = Borrower.new
    @borrower.password = params.fetch("query_password")
    @borrower.password_confirmation = params.fetch("query_password_confirmation")
    @borrower.username = params.fetch("query_username")
    @borrower.first_name = params.fetch("query_first_name")
    @borrower.last_name = params.fetch("query_last_name")
    @borrower.code = params.fetch("query_code")
    @borrower.email = params.fetch("query_email")
    @borrower.credit = params.fetch("query_credit")
    @borrower.status = params.fetch("query_status")

    save_status = @borrower.save

    if save_status == true
     
      redirect_to("/", { :notice => "Borrower account created successfully. Please talk to admin to activate."})
      reset_session

    else
      redirect_to("/borrower_sign_up", { :alert => @borrower.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "borrower/edit_profile.html.erb" })
  end

  def update
    @borrower = @current_borrower
    @borrower.password = params.fetch("query_password")
    @borrower.password_confirmation = params.fetch("query_password_confirmation")
    @borrower.username = params.fetch("query_username")
    @borrower.first_name = params.fetch("query_first_name")
    @borrower.last_name = params.fetch("query_last_name")
    @borrower.code = params.fetch("query_code")
    @borrower.email = params.fetch("query_email")
    @borrower.credit = params.fetch("query_credit")
    @borrower.status = params.fetch("query_status")
    
    if @borrower.valid?
      @borrower.save

      redirect_to("/", { :notice => "Borrower account updated successfully."})
    else
      render({ :template => "borrower/edit_profile_with_errors.html.erb" , :alert => @borrower.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_borrower.destroy
    reset_session
    
    redirect_to("/", { :notice => "Borrower account cancelled" })
  end
 
end
