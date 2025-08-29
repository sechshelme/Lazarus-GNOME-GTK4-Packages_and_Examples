program project1;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_gtk4,
  Rectangle,
  Human,
  Human_Child,
  Human_Child_Inc;

procedure PrintVariant(variant: PGVariant) ;
begin
  g_print('Variant Ergebnis: %s'#10, g_variant_print(variant, TRUE));
end;

const
  paths: array of Pgchar =('/blu/blu/1','/blu/blu2','/blu/blu/2', nil);

  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    Value: TGValue;
    action, hum: Tgpointer;
    arr: PGArray;
    rect: PERectangle;
    variant: PGVariant;
  begin
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_CHAR);
    g_value_set_char(@Value, 'W');
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_INT);
    g_value_set_int(@Value, 123);
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_FLOAT);
    g_value_set_float(@Value, 123.456);
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_DOUBLE);
    g_value_set_double(@Value, 456.123);
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_STRING);
    g_value_set_string(@Value, 'Hello gobject');
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_STRING);
    g_value_set_static_string(@Value, 'Hello gobject static');
    GValueShow(@Value);
    g_value_unset(@Value);

    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_ENUM);
    g_value_set_enum(@Value, 3);
    GValueShow(@Value);
    g_value_unset(@Value);

    arr := g_array_new(False, False, SizeOf(Tgint));
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_ARRAY);
    g_value_set_boxed(@Value, arr);
    GValueShow(@Value);
    g_value_unset(@Value);
    g_array_unref(arr);

    // ==== g_variant ====

    variant:=g_variant_new_boolean(True);
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new_byte(123);
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new_int32(12345);
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new_double(123.4567);
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new_string('Ich bin ein GVariant Sting');
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new_objv(PPgchar(paths), -1);
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

    variant:=g_variant_new('(is)', 123, 'Hello');
    PrintVariant(variant);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_VARIANT);
    g_value_set_variant(@Value, variant);
    GValueShow(@Value);
    g_value_unset(@Value);

   // ====================

    rect := e_rectangle_new(10, 20, 100, 50, 'MyRect');
    Value := G_VALUE_INIT_;
    g_value_init(@Value, E_TYPE_RECTANGLE);
    g_value_set_boxed(@Value, rect);
    GValueShow(@Value);
    g_value_unset(@Value);
    g_boxed_free(E_TYPE_RECTANGLE, rect);

    action := g_object_new(G_TYPE_APPLICATION, nil);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_OBJECT);
    g_value_set_object(@Value, G_OBJECT(action));
    GValueShow(@Value);
    g_value_unset(@Value);
    GObjectShowProperty(action);
    g_object_unref(action);

    hum := g_object_new(E_TYPE_HUMANINC, nil);
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_OBJECT);
    g_value_set_object(@Value, G_OBJECT(hum));
    GValueShow(@Value);
    g_value_unset(@Value);
    GObjectShowProperty(hum);
    g_object_unref(hum);

    Exit(0);
  end;

begin
  main(argc, argv);
end.
