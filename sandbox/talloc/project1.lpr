program project1;

uses
  fp_talloc;

function talloc_free(ptr: pointer; location: pchar): longint; cdecl; external libtalloc name '_talloc_free';


  procedure main;
  var
    parent: Pointer;
    child1, child2: pchar;
  begin
    parent := talloc_named_const(nil, 0, 'error');
    talloc_set_name(parent, 'Haupt-Kontext');

    if parent = nil then begin
      Exit;
    end;;

    child1 := talloc_strdup(parent, 'Ich bin das erste Kind');
    child2 := talloc_asprintf(parent, 'Ich bin Kind Nummer %d', 2);

    WriteLn('Parent lebt. '#10, '  Child1: ', child1, #10'  Child2: ', child2);

    talloc_free(parent, 'error');

    WriteLn('Alles wurde automatisch mit einem Aufruf bereinigt.');
  end;

begin
  main;
end.
