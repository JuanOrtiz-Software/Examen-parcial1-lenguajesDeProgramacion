program ArbolBinario;
uses Crt;

type
  PNodo = ^TNodo;
  TNodo = record
    valor: Integer;
    izq, der: PNodo;
  end;

procedure Insertar(var raiz: PNodo; v: Integer);
begin
  if raiz = nil then
  begin
    New(raiz);
    raiz^.valor := v;
    raiz^.izq := nil;
    raiz^.der := nil;
  end
  else if v <= raiz^.valor then
    Insertar(raiz^.izq, v)   { duplicados a la izquierda }
  else
    Insertar(raiz^.der, v);
end;

procedure Preorden(r: PNodo);
begin
  if r = nil then Exit;
  Write(r^.valor, ' ');
  Preorden(r^.izq);
  Preorden(r^.der);
end;

procedure Inorden(r: PNodo);
begin
  if r = nil then Exit;
  Inorden(r^.izq);
  Write(r^.valor, ' ');
  Inorden(r^.der);
end;

procedure Postorden(r: PNodo);
begin
  if r = nil then Exit;
  Postorden(r^.izq);
  Postorden(r^.der);
  Write(r^.valor, ' ');
end;

procedure Liberar(var r: PNodo);
begin
  if r = nil then Exit;
  Liberar(r^.izq);
  Liberar(r^.der);
  Dispose(r);
  r := nil;
end;

var
  raiz: PNodo;
  x: Integer;
begin
  raiz := nil;

  WriteLn('Inserta enteros para el arbol (termina con -1):');
  while True do
  begin
    ReadLn(x);
    if x = -1 then Break;
    Insertar(raiz, x);
  end;

  WriteLn;
  Write('Recorrido PREORDEN:  ');
  Preorden(raiz);  WriteLn;
  Write('Recorrido INORDEN:   ');
  Inorden(raiz);   WriteLn;
  Write('Recorrido POSTORDEN: ');
  Postorden(raiz); WriteLn;

  Liberar(raiz);

  WriteLn;
  Write('Presiona una tecla para salir...');
  ReadKey;
end.
