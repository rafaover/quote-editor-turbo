class Quote < ApplicationRecord
  validates :name, presence: true

  after_create_commit -> { broadcast_prepend_to "quotes" }
  after_update_commit -> { broadcast_replace_to "quotes" }
  after_destroy_commit -> { broadcast_remove_to "quotes" }

  # after_create_commit :broadcast_quote

  # def broadcast_quote
  #   broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes"
  # end
end
