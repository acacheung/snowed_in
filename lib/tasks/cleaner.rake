require 'request_cleaner'

namespace :cleaner do

  desc 'expires all the requests that were posted over five days ago'

  task :clean => :environment do
    RequestCleaner.clean
  end

end
