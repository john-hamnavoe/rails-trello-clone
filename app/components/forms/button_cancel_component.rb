# frozen_string_literal: true

class Forms::ButtonCancelComponent < ApplicationComponent
  private attr_reader :title, :path, :tight, :data, :width, :button_classes

  def initialize(path, title = nil, button_classes: nil, tight: false, data: nil, width: "w-auto")
    @path = path
    @title = title
    @tight = tight
    @data = data
    @width = width
    @button_classes = button_classes
  end

  def call
    link_to title, path, class: classes, data: data, type: "button"
  end

  def before_render
    @title = title || t("buttons.cancel")
  end

  private

  def classes
    "#{width} #{button_classes} inline-flex justify-center rounded-md border border-gray-300 bg-white #{padding_classes} text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-brand-light focus:ring-offset-2"
  end

  def padding_classes
    tight ? "py-1 px-2" : "px-3 py-2"
  end
end
