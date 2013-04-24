require 'SecureRandom'
class Url < ActiveRecord::Base
  validates :original, :format => {:with => /http:\/\/[a-zA-Z0-9\.]+\.[a-zA-Z]{2,3}/, 
                                   :message => "Not a valid URL"}
  before_create :shorten_url

  def increment_count!
    self.count +=1
    self.save
  end


  private
  def shorten_url
    self.shortened = SecureRandom.hex(3)
  end


end



# http://socrates.devbootcamp.com/challenges/276
# localhost:9393/as87d

