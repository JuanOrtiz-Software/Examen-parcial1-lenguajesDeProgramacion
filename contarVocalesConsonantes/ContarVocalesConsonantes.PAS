program ContarVocalesConsonantes;
uses crt;

var
  cadena: string;
  i, vocales, consonantes: integer;
  c: char;

begin
  vocales := 0;
  consonantes := 0;

  write('Ingrese una cadena: ');
  readln(cadena);

  for i := 1 to length(cadena) do
  begin
    c := cadena[i];

    { Verificamos si es letra }
    if (c in ['A'..'Z']) or (c in ['a'..'z']) then
    begin
      if (c in ['A','E','I','O','U','a','e','i','o','u']) then
        vocales := vocales + 1
      else
        consonantes := consonantes + 1;
    end;
  end;

  writeln('Vocales: ', vocales);
  writeln('Consonantes: ', consonantes);

  readln; { Pausa }
end.
