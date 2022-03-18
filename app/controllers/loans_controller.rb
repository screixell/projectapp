class LoansController < ApplicationController
  def index
    matching_loans = Loan.all

    @list_of_loans = matching_loans.order({ :created_at => :desc })

    render({ :template => "loans/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_loans = Loan.where({ :id => the_id })

    @the_loan = matching_loans.at(0)

    render({ :template => "loans/show.html.erb" })
  end

  def user_show
    the_username = session.fetch(:username)

    matching_loans = Loan.where({ :username => the_username })

    @the_loan = matching_loans.at(0)

    render({ :template => "loans/user.html.erb" })
  end

  def create
    the_loan = Loan.new
    the_loan.disbursed_amount = params.fetch("query_disbursed_amount")
    the_loan.username = params.fetch("query_username")

    if the_loan.valid?
      the_loan.save
      redirect_to("/loans", { :notice => "Loan created successfully." })
    else
      redirect_to("/loans", { :alert => the_loan.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_loan = Loan.where({ :id => the_id }).at(0)

    the_loan.disbursed_amount = params.fetch("query_disbursed_amount")
    the_loan.username = params.fetch("query_username")

    if the_loan.valid?
      the_loan.save
      redirect_to("/loans/#{the_loan.id}", { :notice => "Loan updated successfully."} )
    else
      redirect_to("/loans/#{the_loan.id}", { :alert => the_loan.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_loan = Loan.where({ :id => the_id }).at(0)

    the_loan.destroy

    redirect_to("/loans", { :notice => "Loan deleted successfully."} )
  end
end
