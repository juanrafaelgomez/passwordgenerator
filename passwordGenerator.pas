program  passwordgenerator;

uses crt;

type
   yesnoanswer = string[1];

var
   length	: integer;
   needsnumber	: yesnoanswer;
   needsspecial	: yesnoanswer; 
   hasnumber	: boolean;
   hasspecial	: boolean;
   
procedure passwordgenerator(passwordlength: integer; hasnumber : boolean; hasspecial : boolean);
{generates a password based on the length requested.}
			    
const
   charpool = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz#$%!';

var
   password : string;
   i	    : integer;
   

begin
   randomize;
   password := '';


for i := 1 to passwordlength do
      begin
	 {random provides a number and ord converts to a
	 letter to a number. at the end, the resulting number is
	 converted back to a character}
	 { password := password + char(random(26) + ord('a')); }

         {the password is the result of the random selection
          of a character from a constant named "charpool".}
	 password := password + charpool[random(56)];
	 gotoxy(40,12);
	 writeln('processing password...');
	 delay(100);
	 clrscr;
	 end;

   gotoxy(40,12);
   writeln('password generated!');
   delay(3000);
   clrscr;
   gotoxy(40,12);
   writeln('your password is: ', password);
   delay(5000);
   gotoxy(40,12);

end;

begin
   clrscr;
   textbackground(black);
   textcolor(green);
   gotoxy(40,12);
   needsnumber := 'n';
   needsspecial := 'n';
   writeln('welcome to password generator');
   delay(1000);
   gotoxy(40,14);
   writeln('press any key to continue...');
   readkey;
   clrscr;
   gotoxy(40,12);
   write('how long is your password? ');
   read(length);
   clrscr;
   gotoxy(40,12);
   write('do you need numbers in your password? [y/n] ');
   read(needsnumber);
   if needsnumber = 'y' then
      hasnumber := true
   else
      hasnumber := false;
   write('do you need special in your password? [y/n] ');
   read(needsspecial);
   if needsspecial = 'y' then
     hasspecial := true
   else
      hasspecial := false;

   { passwordgenerator(length, hasnumber, hasspecial); }

   writeln('press any key to exit.');
   readkey;

end.
