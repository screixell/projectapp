# == Schema Information
#
# Table name: borrowers
#
#  id              :integer          not null, primary key
#  code            :string
#  credit          :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  status          :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Borrower < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
