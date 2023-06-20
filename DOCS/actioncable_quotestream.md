# Quotes - ActionCable Subscription Explanation

- In our Quote model, we set three callbacks to broadcast creations, updates, and deletions to the "quotes" stream. Thanks to the broadcasts_to method, those three callbacks can be defined in one line.

- In our Quotes#index view, we explicitly mentioned that we want to subscribe to the changes that are broadcasted to the "quotes" stream.
