unit fp_GLIBTools;

interface

uses
  fp_glib2;

procedure GValueShow(v: PGValue);
procedure GObjectShowProperty(obj: Pointer);

implementation

procedure GValueShow(v: PGValue);
var
  typ: TGType;
  valueType, Value: string;
  ValueName, objName: Pgchar;
  obj: PGObject = nil;
  variant: PGVariant;
begin
  typ := G_VALUE_TYPE(v);
  ValueName := G_VALUE_TYPE_NAME(v);
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
      obj := g_value_get_object(v);
      objName := G_OBJECT_TYPE_NAME(obj);
      WriteStr(Value, objName);
    end;
    G_TYPE_VARIANT: begin
      valueType := 'G_TYPE_VARIANT';
      variant := g_value_get_variant(v);

      case g_variant_classify(variant) of
        G_VARIANT_CLASS_STRING: begin
          WriteStr(Value, 'G_VARIANT_CLASS_STRING');
        end;
      end;
    end;
    else begin
      if g_type_is_a(typ, G_TYPE_BOXED) then begin
        valueType := 'G_TYPE_BOXED';
        WriteStr(Value, g_type_name(typ));
      end else begin
        WriteStr(valueType, '<unknow> (', typ, ')');
      end;
    end;
  end;
  WriteLn('Name: ', ValueName: 20, '  Valuetype: ', valueType: 15, '  Value: ', Value);
end;


procedure GObjectShowProperty(obj: Pointer);
var
  paramspec: PPGParamSpec;
  n_properties: Tguint;
  i: integer;
  Name: Pgchar;
  Value: TGValue;
begin
  if (obj <> nil) and G_IS_OBJECT(obj) then begin
    paramspec := g_object_class_list_properties(G_OBJECT_GET_CLASS(obj), @n_properties);

    WriteLn('Property count: ', n_properties);
    for i := 0 to n_properties - 1 do begin
      Write(i: 3, '. ');
      if (paramspec[i]^.flags and G_PARAM_READABLE) = G_PARAM_READABLE then begin
        Value := G_VALUE_INIT_;
        Name := paramspec[i]^.Name;
        Write('Name: ', Name: 20, '   ');
        g_object_get_property(obj, Name, @Value);
        GValueShow(@Value);
        g_value_unset(@Value);
      end else begin
        WriteLn('readonly');
      end;
    end;
    g_free(paramspec);
  end else begin
    WriteLn('not a Object');
  end;
  WriteLn();
end;


end.
