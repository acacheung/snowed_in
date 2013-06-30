class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :address, :latitude, :longitude, :old_or_disabled, :role

  validates_presence_of :name, :email, :address, :role

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  ROLES = %w[requester shoveler]
  validates_inclusion_of :role, :in => ROLES, :message => 'Please choose between needing help and shoveling'

  has_many :work_requests, :class_name => 'Request', :foreign_key => :requester_id
  has_many :bids, :class_name => 'Request', :foreign_key => :shoveler_id

  def shoveler?
    role == 'shoveler'
  end

  def requester?
    role == 'requester'
  end

  def has_open_request?
    open_request = []
    work_requests.each do |work_request|
      if work_request.state == 'open' || work_request.state == 'matched'
        open_request << work_request
      end
    end
    open_request.present?
  end

  def past_requests
    @past_requests = []
    work_requests.each do |work_request|
      if work_request.state == 'expired' || work_request.state == 'complete'
        @past_requests << work_request
      end
    end
    @past_requests
  end

end
