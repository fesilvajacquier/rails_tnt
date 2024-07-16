class Resource < ApplicationRecord
  broadcasts_refreshes

  # validates :content, length: { minimum: 20, maximum: 500 }

  after_create_commit -> { broadcast_prepend_to "resources", partial: "resources/resource", locals: { resource: self }, target: "resources" }

  after_touch -> { broadcast_replace_to self }
  has_many :comments, dependent: :destroy
end
