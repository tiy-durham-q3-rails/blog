class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true

  validate :published_at_cannot_be_in_past, :on => :create

  def published_at_cannot_be_in_past
    if published_at.present? && published_at < DateTime.now - 1.hour
      errors.add(:published_at, "can't be in the past")
    end
  end
end
