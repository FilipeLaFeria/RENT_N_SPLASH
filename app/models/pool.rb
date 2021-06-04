class Pool < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  validates :title, :address, :size, :description, :photo, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[title address size description],
    associated_against: {
      user: %i[first_name last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
