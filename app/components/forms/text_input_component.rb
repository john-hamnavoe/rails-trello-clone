# frozen_string_literal: true

class Forms::TextInputComponent < Forms::BaseComponent
  def initialize(form, field, type: :text, autofocus: false)
    super(form, field)
    @type = type
    @autofocus = autofocus
  end

  def call
    form.send(method, field, class: input_class, data: data, autofocus: @autofocus)
  end

  private

  def method
    "#{@type}_field"
  end

  def input_class
    class_names("rounded-md w-full disabled:bg-gray-200 relative block appearance-none border border-gray-300 px-1 py-1 text-gray-900 placeholder-gray-500 focus:z-10 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm")
  end

  def data
    return {} unless @autofocus

    {controller: "autofocus"}
  end
end
