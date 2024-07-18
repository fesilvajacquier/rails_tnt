class Resource < ApplicationRecord
  # TODO: morph - show this
  broadcasts_refreshes

  after_create_commit -> { broadcast_prepend_to "resources", partial: "resources/resource", locals: { resource: self }, target: "resources" }

  after_touch -> { broadcast_replace_to self }
  has_many :comments, dependent: :destroy
end
