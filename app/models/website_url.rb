class WebsiteUrl < ActiveRecord::Base
  validates :name, :presence => true
  scope :recent, lambda{ order("id desc") }
  
  before_create :remove_extra_variable_from_url, :url_is_unique
  
  def remove_extra_variable_from_url
    self.name = self.name.gsub(/^(www\.|http:\/\/www\.|https:\/\/www\.|http:\/\/)/, '').gsub(/\/(.*)/,'\2')
  end
  
  def url_is_unique
    # Get the current count of objects having this url
    count = WebsiteUrl.count(:conditions => ['name = ?', self.name])
    # Return false if the count is not zero
    unless count == 0
      self.errors.add(:base, "URL must be unique") 
      return false
    end
  end
end
