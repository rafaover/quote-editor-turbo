# frozen_string_literal: true

module ApplicationHelper
  # Render flash messages with xxx.turbo_stream.erb files inside views
  def render_turbo_flashmsg
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
