# frozen_string_literal: true

class Button::SecondaryLinkComponent < ApplicationComponent
  attr_reader :text, :path

  def initialize(text:, path:)
    @text = text
    @path = path
  end

  def call
    link_to text, path, class: "rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm hover:bg-gray-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-grau-600"
  end
end
