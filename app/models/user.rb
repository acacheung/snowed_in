class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :street, :city, :state, :zipcode, :role

  ROLES = %w[requester shoveler]
  validates_inclusion_of :role, :in => ROLES, :message => 'Please choose between needing help and shoveling'
  validates_presence_of :role

  validates :state, :allow_blank => true, :format => { :with => /\b([A-Z]{2})\b/, :message => 'Must be a valid US state' }

  validates :zipcode, :presence => true, :format => { :with => /\b(\d{5})\b/, :message => 'Must be a valid US zipcode' }

  has_many :work_requests, :class_name => 'Request', :foreign_key => :requester_id
  has_many :bids, :class_name => 'Request', :foreign_key => :shoveler_id

  def shoveler?
    role == 'shoveler'
  end

  def requester?
    role == 'requester'
  end

end
