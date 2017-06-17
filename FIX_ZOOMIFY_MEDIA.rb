#!/usr/bin/ruby -i.bak

# by Mike Limberger
# Broken ZOOMIFY virtual Slide Fixer

db = Hash.new

# List of all Files
files = DATA.map { |key| key.chomp!; key }

# Create hash (internal Database)
# https://stackoverflow.com/questions/410623/convert-an-array-into-an-index-hash-in-ruby
db = Hash[ files.zip files.size.times.map { true } ]

ARGF.each(nil) do |xml|

	# Fix Paths with Errors
	xml.gsub!(%r{(?<=MEDIA=")\.(?!\.)}) { '..' }
	
	# Remove incorrect 
	xml.gsub!(%r{(?<=MEDIA=")(\.{1,2}/assets/arrows/([[:alnum:]\.]+))}) do 
		
		path  = $1
		match = $2
		
		unless (db[match])
		
			''

		else
		
			path
		
		end 
	
	end
	
	puts xml

end

# "Database" of arrows below
__END__
arrowblackdown.png
arrowblackup.png
arrowRight.png
arrowwhiteleft.png
arrowyellowdown.png
arrowyellowup.png
circleyellow.png
squareyellow.png
arrowblackleft.png
arrowDown.png
arrowUp.png
arrowwhiteright.png
arrowyellowleft.png
circleblack.png
squareblack.png
arrowblackright.png
arrowLeft.png
arrowwhitedown.png
arrowwhiteup.png
arrowyellowright.png
circlewhite.png
squarewhite.png
