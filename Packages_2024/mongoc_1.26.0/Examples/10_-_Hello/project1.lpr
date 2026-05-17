program project1;

uses
  fp_bson,
  fp_mongoc;

  // --- Setup Info ---
  // Erstellen: docker run -d -p 27017:27017 --name local-mongo mongo
  // Starten:   docker start local-mongo
  // Stoppen:   docker stop local-mongo

  // docker exec -it local-mongo bash

  // Löschen:   docker rm -f local-mongo
  // ---

  // /usr/include/libbson-1.0/bson


const
  uri_string = 'mongodb://localhost:27017';


  procedure PrintData(doc: Pbson_t);
  var
    iter: Tbson_iter_t;
    key, values: pchar;
    typ: Tbson_type_t;
    len: uint32;
    valuei: Tint32_t;
    valued: double;
    s:array[0..127] of Char;
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

  procedure read_data;
  var
    uri: Pmongoc_uri_t;
    client: Pmongoc_client_t;
    collection: Pmongoc_collection_t;
    doc, query: Pbson_t;
    iter: Tbson_iter_t;
    cursor: Pmongoc_cursor_t;
    error: Tbson_error_t;
    str: pchar;
    i: integer;
  const
    keys: array of pchar = ('hello', 'hallo');

  begin
    uri := mongoc_uri_new_with_error(uri_string, @error);
    if uri = nil then begin
      Exit;
    end;

    client := mongoc_client_new_from_uri(uri);
    if client = nil then begin
      Exit;
    end;

    collection := mongoc_client_get_collection(client, 'mydb', 'mycoll');
    query := bson_new;
    cursor := mongoc_collection_find_with_opts(collection, query, nil, nil);

    WriteLn(#10'--- Daten aus der Cloud ---');
    while mongoc_cursor_next(cursor, @doc) do begin
      PrintData(doc);
    end;
    mongoc_cursor_destroy(cursor);
    mongoc_collection_destroy(collection);
    mongoc_client_destroy(client);
    mongoc_uri_destroy(uri);
  end;



  procedure write_data;
  var
    uri: Pmongoc_uri_t;
    error: Tbson_error_t;
    client: Pmongoc_client_t;
    collection: Pmongoc_collection_t;
    doc: Pbson_t;
  begin
    uri := mongoc_uri_new_with_error(uri_string, @error);
    client := mongoc_client_new_from_uri(uri);
    collection := mongoc_client_get_collection(client, 'mydb', 'mycoll');


    doc := bson_new;
    bson_append_utf8(doc, 'hello', -1, 'world', -1);
    if mongoc_collection_insert_one(collection, doc, nil, nil, @error) then begin
      WriteLn('Dokument 1 eingefügt!');
    end;
    bson_destroy(doc);

    doc := bson_new;
    bson_append_utf8(doc, 'hallo', -1, 'Welt', -1);
    if mongoc_collection_insert_one(collection, doc, nil, nil, @error) then begin
      WriteLn('Dokument 2 eingefügt!');
    end;
    bson_destroy(doc);

    doc := bson_new;
    bson_append_utf8(doc, 'hello', -1, 'world', -1);
    bson_append_int32(doc, 'number', -1, 123);
    bson_append_double(doc, 'float', -1, 12.34);
    if mongoc_collection_insert_one(collection, doc, nil, nil, @error) then begin
      WriteLn('Dokument 3 eingefügt!');
    end;
    bson_destroy(doc);

    mongoc_collection_destroy(collection);
    mongoc_client_destroy(client);
    mongoc_uri_destroy(uri);
  end;



  procedure main;
  begin
    mongoc_init;
    write_data;
    read_data;
    mongoc_cleanup();
  end;


begin
  main;
end.
