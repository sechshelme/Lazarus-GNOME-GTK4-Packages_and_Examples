program project1;

uses
  fp_bson;

  procedure PrintData(doc: Pbson_t);
  var
    iter: Tbson_iter_t;
    key, values: pchar;
    typ: Tbson_type_t;
    len: uint32;
    valuei: Tint32_t;
    valued: double;
    s: array[0..127] of char;
  begin
    if bson_iter_init(@iter, doc) then begin
      while bson_iter_next(@iter) do begin
        key := bson_iter_key(@iter);
        typ := bson_iter_type(@iter);

        case typ of
          BSON_TYPE_UTF8: begin
            values := bson_iter_utf8(@iter, @len);
            WriteLn('Key: ', key, ' | Wert (String): ', values, ' (Länge: ', len, ')');
          end;
          BSON_TYPE_INT32: begin
            valuei := bson_iter_int32(@iter);
            WriteLn('Key: ', key, ' | Wert (Int32): ', valuei);
          end;
          BSON_TYPE_DOUBLE: begin
            valued := bson_iter_double(@iter);
            WriteLn('Key: ', key, ' | Wert (Double): ', valued: 4: 2);
          end;
          BSON_TYPE_BOOL: begin
            WriteLn('Key: ', key, ' | Wert (Bool): ', bson_iter_bool(@iter));
          end;
          BSON_TYPE_OID: begin
            bson_oid_to_string(bson_iter_oid(@iter), s);
            WriteLn('Key: ', key, ' | Wert (OID): ', s);
          end;
          BSON_TYPE_DOCUMENT: begin
            WriteLn('Key: ', key, ' | Wert ist ein Unterdokument');
          end;
          else begin
            WriteLn('Key: ', key, ' | Unbekannter Typ: ', typ);
          end;
        end;
      end;
    end;
  end;

  procedure main;
  var
    doc: Pbson_t;
    child: Tbson_t;
    str: pchar;
  begin
    doc := bson_new;

    bson_append_utf8(doc, 'hello', -1, 'world', -1);
    bson_append_int32(doc, 'number', -1, 123);
    bson_append_double(doc, 'float', -1, 12.34);

    bson_append_document_begin(doc, 'sub_doc', -1, @child);
    bson_append_utf8(@child, 'foo', -1, 'bar', -1);
    bson_append_document_end(doc, @child);

    str := bson_as_canonical_extended_json(doc, nil);
    if str <> nil then begin
      WriteLn(str);
      bson_free(str);
    end;

    PrintData(doc);

    bson_destroy(doc);
  end;

begin
  main;
end.
