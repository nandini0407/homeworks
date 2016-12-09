module Toyable

  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
    belongs_to :toyable, polymorphic: true
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name)
    self.toys = toy
  end

end
