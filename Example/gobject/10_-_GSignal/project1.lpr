program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools;

  procedure age_cp(self: PGObject; num: Tgint; Data: Tgpointer; Data2: Tgpointer; user_data: Tgpointer); cdecl;
  begin
    g_printf('%3d.  s1: %-10s   s2: %-10s   int: %d'#10, num, Data, Data2, user_data);
  end;

  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    age_signal_id: Tguint;
    obj: PGObject;
    detail: TGQuark;
    klass: PGObjectClass;
    i: integer;
  begin
    g_type_init;
    obj := g_object_new(G_TYPE_OBJECT, nil);
    klass := G_OBJECT_GET_CLASS(obj);

    age_signal_id := g_signal_new('age',
      G_TYPE_FROM_CLASS(klass),
      G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED,
      0,
      nil,
      nil,
      nil,
      G_TYPE_NONE,
      3,
      G_TYPE_INT,
      G_TYPE_STRING,
      G_TYPE_STRING);

    g_signal_connect(obj, 'age', G_CALLBACK(@age_cp), GINT_TO_POINTER(123));

    for i := 0 to 15 do begin
      g_signal_emit(obj, age_signal_id, 0, i, 'hello1', 'hello2');
      if i mod 10 = 0 then begin
        detail := g_quark_from_string('ten');
        g_signal_emit(obj, age_signal_id, detail, i, 'ten', 'ten');
      end;
    end;

    Exit(0);
  end;

begin
  main(argc, argv);
end.
