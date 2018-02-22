# National Economics Challenge Certificate Generator

## Why does it exist?

It's for making certificates for the participants in the National Economics Challenge.

## How does it work?

It uses Prawn to generate PDFs from a list of names in a CSV file.

## Why doesn't it work?

Because of laziness and licensing (I don't have distribution rights for the fonts), you have to add in your own fonts and images. That said, they're currently hard-coded in because this was originally a one-off script that I'm just putting online in the off change I ever need to use it again.

You can pop your images and text into the `/resources` directory.

Also, it looks for a file called `input.csv`, which should have seven columns:

1. Teacher's email address
2. Student's first name
3. Student's last name
4. Division (ex."Adam Smith", "David Ricardo")
5. Event name (ex. "2017 Wildcard Competition", "2018 New York State Finals")
6. Event date (Month, Year) (prints next to signature)
7. Optional: random text for filename. Use this when emailing the certificates via Constant Contact or some other bulk emailer. The idea is to upload the files somewhere accessible to the public (shared Dropbox folder, perhaps), and include the URL for each certificate as a column in the mailmerge file. Use random.org or something similar to generate random values for the column. Leave it blank if the certificates will be mailed to teachers individually.

NOTE: Ruby newbie cbujara has desecrated skinney's slim and elegant design with three added data columns (5,6,7) that permit generation of certificates for a variety of NEC competitions without having to change the code, plus some output tweaks as described below. Hey, it works.

## Where does the output end up?
Maybe look in the output folder? If everything worked, there will be folders named with the event names supplied in column 5. Below them, if column 7 was left blank, there will be a series of folders named with teacher email addresses, within which will be found the certificates for their team, for someone to email individually. Otherwise, all of the certificates end up in an All folder.
