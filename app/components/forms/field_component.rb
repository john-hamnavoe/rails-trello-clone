class Forms::FieldComponent < ApplicationComponent
  renders_one :input, types: {
    text: ->(**args) { Forms::TextInputComponent.new(form, field, **args) }
  }

  attr_reader :form, :field, :label, :help, :label_class, :inline

  def initialize(form, field, label: nil, label_class: nil, help: nil, inline: false)
    @form = form
    @field = field
    @label = label
    @help = help
    @label_class = label_class
    @inline = inline
  end

  def label_classes
    @label_class || "block text-sm font-medium leading-6 text-gray-700"
  end

  def inline_classes
    inline ? "sm:flex sm:items-center sm:flex-inline sm:ml-3" : ""
  end

  def div_class
    inline_classes
  end
end
