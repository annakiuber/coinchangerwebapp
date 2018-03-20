require "minitest/autorun"
require_relative "coinchanger_app.rb"

class Coinchanger_test< Minitest::Test

	def test_boulean
	 	assert_equal(true, true)
	end

	def test_for_hash
		call_hash = coinchanger_app(11)
		assert_equal(Hash, call_hash.class)
	end
	def test_for_onecent_onepenny
		call_hash = coinchanger_app(1)
		assert_equal({"penny" => 1 }, call_hash)
	end
	def test_for_2_cent_2_pennies
		call_hash = coinchanger_app(2)
		assert_equal({"penny" => 2}, call_hash)
	end
	def test_for_5_cent_nickle
		call_hash = coinchanger_app(5)
		assert_equal({"nickle" => 1}, call_hash)
	end
	def test_for_7_cent_one_nickle_two_penny
		call_hash = coinchanger_app(7)
		assert_equal({"nickle" => 1, "penny" => 2}, call_hash)
	end
	def test_for_dime_is_10
		call_hash = coinchanger_app(10)
		assert_equal({"dime" => 1}, call_hash)
	end
	def test_for_dime_nuckle_one_penny
		call_hash = coinchanger_app(16)
		assert_equal({"dime" => 1, "nickle" => 1, "penny" => 1}, call_hash)
	end
	def test_for_quarter
		call_hash = coinchanger_app(25)
		assert_equal({"quarter" => 1}, call_hash)
	end
	def test_for_plural_is_hash
		call_hash = plural_hash({"quarters" => 2})
		assert_equal(Hash, call_hash.class)
	end
	# def test_for_plural_is_hash
	# 	hashtest = {"quarter" => 2, "dime" => 0, "nickle" => 1, "penny" => 4}
	# 	assert_equal({"quarters" => 2, "dimes" => 0, "nickle" => 1, "pennies" => 4}, plural_hash(hashtest))
	# end
	def test_for_plural_hash_quarter
		hashtest = {"quarter" => 2}
		assert_equal({"quarters" => 2}, plural_hash(hashtest))
	end
	def test_for_plural_hash_dime
		hashtest = {"dime" => 2}
		assert_equal({"dimes" => 2}, plural_hash(hashtest))
	end
	def test_for_all_plural
		hashtest = {"quarter" => 2, "dime" => 2, "nickle" => 2, "penny" => 2 }
		assert_equal({"quarters" => 2, "dimes" => 2, "nickles" => 2, "pennies" =>2}, plural_hash(hashtest))
	end
	# def test_for_all_plural_o
	# 	hashtest = {"quarter" => 0, "dime" => 0, "nickle" => 0, "penny" => 0 }
	# 	assert_equal({"quarters" => 0, "dimes" => 0, "nickles" => 0, "pennies" =>0}, plural_hash(hashtest))
	# end
	# def test_for_plural_is_hash
	# 	hashtest = {"quarter" => 2, "dime" => 0, "nickle" => 1, "penny" => 4}
	# 	assert_equal({"quarters" => 2, "dimes" => 0, "nickle" => 1, "pennies" => 4}, plural_hash(hashtest))
	# end
	def test_for_plural_is_1
		hashtest = {"quarter" => 1, "dime" => 1, "nickle" => 1, "penny" => 1}
		assert_equal({"quarter" => 1, "dime" => 1, "nickle" => 1, "penny" => 1}, plural_hash(hashtest))
	end
	# def test_for_all_working_together
	# 	cents = 49
	# 	non_plural = coinchanger_app(cents)
	# 	assert_equal({"quarter" => 1, "dimes" => 2, "nickles" => 0, "pennies" => 4}, plural_hash(non_plural))
	# end
	def test_for_60_cents
		call_hash = {"quarter" => 2, "dime" => 1} 
		assert_equal({"quarters" => 2, "dime" => 1}, plural_hash(call_hash))
	end
	def test_for_61_cents
		call_hash = {"quarter" => 2, "dime" => 1, "penny" => 1} 
		assert_equal({"quarters" => 2, "dime" => 1, "penny" => 1}, plural_hash(call_hash))
	end
	def test_for_65_cents
		call_hash = {"quarter" => 2, "dime" => 1, "nickel" => 1, "penny" => 1} 
		assert_equal({"quarters" => 2, "dime" => 1, "nickel" => 1, "penny" => 1}, plural_hash(call_hash))
	end
	def test_for_all_ones
		call_hash = {"quarter" => 1, "dime" => 1, "nickel" => 1, "penny" => 1} 
		assert_equal({"quarter" => 1, "dime" => 1, "nickel" => 1, "penny" => 1}, plural_hash(call_hash))
	end
	def test_functions_working_together
		cents = 49
		singular_hash = coinchanger_app(cents)
		assert_equal({"quarter" => 1, "dime" => 2, "penny" => 4}, singular_hash)
	end

end