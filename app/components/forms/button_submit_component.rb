# frozen_string_literal: true

class Forms::ButtonSubmitComponent < ApplicationComponent
  attr_reader :text, :button_classes, :tight, :width, :data

  def initialize(text: nil, button_classes: nil, tight: false, width: "w-auto", data: nil)
    @button_classes = button_classes
    @text = text
    @tight = tight
    @width = width
    @data = data
  end

  def before_render
    @text = text || t("buttons.save")
  end

  def padding_classes
    tight ? "py-1 px-2" : "px-3 py-2"
  end
end
