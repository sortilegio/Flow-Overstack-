# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
	acts_as_votable
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
end
