class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :street, :city, :state, :zipcode, :role
  # attr_accessible :title, :body

  validates_presence_of :zipcode

  ROLES = %w[requester shoveler]

  validates_inclusion_of :role, :in => ROLES, :message => 'Please choose between needing help and shoveling'
  validates_presence_of :role

  validates :state, :format => { :with => /\b([A-Z]{2})\b/, :message => 'Must be a valid US state' }
  validates :zipcode, :format => { :with => /\b(\d{5})\b/, :message => 'Must be a valid US zipcode' }
end
