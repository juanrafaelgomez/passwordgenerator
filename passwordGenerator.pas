{$mode fpc}

{ TODO :: FIX PASSWORDGENERATOR PROCEDURE }

PROGRAM  passwordgenerator;

uses crt, sysutils, character; 

VAR
   plength   : string;
   number    : char;
   special   : char;
   i	     : integer;
   isanumber : boolean;
   nlength   : integer;
   error     : integer;
   
PROCEDURE passwordgenerator(plenght : integer; number : char; special : char);
{generates a password based on lenght, special AND numbers.}
			    
VAR
   dictionary : ARRAY OF char;
   password   : string;
   i	      : integer;

BEGIN
   WRITELN('The procedure parameters are: length: ', plength, ' number: ', number, ' special: ', special);
   randomize;
   dictionary := '';
   password := '';
   isanumber := false;

   IF (number = 'Y') AND (special = 'Y') THEN
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890#$%!'
   ELSE IF (number = 'Y') AND (special = 'N') THEN
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890'
   ELSE IF (number = 'N') AND (special = 'Y') THEN
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ#$%!'
  ELSE
   dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ';

  
   FOR i := 1 TO plenght DO
      BEGIN
	 {random provides a number AND ord converts TO a
	 letter TO a number. at the END, the resulting number is
	 converted back TO a character}
	 { password := password + char(random(26) + ord('a')); }
         {the password is the result OF the random selection
          OF a character from a constant named "charpool".}
	 {'length' is a Pascal FUNCTION that returns the size OF an ARRAY}
	 password := password + dictionary[random(length(dictionary))];
	 clrscr;
	 gotoxy(40,12);
	 WRITELN('Processing password...');
	 delay(100);
	 clrscr;
	 END;

   gotoxy(40,12);
   WRITELN('Password generated!');
   delay(3000);
   clrscr;
   gotoxy(40,12);
   WRITELN('Your password is: ', password);
   delay(5000);
   clrscr;
   gotoxy(40,12);

END;

BEGIN
   clrscr;
   textbackground(black);
   textcolor(yellow);
   gotoxy(40,12);
   WRITE('Welcome to password generator');
   gotoxy(40,13);
   delay(1000);
   WRITE('Press any key to continue...');
   gotoxy(40,30);
   readkey;
   clrscr;
   gotoxy(40,29);

   
   REPEAT
      clrscr;
      gotoxy(40,12);
      WRITE('Do you need numbers in your password? [Y/N]  ');
      READLN(number);
   UNTIL (number = 'Y') OR (number = 'y') OR (number = 'N') OR (number = 'n');

   REPEAT
      clrscr;
      gotoxy(40,12);
      WRITE('Do you need special in your password? [Y/N]  ');
      READLN(special);
   UNTIL (special = 'Y') OR (special = 'y') OR (special = 'N') OR (special = 'n');

   REPEAT
      clrscr;
      gotoxy(40,12);
      WRITE('How long is your password? ');
      READLN(plength);
      FOR i := 1 TO length(plength) DO
      BEGIN
	 isanumber := isnumber(plength[i]);
	 IF NOT (isanumber) THEN
	 BEGIN
	    gotoxy(40,13);
	    WRITELN('This is NOT a number!');
	    delay(3000);
	    break;
	 END;
      END;
   UNTIL isanumber;

   {Convert the string into a number an sends the value TO a new variable}
   val(plength, nlength, error);
   WRITELN(nlength);
	     	     
   passwordgenerator(nlength, number, special);

   clrscr;
   gotoxy(40,12);
   WRITELN('Press any key to exit.');
   readkey;
   clrscr;

END.
