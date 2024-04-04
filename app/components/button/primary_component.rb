# frozen_string_literal: true

class Button::PrimaryComponent < ApplicationComponent
  attr_reader :text, :path

  def initialize(text:, path:)
    @text = text
    @path = path
  end

  def call
    link_to text, path, class: "rounded-md bg-green-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600"
  end
end
