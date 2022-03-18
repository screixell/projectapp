# == Schema Information
#
# Table name: loans
#
#  id               :integer          not null, primary key
#  disbursed_amount :string
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Loan < ApplicationRecord
end
