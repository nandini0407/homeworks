class Comment < ActiveRecord::Base

  validates :author_id, :post_id, presence: true

  belongs_to :author,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :post, dependent: :destroy

  belongs_to :parent_comment,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

  has_many :child_comments,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

end
