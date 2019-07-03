class Order < ApplicationRecord
  belongs_to :user
  before_create :set_rentday

  def set_rentday
    self.rent_day = self.created_at

  end

end
