program GeneradorContrasenias;

function EsSi(c: char): boolean;
begin
  if (c = 's') or (c = 'S') then
    EsSi := true
  else
    EsSi := false;
end;

function GenerarContrasena(longitud: integer; incMayus, incNum, incSimb: boolean): string;
const
  minusculas = 'abcdefghijklmnopqrstuvwxyz';
  mayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  numeros    = '0123456789';
  simbolos   = '!@#$%^&*()-_=+<>?';
var
  caracteres: string;
  res: string;
  i, idx, total: integer;
begin
  { Si ninguna opción extra se marca, siempre habrá minusculas }
  caracteres := minusculas;
  if incMayus then caracteres := caracteres + mayusculas;
  if incNum   then caracteres := caracteres + numeros;
  if incSimb  then caracteres := caracteres + simbolos;

  if longitud < 8 then longitud := 8;
  if longitud > 16 then longitud := 16;

  Randomize;
  res := '';
  total := Length(caracteres);

  for i := 1 to longitud do
  begin
    idx := Random(total) + 1; { Random -> 0..total-1 }
    res := res + caracteres[idx];
  end;

  GenerarContrasena := res;
end;

var
  longitud: integer;
  mayus, num, simb: char;
  pass: string;
begin
  Write('Longitud (8-16): '); ReadLn(longitud);
  Write('Incluir mayusculas? (s/n): '); ReadLn(mayus);
  Write('Incluir numeros?   (s/n): '); ReadLn(num);
  Write('Incluir simbolos?  (s/n): '); ReadLn(simb);

  pass := GenerarContrasena(longitud, EsSi(mayus), EsSi(num), EsSi(simb));
  WriteLn;
  WriteLn('Contrasena generada: ', pass);
  WriteLn; Write('Presiona ENTER para salir...'); ReadLn;
end.
