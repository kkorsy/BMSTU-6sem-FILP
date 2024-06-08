DOMAINS
	city, street = symbol.
	house, apartment = integer.
	surname, phone_number = symbol.
	brand, color, car_number = symbol.
	cost = integer.
	gender = symbol.
	square = integer.
	bank, bank_number = symbol.
	sum = integer.
	
	addr = address(city, street, house, apartment).
	
	property = building(cost, addr);
		   area(cost, square);
		   water_transport(cost, brand, color);
		   car(cost, brand, color, car_number).

PREDICATES
	phonebook(surname, phone_number, addr).
	owner(surname, property).
	depositor(surname, bank, bank_number, sum).
	
	property_cost(surname, symbol, cost).
	sum_cost(surname, cost).
	name_property(surname, symbol, cost).
	
	max2(integer, integer, integer).
	max3(integer, integer, integer, integer).

CLAUSES 	
	phonebook("Ivanov", "12345678", address("Moscow", street_1, 1, 15)).
	phonebook("Petrov", "14141414", address("Moscow", street_2, 4, 38)).
	phonebook("Sidorov", "33333333", address("Moscow", street_3, 5, 12)).
	
	owner("Ivanov", car(100, brand_1, red, "a000bc")).
	owner("Petrov", car(200, brand_2, white, "d100ef")).
	owner("Sidorov", car(300, brand_3, black, "g200hi")).
	
	owner("Ivanov", water_transport(400, brand_4, blue)).
	owner("Petrov", water_transport(450, brand_5, black)).
	
	owner("Ivanov", area(500, 10)).
	owner("Sidorov", area(700, 15)).
	
	owner("Ivanov", building(800, address("Moscow", street_1, 1, 15))).
	owner("Petrov", building(900, address("Moscow", street_2, 4, 38))).
	owner("Sidorov", building(1000, address("Moscow", street_3, 5, 12))).
	
	depositor("Ivanov", bank_1, "111", 2000).
	depositor("Petrov", bank_2, "222", 3000).
	depositor("Sidorov", bank_3, "333", 2500).
	
	property_cost(Name, car, Cost) :- owner(Name, car(Cost, _, _, _)).
	property_cost(Name, water_transport, Cost) :- owner(Name, water_transport(Cost, _, _)).
	property_cost(Name, area, Cost) :- owner(Name, area(Cost, _)).
	property_cost(Name, building, Cost) :- owner(Name, building(Cost, _)).
	property_cost(_, _, 0).
	
	sum_cost(Name, Cost) :- property_cost(Name, car, Cost1),
				property_cost(Name, water_transport, Cost2),
				property_cost(Name, area, Cost3),
				property_cost(Name, building, Cost4), !,
				Cost = Cost1 + Cost2 + Cost3 + Cost4.
					
	name_property(Name, car, Cost) :- owner(Name, car(Cost, _, _, _)).
	name_property(Name, water_transport, Cost) :- owner(Name, water_transport(Cost, _, _)).
	name_property(Name, area, Cost) :- owner(Name, area(Cost, _)).
	name_property(Name, building, Cost) :- owner(Name, building(Cost, _)).
	
	max2(X, Y, X) :- X > Y, !.
	max2(_, Y, Y).
	
	max3(X, Y, Z, X) :- X > Y, X > Z, !.
	max3(_, Y, Z, Y) :- Y > Z, !.
	max3(_, _, Z, Z).
	
GOAL
	name_property("Sidorov", Property, Cost).
	
	