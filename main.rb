require 'prawn'
require 'prawn/measurement_extensions'
require 'active_support/core_ext/string/inflections'
require 'csv'

# Suppress some warning I don't really care about
# I am doing programming!
I18n.enforce_available_locales = false

CSV.foreach('./input.csv', headers: true) do |row|
  teacher = row[0]
  name = "#{row[1]} #{row[2]}"
  division = row[3]
  filename = name.parameterize
  Dir.mkdir("./output/#{teacher}") unless File.exists?("./output/#{teacher}")
  Prawn::Document.generate "output/#{teacher}/#{filename}.pdf", page_layout: :landscape do
    move_down 120
    font "./resources/palatino_italic.ttf"
    text "Certificate of Participation", size: 48, align: :center
    font "./resources/palatino_italic.ttf"
    text "This certificate is presented to", size: 18, align: :center
    move_down 10
    text name, size: 24, align: :center
    move_down 10
    text "In recognition of your participation in the #{division} Division of the ", size: 18, align: :center
    move_down 10
    image "./resources/challenge_logo.jpg", position: :center, fit: [400,45]
    move_down 15
    font "./resources/palatino_bold_italic.ttf"
    text "2014 Wildcard Competition", size: 24, align: :center
    font "./resources/palatino_italic.ttf"
    text "Congratulations on your excellent achievement", size: 18, align: :center
    image "./resources/cee_logo.jpg", at: [0,545], fit: [400,100]
    image "./resources/state_farm_logo.jpg", at: [550,545], fit: [400,100]
    image "./resources/chris_signature.jpg", at: [0,125], fit: [200,50]
    stroke do
      stroke_color '666666'
      line_width 1
      move_down 47
      horizontal_line(5, 200)
    end
    text_box "Chris Caltabiano\nVice President, Domestic Programs\nCouncil for Economic Education", at: [5,75]
    text_box "April, 2014", at: [6.in,75]
  end
end