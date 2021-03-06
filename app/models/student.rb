# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  address                :string
#  city                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firstname              :string
#  lastname               :string
#  nis                    :string
#  periode                :string
#  phone                  :string
#  province               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  school                 :string
#  status                 :string
#  zipcode                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  major_id               :integer
#
# Indexes
#
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#

class Student < ApplicationRecord
  has_many :reports
  has_many :presences
  has_one_attached :avatar

  belongs_to :major
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def password_required?
	 false
  end

  def full_name
  	"#{firstname} #{lastname}"
  end

end
