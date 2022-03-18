Rails.application.routes.draw do

  get("/", { :controller => "borrower", :action => "index" })

  get("/borrowers", { :controller => "borrower", :action => "index" })

  # Routes for the Loan resource:

  # CREATE
  post("/insert_loan", { :controller => "loans", :action => "create" })
          
  # READ
  get("/loans", { :controller => "loans", :action => "index" })
  
  get("/loans/:path_id", { :controller => "loans", :action => "show" })

  get("/loans_user", { :controller => "loans", :action => "user_show" })

  
  # UPDATE
  
  post("/modify_loan/:path_id", { :controller => "loans", :action => "update" })
  
  # DELETE
  get("/delete_loan/:path_id", { :controller => "loans", :action => "destroy" })

  #------------------------------

  # Routes for the Borrower account:

  # SIGN UP FORM
  get("/borrower_sign_up", { :controller => "borrower", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_borrower", { :controller => "borrower", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_borrower_profile", { :controller => "borrower", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_borrower", { :controller => "borrower", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_borrower_account", { :controller => "borrower", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/borrower_sign_in", { :controller => "borrower", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/borrower_verify_credentials", { :controller => "borrower", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/borrower_sign_out", { :controller => "borrower", :action => "destroy_cookies" })
             
  #------------------------------

end
