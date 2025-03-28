require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    admin: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    admin
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    admin
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    email
    admin
  ].freeze

  def display_resource(user)
    "User ##{user.id} - #{user.email}"
  end
end
