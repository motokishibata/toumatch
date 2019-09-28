class Bike < ApplicationRecord
    has_many :parts, dependent: :destroy
    validates :maker, presence: true,
                      length: { minimum: 2}
end
