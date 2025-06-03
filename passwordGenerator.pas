program  passwordgenerator;

uses crt;

var
   plength  : integer;
   number   : char;
   special  : char;
   
procedure passwordgenerator(plenght : integer; number : char; special : char);
{generates a password based on the plength requested.}
			    
var
   dictionary : array of char;
   selection  : string;
   password   : string;
   i	      : integer;

begin
   writeln('The procedure parameters are: plength: ', plength, ' number: ', number, ' special: ', special);
   randomize;
   dictionary := '';
   password := '';
   { selection := ''; }

   if (number = 'Y') and (special = 'Y') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890#$%!'
   else if (number = 'Y') and (special = 'N') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ1234567890'
   else if (number = 'N') and (special = 'Y') then
      dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ#$%!'
  else
   dictionary := 'abcdefghijklmnopqrstuvwxyzABCDEFHIJKLMNOPQSTUVWXYZ';

   {'length' is a Pascal function that returns the size of an array}
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
   textcolor(green);
   gotoxy(40,12);
   writeln('Welcome to password generator');
   gotoxy(40,14);
   delay(1000);
   writeln('Press any key to continue...');
   readkey;
   clrscr;
   gotoxy(40,12);
   write('Do you need numbers in your password? [Y/N]  ');
   readln(number);
   clrscr;
   gotoxy(40,12);
   write('Do you need special in your password? [Y/N]  ');
   readln(special);
   clrscr;
   gotoxy(40,12);
   write('How long is your password? ');
   readln(plength);
   { writeln('You selections were ', number, ' ',  special, ' ', plength); }
   { delay(5000); }
   clrscr;
   
   passwordgenerator(plength, number, special);

   clrscr;
   gotoxy(40,12);
   writeln('press any key to exit.');
   readkey;
   clrscr;

end.
