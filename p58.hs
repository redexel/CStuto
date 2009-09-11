--Probably the most hackish solution possible.
--The problem can be algebraically simplified into a two-variable equation
--which turns out to be non-trivial. So I enter the equation into
--Wolfram-alpha equation solver but it only gives me 4 decimal places;
--I need 10 so I convert it line by line into haskell.
--http://www.wolframalpha.com/input/?i=y^2%3D100x^2/(1600-x^2),+(y-x)^2/x^2%3D((y-x)^2%2B100)/900
--Probably a really simple solution is possible but I have yet to find it.
run = sqrt (1150-(1/2)*sqrt (610000/3+(1/3)*(214669000000000000-
			2352000000000000*sqrt 57)**(1/3)+
		(10000/3)*7**(2/3)*(4381+48*sqrt 57)**(1/3))-
	(1/2)*sqrt ((1220000/3)-(1/3)*(214669000000000000-
			2352000000000000*sqrt 57)**(1/3)-
		(10000/3)*7**(2/3)*(4381+48*sqrt 57)**(1/3)+16000000/
		sqrt ((610000/3)+(1/3)*(214669000000000000-
			2352000000000000*sqrt 57)**
			(1/3)+(10000/3)*7**(2/3)*
			(4381+48*sqrt 57)**(1/3))))
