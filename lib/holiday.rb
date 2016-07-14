require 'pry'
#help with pry

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

holiday_supplies[:summer][:fourth_of_july][1]
#question - why can't I do [:fourth_of_july[1]]?

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

holiday_supplies[:winter][:christmas] << supply
holiday_supplies[:winter][:new_years] << supply
=begin question - why can't I do "supply", as a string?
Why do we need supply as an argument?
what if I wanted to specify what the supply was? (like, "mittens")
=end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_supplies[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
    holiday_supplies[season][holiday_name] = supply_array

=begin question - i don't understand how this adds a new holiday, it seems
like it only adds the supply array.
Why doesn't the solution use symbols [:season] like the rest of the problems?
Why does it use arguments?
=end

  holiday_supplies

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
winter_supplies = []
holiday_supplies.collect do |season, holiday|
    if season == :winter
  holiday.collect do |holiday, supplies|
    winter_supplies << supplies
  end
end
end
    winter_supplies.flatten
=begin what if we wanted to return the values as strings, not an array?
I'm never exactly sure when we need to create a new array or variable
in a method. How do you know?
=end
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_supplies.each do |season, data|
    season = season.to_s.capitalize
      puts "#{season}:"
    data.each do |holiday, supplies|
      hol_split = holiday.to_s.split("_")
      hol_split.collect {|x| x.capitalize!}
      upper_case_hol = hol_split.join(" ")
    puts "  #{upper_case_hol}: #{supplies.join(", ")}"
  end
  end
end


#why declare a variable here? why can't I just do season.to_s etc? or holiday.join?

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  new_array = []
  holiday_supplies.collect do |season, holiday|
  holiday.collect do |holiday, supplies|
    if supplies.include?("BBQ")
      new_array << holiday
    end
  end
end
new_array
end
