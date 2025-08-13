program project1;

uses
  clib,

  fp_net,


  fp_socket,
  fp_stdio,
  fp_string,
  fp_stdlib,
  fp_time;

  procedure main;
  var
    if_ni, p: Pif_nameindex;
  begin
    if_ni := if_nameindex;
    if if_ni = nil then begin
      WriteLn('if_nameindex');
      Exit;
    end;

    WriteLn('Liste der Netzwerk-Interfaces:');
    p := if_ni;
    while p^.if_index <> 0 do begin
      printf('  Index: %u, Name: %s'#10, p^.if_index, p^.if_name);
      Inc(p);
    end;

    if_freenameindex(if_ni);
  end;

begin
  main;
end.
