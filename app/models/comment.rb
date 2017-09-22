# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  user_id          :integer
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
end
