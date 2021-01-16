"whats the matter with kansas."

#input: string
#output: string with every other letter reversed
#Mental Model: TUrn the string into an array of words and iterate through them with an index
#If the current index is odd, than return the string in reverse. Otherwise, return the
# string as is.
# Algorithm:
# TUrn the string into an array of words
# iterate through them with an index
# If the current index is odd, than return the string in reverse and assign
# it to what used to be the word.
# Otherwise, return the string as is.
# Return a joined version of the array which was iterated through

def odd_words(string)
	array = []
	string = string[0..-2]
	string.split.each_with_index do |element, index|
		element_new = index.odd? ? element.reverse : element
		array.push(element_new)
	end
	array.join(" ") + "."
end

p odd_words("whats the matter with kansas.")
p odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."