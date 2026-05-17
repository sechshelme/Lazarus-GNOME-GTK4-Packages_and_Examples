program project1;

uses
mongoc_version,
mongoc_config,
mongoc_flags,
mongoc_host_list,
mongoc_optional,
mongoc_server_api,
mongoc_server_description,
mongoc_read_concern,
mongoc_read_prefs,
mongoc_topology_description,
mongoc_apm,
mongoc_write_concern,
mongoc_bulk_operation,
mongoc_change_stream,
mongoc_uri,
mongoc_iovec,
mongoc_socket,
mongoc_stream,
mongoc_index,
mongoc_find_and_modify,
mongoc_collection,
mongoc_database,
mongoc_client_session,
mongoc_gridfs_file,
mongoc_gridfs_file_list,
mongoc_gridfs_file_page,
mongoc_gridfs,
mongoc_ssl,
mongoc_stream_gridfs,
mongoc_client_side_encryption,
mongoc_client,
mongoc_cursor,
mongoc_stream_buffered,
mongoc_stream_file,
mongoc_stream_socket,
mongoc_stream_tls,
mongoc_stream_tls_libressl,
mongoc_stream_tls_openssl,
mongoc_client_pool,
mongoc_error,
mongoc_gridfs_bucket,
mongoc_handshake,
mongoc_init,
mongoc_log,
mongoc_matcher,
mongoc_opcode,
mongoc_rand,
mongoc_sleep,
mongoc_version_functions,

fp_mongoc;


// --- Setup Info ---
// Erstellen: docker run -d -p 27017:27017 --name local-mongo mongo
// Starten:   docker start local-mongo
// Stoppen:   docker stop local-mongo

// Löschen:   docker rm -f local-mongo
// ---

// /usr/include/libbson-1.0/bson



const uri_string = 'mongodb://localhost:27017';

procedure read_data;
var
  uri: Pmongoc_uri_t;
error:  Pbson_error_t;
client: Pmongoc_client_t;
collection: Pmongoc_collection_t;
begin
    //mongoc_uri_t *uri;
    //mongoc_client_t *client;
    //mongoc_collection_t *collection;
    //mongoc_cursor_t *cursor;
    //const bson_t *doc;
    //char *str;
    //bson_t *query;
    //bson_error_t error;

    uri := mongoc_uri_new_with_error(uri_string, @error);
    if uri=nil then Exit;

    client := mongoc_client_new_from_uri(uri);
    if client=nil then Exit;

    collection := mongoc_client_get_collection(client, 'mydb', 'mycoll');
    query := bson_new;
    cursor = mongoc_collection_find_with_opts(collection, query, NULL, NULL);

    printf("\n--- Daten aus der Cloud ---\n");
    while (mongoc_cursor_next(cursor, &doc)) {
        str = bson_as_canonical_extended_json(doc, NULL);
        printf("%s\n", str);
        bson_free(str);


        // Wir suchen im Dokument nach dem Schlüssel "hello" oder "hallo"
   bson_iter_t iter;
        if (bson_iter_init_find (&iter, doc, "hello") && BSON_ITER_HOLDS_UTF8 (&iter)) {
            printf ("Wert: %s\n", bson_iter_utf8 (&iter, NULL));
        } else if (bson_iter_init_find (&iter, doc, "hallo") && BSON_ITER_HOLDS_UTF8 (&iter)) {
            printf ("Wert: %s\n", bson_iter_utf8 (&iter, NULL));
        }
    }

    if (mongoc_cursor_error(cursor, &error)) {
        fprintf(stderr, "Fehler: %s\n", error.message);
    }

    bson_destroy(query);
    mongoc_cursor_destroy(cursor);
    mongoc_collection_destroy(collection);
    mongoc_client_destroy(client);
    mongoc_uri_destroy(uri);
}

void write_data() {
    mongoc_uri_t *uri;
    mongoc_client_t *client;
    mongoc_collection_t *collection;
    bson_t *insert;
    bson_error_t error;

    uri = mongoc_uri_new_with_error(uri_string, &error);
    client = mongoc_client_new_from_uri(uri);
    collection = mongoc_client_get_collection(client, "mydb", "mycoll");

    insert = BCON_NEW("hello", BCON_UTF8("world"));
    if (mongoc_collection_insert_one(collection, insert, NULL, NULL, &error)) {
        printf("Dokument 1 eingefügt!\n");
    }
    bson_destroy(insert);

    insert = BCON_NEW("hallo", BCON_UTF8("welt"));
    if (mongoc_collection_insert_one(collection, insert, NULL, NULL, &error)) {
        printf("Dokument 2 eingefügt!\n");
    }
    bson_destroy(insert);

    mongoc_collection_destroy(collection);
    mongoc_client_destroy(client);
    mongoc_uri_destroy(uri);
}

procedure main;
begin
  mongoc_init();    // Einmal am Anfang
  write_data();
  read_data();
  mongoc_cleanup(); // Einmal am Ende
  return 0;
end;


begin
  main;
end.

