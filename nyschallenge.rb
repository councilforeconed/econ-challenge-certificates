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
    #Uncomment next line to display alignment grid on generated pdf, to aid in element positioning
    #stroke_axis
    move_down 50
    image "./resources/cee_logo.jpg", :position => :center
    move_down 40
    font "./resources/OpenSans-Italic.ttf"
    text "Certificate of Participation", size: 48, align: :center
    move_down 20
    font "./resources/OpenSans-Regular.ttf"
    text "This certificate is presented to", size: 18, align: :center
    move_down 10
    text name, size: 24, align: :center
    move_down 10
    text "in recognition of your exemplary participation in the #{division} Division of the ", size: 18, align: :center
    move_down 10
    #image "./resources/challenge_logo.jpg", position: :center, fit: [400,45]
    #move_down 15
    font "./resources/OpenSans-BoldItalic.ttf"
    text "2015 New York State Economics Challenge", size: 24, align: :center
    move_down 15
    font "./resources/OpenSans-Italic.ttf"
    text "Congratulations on your excellent achievement", size: 18, align: :center
    #image "./resources/cee_logo.jpg", at: [0,545], fit: [400,100]
    #image "./resources/state_farm_logo.jpg", at: [550,545], fit: [400,100]
    image "./resources/doug_signature.jpg", at: [0,125], fit: [200,50]
    stroke do
      stroke_color '666666'
      line_width 1
      # may need to adjust the value below; move_down does not seem to be working as intended
      move_down 60
      horizontal_line(5, 200)
    end
    text_box "Doug Young\nDirector, National Center", at: [5,75]
#    text_box "Chris Caltabiano\nVice President, Domestic Programs\nCouncil for Economic Education", at: [5,75]
    text_box "April 6, 2015", at: [600,75]
  end
end
