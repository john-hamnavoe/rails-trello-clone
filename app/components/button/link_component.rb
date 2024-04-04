# frozen_string_literal: true

class Button::LinkComponent < ApplicationComponent
  attr_reader :text, :path

  def initialize(text:, path:)
    @text = text
    @path = path
  end

  def call
    link_to text, path, class: "text-sm font-semibold leading-6 text-blue-600"
  end
end
