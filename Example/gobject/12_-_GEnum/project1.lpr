program project1;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ
// https://www.perplexity.ai/search/ich-habe-mit-g-value-type-v-er-Bu9RAwNVQ5Wn4QYqLQttMg
// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gen-.cUon06lQ9evSF5g2V2Kyg

uses
  ctypes,
  fp_glib2;

  procedure SetColorHigh;
  begin
    g_printf(#27'[037m');
  end;

  procedure SetColorYellow;
  begin
    g_printf(#27'[033m');
  end;


  procedure SetColorDefault;
  begin
    g_printf(#27'[0m');
  end;


  procedure printValue(v: PGValue);
  var
    typ: TGType;
    valueType, Value: string;
    Name: Pgchar;
  begin
    typ := G_VALUE_TYPE(v);
    Name := G_VALUE_TYPE_NAME(v);
    case typ of
      G_TYPE_INVALID: begin
        valueType := 'G_TYPE_INVALID';
      end;
      G_TYPE_NONE: begin
        valueType := 'G_TYPE_NONE';
      end;
      G_TYPE_INTERFACE: begin
        valueType := 'G_TYPE_INTERFACE';
      end;
      G_TYPE_CHAR: begin
        valueType := 'G_TYPE_CHAR';
        WriteStr(Value, char(g_value_get_char(v)));
      end;
      G_TYPE_UCHAR: begin
        valueType := 'G_TYPE_UCHAR';
        WriteStr(Value, Tguint8(g_value_get_char(v)));
      end;
      G_TYPE_BOOLEAN: begin
        valueType := 'G_TYPE_BOOLEAN';
        WriteStr(Value, g_value_get_boolean(v));
      end;
      G_TYPE_INT: begin
        valueType := 'G_TYPE_INT';
        WriteStr(Value, g_value_get_int(v));
      end;
      G_TYPE_UINT: begin
        valueType := 'G_TYPE_UINT';
        WriteStr(Value, g_value_get_uint(v));
      end;
      G_TYPE_LONG: begin
        valueType := 'G_TYPE_ULONG';
        WriteStr(Value, g_value_get_ulong(v));
      end;
      G_TYPE_ULONG: begin
        valueType := 'G_TYPE_LONG';
        WriteStr(Value, g_value_get_long(v));
      end;
      G_TYPE_INT64: begin
        valueType := 'G_TYPE_INT64';
        WriteStr(Value, g_value_get_int64(v));
      end;
      G_TYPE_UINT64: begin
        valueType := 'G_TYPE_UINT64';
        WriteStr(Value, g_value_get_uint64(v));
      end;
      G_TYPE_ENUM: begin
        valueType := 'G_TYPE_ENUM';
        WriteStr(Value, g_value_get_enum(v));
      end;
      G_TYPE_FLAGS: begin
        valueType := 'G_TYPE_FLAGS';
        WriteStr(Value, g_value_get_flags(v));
      end;
      G_TYPE_FLOAT: begin
        valueType := 'G_TYPE_FLOAT';
        WriteStr(Value, g_value_get_float(v));
      end;
      G_TYPE_DOUBLE: begin
        valueType := 'G_TYPE_DOUBLE';
        WriteStr(Value, g_value_get_double(v));
      end;
      G_TYPE_STRING: begin
        valueType := 'G_TYPE_STRING';
        WriteStr(Value, g_value_get_string(v));
      end;
      G_TYPE_POINTER: begin
        valueType := 'G_TYPE_POINTER';
        WriteStr(Value, PtrUInt(g_value_get_pointer(v)));
      end;
      G_TYPE_BOXED: begin
        valueType := 'G_TYPE_BOXED';
        WriteStr(Value, PtrUInt(g_value_get_boxed(v)));
      end;
      G_TYPE_OBJECT: begin
        valueType := 'G_TYPE_OBJECT';
        WriteStr(Value, PtrUInt(g_value_get_object(v)));
      end;
      else begin
        WriteStr(valueType, '<unknow> (', typ, ')');
      end;
    end;
    WriteLn('Name: ', Name: 20, '  Valuetype: ', valueType: 20, '  Value: ', Value);
  end;

const
  FRUIT_APPLE = 0;
  FRUIT_BANANE = 1;
  FRUIT_CHERRY = 2;
  FRUIT_PEARSY = 3;
  FRUIT_KIWI = 4;
  FRUIT_ORANGE = 5;
  N_FRUIT = 6;


  function mein_enum_get_type: TGType;
  const
    fruit_enum_values: array of TGEnumValue = (
      (Value: FRUIT_APPLE; value_name: 'FRUIT_APPLE'; value_nick: 'Apfel'),
      (Value: FRUIT_BANANE; value_name: 'FRUIT_BANANE'; value_nick: 'Banane'),
      (Value: FRUIT_CHERRY; value_name: 'FRUIT_CHERRY'; value_nick: 'Kirsche'),
      (Value: FRUIT_PEARSY; value_name: 'FRUIT_PEARSY'; value_nick: 'Birnen'),
      (Value: FRUIT_KIWI; value_name: 'FRUIT_KIWI'; value_nick: 'Kiwi'),
      (Value: FRUIT_ORANGE; value_name: 'FRUIT_ORANGE'; value_nick: 'Orange'),
      (Value: N_FRUIT; value_name: nil; value_nick: nil));
  const
    etype: TGType = 0;
  begin
    if etype = 0 then begin
      etype := g_enum_register_static('Fruits', PGEnumValue(fruit_enum_values));
    end;
    Result := etype;
  end;

  procedure printEnumValue(v: pgvalue);
  var
    vt: TGType;
    ec: PGEnumClass;
    ev: Tgint;
    evi: PGEnumValue;
    Count: Tguint;
    i: integer;
  begin
    vt := G_VALUE_TYPE(v);
    if vt = mein_enum_get_type then begin
      ec := G_ENUM_CLASS(g_type_class_ref(vt));
      Count := ec^.n_values;
      g_printf('Count: %d'#10, Count);
      ev := g_value_get_enum(v);
      for i := 0 to Count - 1 do begin
        evi := g_enum_get_value(ec, i);
        if evi <> nil then begin
          if i = ev then begin
            SetColorYellow;
          end;
          g_printf('Value: %d  Name: %s  Nick: %s'#10, evi^.Value, evi^.value_name, evi^.value_nick);
          if i = ev then begin
            SetColorDefault;
          end;
        end;
      end;
    end;

    g_type_class_unref(ec);
  end;


  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    char_value, int_value, string_value, static_string_value, float_value,
    double_value, enum_value: TGValue;
  begin
    char_value := G_VALUE_INIT_;
    g_value_init(@char_value, G_TYPE_CHAR);
    g_value_set_char(@char_value, 'W');
    printValue(@char_value);
    g_value_unset(@char_value);

    int_value := G_VALUE_INIT_;
    g_value_init(@int_value, G_TYPE_INT);
    g_value_set_int(@int_value, 123);
    printValue(@int_value);
    g_value_unset(@int_value);

    float_value := G_VALUE_INIT_;
    g_value_init(@float_value, G_TYPE_FLOAT);
    g_value_set_float(@float_value, 123.456);
    printValue(@float_value);
    g_value_unset(@float_value);

    double_value := G_VALUE_INIT_;
    g_value_init(@double_value, G_TYPE_DOUBLE);
    g_value_set_double(@double_value, 456.123);
    printValue(@double_value);
    g_value_unset(@double_value);

    string_value := G_VALUE_INIT_;
    g_value_init(@string_value, G_TYPE_STRING);
    g_value_set_string(@string_value, 'Hello gobject');
    printValue(@string_value);
    g_value_unset(@string_value);

    static_string_value := G_VALUE_INIT_;
    g_value_init(@static_string_value, G_TYPE_STRING);
    g_value_set_static_string(@static_string_value, 'Hello gobject static');
    printValue(@static_string_value);

    //     EnumValue;

    enum_value := G_VALUE_INIT_;
    g_value_init(@enum_value, G_TYPE_ENUM);
    g_value_set_enum(@enum_value, 1);
    printValue(@enum_value);

    enum_value := G_VALUE_INIT_;
    g_value_init(@enum_value, mein_enum_get_type);
    g_value_set_enum(@enum_value, FRUIT_PEARSY);
    printValue(@enum_value);

    printEnumValue(@enum_value);

    g_value_unset(@string_value);

    Exit(0);
  end;

begin
  main(argc, argv);
end.
