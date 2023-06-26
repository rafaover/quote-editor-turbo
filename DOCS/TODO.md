# FIX THIS

When logging in with users, you might encounter a redirection bug when submitting an invalid form.

This is because the Devise gem does not support Turbo yet (version 4.8.1).

The easiest way to prevent this bug is to disable Turbo on Devise forms by setting the data-turbo attribute to false on Devise forms, as we learned in the Turbo Drive chapter.

If we pushed our app to production, we would have to do it before real users try our app.
