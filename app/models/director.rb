# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
    validates :name, presence: true, uniqueness: { scope: :dob, message: "Must be unique given DOB" }
    
    has_many :movies, :class_name => "Movie", :foreign_key => "director_id"
end
