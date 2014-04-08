# National Economics Challenge Certificate Generator

## Why does it exist?

It's for making certificates for the participants in the National Economics Challenge.

## How does it work?

It uses Prawn to generate PDFs from a list of names in a CSV file.

## Why doesn't it work?

Because of laziness and licensing (I don't have distribution rights for the fonts), you have to add in your own fonts and images. That said, they're currently hard-coded in because this was originally a one-off script that I'm just putting online in the off change I ever need to use it again.

You can pop your images and text into the `/resources` directory.

Also, it looks for a file called `input.csv`, which should have four columns:

1. Teacher's email address
2. Student's first name
3. Student's last name
4. Division