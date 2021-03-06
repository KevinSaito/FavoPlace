class Notification < ApplicationRecord
  # public配下？
  default_scope->{order(created_at: :desc)}

  belongs_to :favo_iamge, optional: true
  belongs_to :favo_comment, optional: true
  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
  default_scope -> { order(created_at: :desc) }
  belongs_to :favo_image, optional: true
  belongs_to :favo_comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
