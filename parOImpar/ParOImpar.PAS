program ParOImpar;

uses crt;

var
   numero: integer;

begin
   clrscr;
   write('Ingresa un numero: ');
   readln(numero);

   if (numero mod 2 = 0) then
      writeln('Par')
   else
      writeln('Impar');

   readln;
end.
