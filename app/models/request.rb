class Request < ActiveRecord::Base
  attr_accessible :job_size, :offer, :requester_id

  validates_presence_of :requester, :job_size, :offer

  belongs_to :requester, :class_name => 'User', :foreign_key => 'requester_id'
  belongs_to :shoveler, :class_name => 'User', :foreign_key => 'shoveler_id'

  SIZES = %w[small medium big]
  validates_inclusion_of :job_size, :in => SIZES, :message => 'Please choose small, medium, or big'

  OFFERS = [0, 10, 20, 30, 50]
  validates_inclusion_of :offer, :in => OFFERS, :message => 'Please indicate how much you are willing to offer'
  validates :offer, :numericality => true

end
