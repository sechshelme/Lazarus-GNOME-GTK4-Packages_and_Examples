program project1;

uses
bson_memory,
bson_config,
bson_types,
bson_error,
bson_json,
bson_clock,
bson_context,
bson_decimal128,
bson_iter,
bson_keys,
bson_md5,
bson_oid,
bson_reader,
bson_string,
bson_utf8,
bson_value,
bson_version,
bson_version_functions,
bson_writer,
bcon,
bson,


fp_bson;


// --- Setup Info ---
// Erstellen: docker run -d -p 27017:27017 --name local-mongo mongo
// Starten:   docker start local-mongo
// Stoppen:   docker stop local-mongo

// Löschen:   docker rm -f local-mongo
// ---

// /usr/include/libbson-1.0/bson



const uri_string = 'mongodb://localhost:27017';


procedure main;
begin
end;

begin
  main;
end.

