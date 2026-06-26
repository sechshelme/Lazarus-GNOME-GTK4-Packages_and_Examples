program project1;

uses
  gtype,
  gtypeplugin,
  gvalue,
  genums,
  gparam,
  gparamspecs,
  gclosure,
  gsignal,
  gobject,
  gbinding,
  gbindinggroup,

  gboxed,
  glib_enumtypes,
  glib_types,
  gmarshal,
  gsignalgroup,
  gsourceclosure,
  gtypemodule,
  gvaluearray,
  gvaluecollector,
  gvaluetypes,

  fp_glib2;

  procedure main;
  var
    list: PPgchar;
    i: integer = 0;
    v: Pgchar;
  begin
    list := g_listenv;
    if list <> nil then begin
      while list[i] <> nil do begin
        v := g_getenv(list[i]);
        g_printf('%3d. %-30s   %s'#10, i, list[i], v);
        Inc(i);
      end;
      g_free(list);
    end;
  end;

begin
  main;
end.
