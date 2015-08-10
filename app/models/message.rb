class Message < ActiveRecord::Base
  validates :author, :content, presence: true

end