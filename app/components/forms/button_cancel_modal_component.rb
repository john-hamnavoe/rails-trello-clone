# frozen_string_literal: true

class Forms::ButtonCancelModalComponent < ApplicationComponent
  def call
    render Forms::ButtonCancelComponent.new("#", data: {action: "click->modal#close"})
  end
end
