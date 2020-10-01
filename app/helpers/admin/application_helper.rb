require "webpacker/helper"

module Admin
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      Admin.webpacker
    end
  end
end
