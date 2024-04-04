# frozen_string_literal: true

class LinkCardComponent < ApplicationComponent
  attr_reader :title, :path, :button_text

  def initialize(title:, path:, button_text: "Open")
    @title = title
    @path = path
    @button_text = button_text
  end
end
