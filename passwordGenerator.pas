{$mode fpc}
program  passwordgenerator;

uses crt, sysutils, character; 

var
   plength   : string;
   number    : char;
   special   : char;
   i	     : integer;
   isanumber : boolean;
   nlength   : integer;
   error     : integer;
   
procedure passwordgenerator(plenght : integer; number : char; special : char);
{generates a password based on lenght, special and numbers.}
			    
var
   dictionary : array of char;
   { selection  : string; }
   password   : string;
   i	      : integer;

begin
   writeln('The procedure parameters are: length: ', plength, ' number: ', number, ' special: ', special);
   randomize;
   dictionary := '';
   password := '';
   isanumber := false;
   { selection := ''; }

   if (number = 'Y') and (special = 'Y') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890#$%!'
   else if (number = 'Y') and (special = 'N') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890'
   else if (number = 'N') and (special = 'Y') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ#$%!'
  else
   dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ';

   
   { for i := 0 to length(dictionary) do }
   {    begin }
   {    selection := selection + dictionary[i] }
   {    end; }

   { writeln('Your selection is: ', selection); }
   { delay(8000); }
   
   for i := 1 to plenght do
      begin
	 {random provides a number and ord converts to a
	 letter to a number. at the end, the resulting number is
	 converted back to a character}
	 { password := password + char(random(26) + ord('a')); }
         {the password is the result of the random selection
          of a character from a constant named "charpool".}
	 {'length' is a Pascal function that returns the size of an array}
	 password := password + dictionary[random(length(dictionary))];
	 clrscr;
	 gotoxy(40,12);
	 writeln('Processing password...');
	 delay(100);
	 clrscr;
	 end;

   gotoxy(40,12);
   writeln('Password generated!');
   delay(3000);
   clrscr;
   gotoxy(40,12);
   writeln('Your password is: ', password);
   delay(5000);
   clrscr;
   gotoxy(40,12);

end;

begin
   clrscr;
   textbackground(black);
   textcolor(yellow);
   gotoxy(40,12);
   write('Welcome to password generator');
   gotoxy(40,13);
   delay(1000);
   write('Press any key to continue...');
   gotoxy(40,30);
   readkey;
   clrscr;
   gotoxy(40,29);

   { TODO :: ADD A VERIFICATION USING 'UNTIL, REPEAT' STRUCTURE }
   
   repeat
      clrscr;
      gotoxy(40,12);
      write('Do you need numbers in your password? [Y/N]  ');
      readln(number);
   until (number = 'Y') or (number = 'y') or (number = 'N') or (number = 'n');

   repeat
      clrscr;
      gotoxy(40,12);
      write('Do you need special in your password? [Y/N]  ');
      readln(special);
   until (special = 'Y') or (special = 'y') or (special = 'N') or (special = 'n');

   repeat
      clrscr;
      gotoxy(40,12);
      write('How long is your password? ');
      readln(plength);
      for i := 1 to length(plength) do
      begin
	 { writeln('The current value for index ' , i, ' is: ', plength[i]); }
	 isanumber := isnumber(plength[i]);
	 if not (isanumber) then
	 begin
	    gotoxy(40,13);
	    writeln('This is not a number!');
	    delay(3000);
	    break;
	 end;
      end;
   until isanumber;
   {Convert the string into a number an sends the value to a new variable}
   val(plength, nlength, error);
   writeln(nlength);
	     	     
   passwordgenerator(nlength, number, special);

   clrscr;
   gotoxy(40,12);
   writeln('Press any key to exit.');
   readkey;
   clrscr;

end.
