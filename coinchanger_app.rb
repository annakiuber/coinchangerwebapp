def coinchanger_app(cents)
	coins = {}
	if cents >= 25
		coins["quarter"] = cents / 25
		cents = cents % 25
	end   
	if cents >= 10
		coins["dime"] = cents / 10
		cents = cents % 10
	end
	if cents >= 5
		coins["nickle"] = cents / 5
		cents = cents % 5
		p cents
	end
	 if cents >= 1 
		coins["penny"] = cents
	end

	coins

end
def plural_hash(coins)
	coin_plural = {}
	coins.each{|key,value|
		if value > 1 
			if key == "quarter"
			coin_plural["quarters"] = value
			elsif key == "dime"
				coin_plural["dimes"] = value
			elsif key == "nickle"
				coin_plural["nickles"] = value
			elsif key == "penny"
				coin_plural["pennies"] = value

			end
			else 
				coin_plural[key] = value
		end
	}
	return coin_plural
end

def hash_to_string(cents)
	string = ""
	plural_hash(coinchanger_app(cents)).each do |key, value|
	# coinchanger_app(cents).each do 
		string << "#{value} #{key}"
	end
	return string
end
