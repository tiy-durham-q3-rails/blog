class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user

  before_create do
    self.published_at = DateTime.now
  end
end
