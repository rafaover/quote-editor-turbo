class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # all 3 above, is the same of the one below

  # We have to change the stream name where the quotes' HTML will be broadcasted.

  # Under the hood, the signed stream name is generated from the array returned
  # by the lambda that is the first argument of the broadcasts_to method. The
  # rules for secure broadcastings are the following:

  # Users who share broadcastings should have the lambda return an array
  # with the same values.

  # Users who shouldn't share broadcastings should have the lambda return an
  # array with different values.

  # Check quotes#index where the turbo_stream_from is defined. It returns
  # similar array.

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  # Another solution
  # after_create_commit :broadcast_quote
  # def broadcast_quote
  #   broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes"
  # end
end
