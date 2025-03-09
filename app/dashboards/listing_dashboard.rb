require "administrate/base_dashboard"

class ListingDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    price: Field::Number,
    approved: Field::Boolean,
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    approved
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    description
    price
    approved
    user
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    description
    price
    approved
  ].freeze

  def display_resource(listing)
    "Listing ##{listing.id} - #{listing.title}"
  end
end
