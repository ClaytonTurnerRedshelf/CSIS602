# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
	Movie.create! movie
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page



Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  text=page.body
  first=text.index(e1)
  second=text.index(e2)
  assert first<second
#text=page.body
  #assert /.*#{e1}.*#{e2}.*/.match(text)
  #flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
	rating_list = rating_list.split(",")
	rating_list.each {|rating|
		step %Q{I #{uncheck}check "ratings_#{rating}"}
	}
end

Then /I should see all the movies/ do
  movies=Movie.all
  movies.each do |movie| 
    step %Q{I should see "#{movie.title}"}
  end
end

Then /I should( not)? see the following movies: (.*)/ do |neg, movies_list|
  movies_list=movies_list.split(",")
  movies_list.each do |movie|
    step %Q{I should#{neg} see "#{movie}"}
  end
end


