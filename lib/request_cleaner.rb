class RequestCleaner
  def self.clean
    Request.all.each do |request|
      if request.created_at < 5.days.ago && request.state == 'open'
        request.state = 'expired'
        request.save
      end
    end
  end
end
