
file = File.read(File.join(File.dirname(__FILE__), 'picture_list.txt'))

def fix_names list
    # Return object
    ret = []
    # Keep track of count and place total {<place>: [<count>, <total>]}
    places = {}
    # Regex match each line. <fliename>, <extention>, <place>
    list.scan(/^(\w*\.(jpg|png|jpeg))\W*(\w*)/) { |match| 
        # If false its the first: initialize with [1, <count of matched location>]
        # If true its not the first: Incriment count and re-use total [<count + 1>, <total>]
        places[match[2]] = places[match[2]] ? [places[match[2]][0] + 1, places[match[2]][1]] : [1, list.scan(match[2]).count]
        # Push to array compiled string
        # <location> + <current count with leading zeros> + "." + <extention>
        # leading zeros calculated from number of digits from <total>
        ret.push(match[2] + places[match[2]][0].to_s.rjust(places[match[2]][1].digits.count, "0") + "." +  match[1])
    }
    # return the array
    ret
end

puts fix_names(file)


