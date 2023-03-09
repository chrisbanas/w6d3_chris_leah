# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

# chris = User.new(name: "chris", email: "chris@gmail.com")
#
class User < ApplicationRecord
    validates :email, :name, presence: true
end
