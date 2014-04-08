require "prawn"
require "prawn/measurement_extensions"

Prawn::Document.generate 'example.pdf', page_layout: :landscape do
  text 'HELLO', size: 28, align: :center, valign: :center
end