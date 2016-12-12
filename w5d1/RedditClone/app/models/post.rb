class Post < ActiveRecord::Base

  validates :title, :subs, :author_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  has_many :subs, through: :post_subs

  has_many :comments, dependent: :destroy

end
