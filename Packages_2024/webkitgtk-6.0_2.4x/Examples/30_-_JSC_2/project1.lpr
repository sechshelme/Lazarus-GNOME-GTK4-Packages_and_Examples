program project1;

uses
  fp_glib2,
  fp_JSC;

  procedure print_value(Value: PJSCValue);
  var
    s: pchar;
    num: double;
    b: Tgboolean;
  begin
    if jsc_value_is_string(Value) then begin
      s := jsc_value_to_string(Value);
      g_printf('String: %s'#10, s);
      g_free(s);
    end else if jsc_value_is_number(Value) then begin
      num := jsc_value_to_double(Value);
      g_printf('Number: %4.2f'#10, num);
    end else if jsc_value_is_boolean(Value) then begin
      b := jsc_value_to_boolean(Value);
      g_printf('Boolean: %d'#10, b);
    end else if jsc_value_is_null(Value) then begin
      b := jsc_value_to_boolean(Value);
      g_printf('(NULL)'#10);
    end else begin
      g_printf('Unhandled type'#10);
    end;
  end;


  procedure main;
  var
    context: PJSCContext;
    res, s, b: PJSCValue;
    Exception: PJSCException;
    error_message: pchar;
  begin
    context := jsc_context_new;

    s := jsc_value_new_string(context, 'Hello World');
    jsc_context_set_value(context, 's', s);

    b := jsc_value_new_boolean(context, True);
    jsc_context_set_value(context, 'b', b);

    res := jsc_context_evaluate(context, 'var x = 10; var y = 20; x + y;', -1);

    if jsc_context_get_exception(context) <> nil then begin
      Exception := jsc_context_get_exception(context);
      error_message := jsc_exception_get_message(Exception);
      g_printf('Exception: %s'#10, error_message);
    end else begin
      print_value(res);
      print_value(s);
      print_value(b);
    end;

    g_object_unref(res);
    g_object_unref(s);
    g_object_unref(b);
    g_object_unref(context);
  end;

begin
  main;
end.
