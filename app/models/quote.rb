class Quote < ApplicationRecord
  validates :name, presence: true

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # all 3 above, is the same of the one below
  broadcasts_to ->(_quote) { "quotes" }, inserts_by: :prepend

  # after_create_commit :broadcast_quote

  # def broadcast_quote
  #   broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes"
  # end
end
