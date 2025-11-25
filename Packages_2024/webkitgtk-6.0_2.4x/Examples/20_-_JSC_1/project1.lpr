program project1;

uses
  fp_glib2,
  fp_JSC;

  procedure main;
  var
    ctx: PJSCContext;
    res: PJSCValue;
    Value: Tgint32;
  begin
    ctx := jsc_context_new;
    res := jsc_context_evaluate(ctx, 'var x = 2; var y = 3; x + y;', -1);
    Value := jsc_value_to_int32(res);

    g_printf('Das Ergebnis von 2 + 3 ist:  %d'#10, Value);

    g_object_unref(res);
    g_object_unref(ctx);
  end;

begin
  main;
end.
