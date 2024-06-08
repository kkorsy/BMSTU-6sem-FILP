DOMAINS
	city, street = symbol.
	house, apartment = integer.
	surname, phone_number = symbol.
	brand, color, car_number = symbol.
	cost = integer.
	name, gender = symbol.
	addr = address(city, street, house, apartment).
	pers = person(surname, gender).

PREDICATES
	phonebook(surname, phone_number, addr).
	car(surname, brand, color, cost, car_number).
	car_info(brand, color, surname, city, phone_number).
	
	parent(pers, pers).
	grandchild_car(surname, gender, gender, brand, car_number).

CLAUSES 	
	phonebook("Ivanov", "12345678", address("Moscow", street_1, 1, 15)).
	phonebook("Petrov", "14141414", address("Moscow", street_2, 4, 38)).
	phonebook("Sidorov", "33333333", address("Moscow", street_3, 5, 12)).
	phonebook("Ivanov", "13131313", address("Spb", street_3, 3, 33)).
	phonebook("Petrov", "22222222", address("Spb", street_2, 4, 21)).
	phonebook("Sidorov", "33333333", address("Spb", street_1, 2, 12)).
	
	car("Ivanov", brand_1, red, 100, "a000bc").
	car("Ivanov", brand_2, white, 200, "d001ef").
	car("Petrov", brand_3, red, 300, "g100hi").
	car("Sidorov", brand_2, black, 200, "j200kl").
	car("Ivanov", brand_3, white, 100, "m300no").
	car("Petrov", brand_1, black, 400, "p400qr").
	car("Petrov", brand_1, red, 200, "s401tu").
	car("Sidorov", brand_3, red, 300, "v500wx").
	
	car_info(Brand, Color, Name, City, Phone):- car(Name, Brand, Color, _, _), phonebook(Name, Phone, address(City, _, _, _)).
	
	
	parent(person("Ivanov", m), person("Kuznetsova", f)).
	parent(person("Kuznetsova", f), person("Petrov", m)).
	
	parent(person("Ivanov", m), person("Sokolov", m)).
	parent(person("Sokolov", m), person("Sidorov", m)).
	
	grandchild_car(Name, Child_gender, Parent_gender, Brand, Number) :- parent(person(Name, _), person(Parent_name, Parent_gender)), 
									    parent(person(Parent_name, Parent_gender), person(Child_name, Child_gender)),
									    car(Child_name, Brand, _, _, Number).

GOAL
	%grandchild_car("Ivanov", m, m, Brand, Number).
	grandchild_car(WHO, m, m, brand_1, Number).
	
	