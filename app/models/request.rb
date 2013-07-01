include ActionView::Helpers::TextHelper

class Request < ActiveRecord::Base

  attr_accessible :requester_id, :job_size, :offer, :state

  validates_presence_of :requester, :job_size, :offer, :state

  belongs_to :requester, :class_name => 'User', :foreign_key => 'requester_id'
  belongs_to :shoveler, :class_name => 'User', :foreign_key => 'shoveler_id'

  has_many  :comments,
            inverse_of: :request,
            dependent: :destroy

  SIZES = %w[small medium big]
  validates_inclusion_of :job_size, :in => SIZES, :message => 'Please choose small, medium, or big'

  OFFERS = [0, 10, 20, 30, 50]
  validates_inclusion_of :offer, :in => OFFERS, :message => 'Please indicate how much you are willing to offer'
  validates :offer, :numericality => true

  STATES = %w[open matched complete expired cancelled]
  validates_inclusion_of :state, :in => STATES

  def volunteer?
    offer == 0
  end

  def for_money?
    offer > 0
  end

  def format_for_money(offer)
    unless offer == 0
      "$#{offer} for a"
    end
  end

  def format_job_size(job_size)
    "#{job_size.upcase}"
  end

  def ago(created_at)
    ago = (Time.now - created_at).to_i
    if ago < 60
      "#{pluralize(ago, 'second')}"
    elsif ago < 3600
      "#{pluralize(ago / 60, 'minute')}"
    elsif ago < 86400
      "#{pluralize(ago / 3600, 'hour')}"
    else
      "#{pluralize(ago / 86400, 'day')}"
    end
  end

  def format_request(request)
    "#{format_for_money(offer)} #{format_job_size(job_size)}-sized shoveling request at #{requester.address} (posted #{ago(created_at)} ago)"
  end

  def open?
    state == 'open'
  end

  def matched?
    state == 'matched'
  end

  def complete?
    state == 'complete'
  end

  def cancelled?
    state == 'cancelled'
  end

  def expired?
    state == 'expired'
  end

  def matched(request)
    request.state = 'matched'
  end

  def completed(request)
    request.state = 'complete'
  end

  def cancel(request)
    request.state = 'cancelled'
  end

  def self.near(shoveler)
    nearby_users = User.near([shoveler.latitude, shoveler.longitude], 5)
    Request.where("requester_id IN (?) AND state = 'open'", nearby_users)
  end

end
