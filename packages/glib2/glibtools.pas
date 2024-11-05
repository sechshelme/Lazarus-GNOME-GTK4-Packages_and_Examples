unit GLIBTools;

interface

uses
  glib280;

procedure GObjectShowProperty(obj: Pointer);


implementation

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
          WriteStr(Value, Tgdouble(p));
        end;
        G_TYPE_DOUBLE: begin
          valueType := 'G_TYPE_DOUBLE';
          WriteStr(Value, Tgdouble(p));
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
  end;
end;


end.
