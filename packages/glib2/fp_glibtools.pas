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
  Count: Tguint;
  i: integer;
  valueType, Value: string;
  Name: Pgchar;
  p: Tgpointer;
begin
  if (obj <> nil) and G_IS_OBJECT(obj) then begin
    paramspec := g_object_class_list_properties(G_OBJECT_GET_CLASS(obj), @Count);

    WriteLn('count:', Count);
    for i := 0 to Count - 1 do begin
      Value := '<unknow>';
      Name := paramspec[i]^.Name;
      g_object_get(G_OBJECT(obj), Name, @p, nil);
      case paramspec[i]^.value_type of
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
          WriteStr(Value, Tgint8(p));
        end;
        G_TYPE_UCHAR: begin
          valueType := 'G_TYPE_UCHAR';
          WriteStr(Value, Tguint8(p));
        end;
        G_TYPE_BOOLEAN: begin
          valueType := 'G_TYPE_BOOLEAN';
          WriteStr(Value, Tgboolean(p));
        end;
        G_TYPE_INT: begin
          valueType := 'G_TYPE_INT';
          WriteStr(Value, Tgint(p));
        end;
        G_TYPE_UINT: begin
          valueType := 'G_TYPE_UINT';
          WriteStr(Value, Tguint(p));
        end;
        G_TYPE_ULONG: begin
          valueType := 'G_TYPE_ULONG';
          WriteStr(Value, Tgulong(p));
        end;
        G_TYPE_INT64: begin
          valueType := 'G_TYPE_INT64';
          WriteStr(Value, Tgint64(p));
        end;
        G_TYPE_UINT64: begin
          valueType := 'G_TYPE_UINT64';
          WriteStr(Value, Tguint64(p));
        end;
        G_TYPE_ENUM: begin
          valueType := 'G_TYPE_ENUM';
          WriteStr(Value, Tguint(p));
        end;
        G_TYPE_FLAGS: begin
          valueType := 'G_TYPE_FLAGS';
          WriteStr(Value, Tguint(p));
        end;
        G_TYPE_FLOAT: begin
          valueType := 'G_TYPE_FLOAT';
          WriteStr(Value, Tgfloat(Tgdouble(p)): 6: 3);
        end;
        G_TYPE_DOUBLE: begin
          valueType := 'G_TYPE_DOUBLE';
          WriteStr(Value, Tgdouble(p): 6: 3);
        end;
        G_TYPE_STRING: begin
          valueType := 'G_TYPE_STRING';
          Value := Pgchar(p);
        end;
        G_TYPE_POINTER: begin
          valueType := 'G_TYPE_POINTER';
          WriteStr(Value, PtrUInt(p));
        end;
        G_TYPE_BOXED: begin
          valueType := 'G_TYPE_BOXED';
          Value := 'BOXED';
        end;
        G_TYPE_OBJECT: begin
          valueType := 'G_TYPE_OBJECT';
          Value := 'OBJECT';
        end;
        G_TYPE_RESERVED_GLIB_FIRST: begin
          valueType := 'G_TYPE_RESERVED_GLIB_FIRST';
        end;
        G_TYPE_RESERVED_GLIB_LAST: begin
          valueType := 'G_TYPE_RESERVED_GLIB_LAST';
        end;
        G_TYPE_RESERVED_BSE_FIRST: begin
          valueType := 'G_TYPE_RESERVED_BSE_FIRST';
        end;
        //          G_TYPE_RESERVED_BSE_LAST: begin
        //            valueType := 'G_TYPE_RESERVED_BSE_LAST';
        //          end;
        G_TYPE_RESERVED_USER_FIRST: begin
          valueType := 'G_TYPE_RESERVED_USER_FIRST';
        end;
        else begin
          WriteStr(valueType, '<unknow> (', paramspec[i]^.value_type, ')');
        end;
      end;

      WriteLn(i: 3, '. Name: ', Name: 20, '  Valuetype: ', valueType: 15, '  Value: ', Value, '  Flag: ', paramspec[i]^.flags);
    end;
    g_free(paramspec);
  end else WriteLn('not a Object');
end;


end.
