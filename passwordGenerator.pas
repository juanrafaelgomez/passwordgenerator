PROGRAM  passwordgenerator;

uses crt;

VAR
   length : integer;

PROCEDURE passwordgenerator(passwordlength : integer);
{Generates a password based on the length requested.}

VAR
   password : string;
   i	    : integer;

BEGIN
   randomize;
   password := '';
FOR i := 1 TO passwordlength DO
      BEGIN
	 {random provides a number AND ord converts to a
	 letter TO a number. At the END, the resulting number is
	 converted back TO a character}
	 password := password + char(random(26) + ord('a'));
	 gotoxy(40,12);
	 WRITELN('Processing password...');
	 delay(1000);
	 clrscr;
	 END;
         gotoxy(40,12);
         WRITELN('Password generated!');
         delay(3000);
	 clrscr;
         gotoxy(40,12);
	 WRITELN('Your password is: ', password);
         delay(5000);
   	 gotoxy(40,12);
END;

BEGIN

   clrscr;
   textbackground(black);
   textcolor(green);
   gotoxy(40,12);
   WRITELN('WELCOME TO PASSWORD GENERATOR');
   delay(1000);
   gotoxy(40,14);
   WRITELN('Press any key to continue...');
   readkey;
   clrscr;
   gotoxy(40,12);
   WRITE('How long is your password? ');
   READ(length);
   clrscr;
   gotoxy(40,12);
   
   passwordgenerator(length);

   WRITELN('Press any key to exit.');
   readkey;
END.
