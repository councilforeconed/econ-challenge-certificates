require 'prawn'
require 'prawn/measurement_extensions'
require 'active_support/core_ext/string/inflections'
require 'csv'

# Suppress some warning I don't really care about
# I am doing programming!
I18n.enforce_available_locales = false

CSV.foreach('./semi-finals-input.csv', headers: true) do |row|
  teacher = row[0]
  name = "#{row[1]} #{row[2]}"
  division = row[3]
  filename = row[4]
  Dir.mkdir("./output/#{teacher}") unless File.exists?("./output/#{teacher}")
  Prawn::Document.generate "output/#{teacher}/#{filename}.pdf", page_layout: :landscape do
    #Uncomment next line to display alignment grid on generated pdf, to aid in element positioning
    #stroke_axis
    move_down 20
    image "./resources/challenge_logo.jpg", position: :center, fit: [800,85]
    move_down 40
    font "./resources/OpenSans-Italic.ttf"
    text "Certificate of Participation", size: 36, align: :center
    move_down 10
    font "./resources/OpenSans-Regular.ttf"
    text "This certificate is presented to", size: 18, align: :center
    move_down 10
    text name, size: 48, align: :center
    move_down 10
    text "in recognition of your exemplary participation in the #{division} Division of the ", size: 18, align: :center
    move_down 15
    font "./resources/OpenSans-BoldItalic.ttf"
    text "2016 National Economics Challenge", size: 24, align: :center
    move_down 10
    text "Semi-Finals Competition", size: 24, align: :center
    move_down 15
    font "./resources/OpenSans-Regular.ttf"
    text "Congratulations on your excellent achievement", size: 18, align: :center
    #image "./resources/cee_logo.jpg", at: [0,545], fit: [400,100]
    #image "./resources/state_farm_logo.jpg", at: [550,545], fit: [400,100]
    image "./resources/chris_signature.jpg", at: [0,90], fit: [200,50]
    stroke do
      stroke_color '666666'
      line_width 1
      # may need to adjust the value below; move_down does not seem to be working as intended
      move_down 70
      horizontal_line(5, 200)
    end
    text_box "Chris Caltabiano\nVice President, Programs", at: [5,50]
#    text_box "Chris Caltabiano\nVice President, Domestic Programs\nCouncil for Economic Education", at: [5,75]
    text_box "April, 2016", at: [600,50]
  end
end
