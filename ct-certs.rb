require 'prawn'
require 'prawn/measurement_extensions'
require 'active_support/core_ext/string/inflections'
require 'csv'

# Suppress some warning I don't really care about
# I am doing programming!
I18n.enforce_available_locales = false

CSV.foreach('./ct-input.csv', headers: true) do |row|
  school = row[0].titleize
  name = "#{row[1]} #{row[2]}"
  division = row[3]
  rootfolder = "./output/ct"
  foldername = school.parameterize
  filename = name.parameterize
  Dir.mkdir("#{rootfolder}") unless File.exists?("#{rootfolder}/")
  Dir.mkdir("#{rootfolder}/#{foldername}") unless File.exists?("#{rootfolder}/#{foldername}")
  Prawn::Document.generate "#{rootfolder}/#{foldername}/#{filename}.pdf", page_layout: :landscape do
    #Uncomment next line to display alignment grid on generated pdf, to aid in element positioning
    #stroke_axis
    move_down 15
    image "./resources/challenge_logo.jpg", position: :center, fit: [800,85]
    move_down 40
    font "./resources/OpenSans-Italic.ttf"
    text "Certificate of Participation", size: 48, align: :center
    move_down 20
    font "./resources/OpenSans-Regular.ttf"
    text "This certificate is presented to", size: 18, align: :center
    move_down 15
    font "./resources/OpenSans-Bold.ttf"
    text name, size: 24, align: :center
    move_down 10
    font "./resources/OpenSans-Regular.ttf"
    text school, size: 18, align: :center
    move_down 15
    text "in recognition of your exemplary participation in the #{division} Division of the ", size: 18, align: :center
    move_down 15
    font "./resources/OpenSans-BoldItalic.ttf"
    text "2017 Economics Challenge Connecticut Competition", size: 24, align: :center
    move_down 15
    font "./resources/OpenSans-Regular.ttf"
    text "Congratulations on your excellent achievement", size: 18, align: :center
    #image "./resources/cee_logo.jpg", at: [0,545], fit: [400,100]
    #image "./resources/state_farm_logo.jpg", at: [550,545], fit: [400,100]
    image "./resources/njmsig.jpg", at: [0,90], fit: [200,50]
    stroke do
      stroke_color '666666'
      line_width 1
      # may need to adjust the value below; move_down does not seem to be working as intended
      move_down 80
      horizontal_line(5, 200)
    end
    text_box "Nan J. Morrison\nPresident and Chief Executive Officer\nCouncil for Economic Education", at: [5,50]
#    text_box "Chris Caltabiano\nVice President, Domestic Programs\nCouncil for Economic Education", at: [5,75]
    text_box "March, 2017\nNew York City, NY", at: [600,50]
  end
end
