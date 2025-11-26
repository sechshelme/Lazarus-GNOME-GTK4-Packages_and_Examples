unit fp_librdf;

interface

const
  {$IFDEF Linux}
  librdf = 'rdf';
  {$ENDIF}

  {$IFDEF Windows}
  librdf = 'librdf.dll'; // ??????
  {$ENDIF}

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//{$include <Redland/rdf_log.h>}
//{$include <Redland/rdf_digest.h>}
//{$include <Redland/rdf_hash.h>}
//{$include <Redland/rdf_init.h>}
//{$include <Redland/rdf_iterator.h>}
//{$include <Redland/rdf_uri.h>}
//{$include <Redland/rdf_node.h>}
//{$include <Redland/rdf_concepts.h>}
//{$include <Redland/rdf_statement.h>}
//{$include <Redland/rdf_model.h>}
//{$include <Redland/rdf_storage.h>}
//{$include <Redland/rdf_parser.h>}
//{$include <Redland/rdf_raptor.h>}
//{$include <Redland/rdf_serializer.h>}
//{$include <Redland/rdf_stream.h>}
//{$include <Redland/rdf_query.h>}
//{$include <Redland/rdf_utf8.h>}



const
  LIBRDF_VERSION = 10017;  
  LIBRDF_VERSION_STRING = '1.0.17';
  LIBRDF_VERSION_MAJOR = 1;
  LIBRDF_VERSION_MINOR = 0;
  LIBRDF_VERSION_RELEASE = 17;
type
  Tlibrdf_world_s = Tlibrdf_world;
  Tlibrdf_hash_s = Tlibrdf_hash;
  Tlibrdf_hash_cursor_s = Tlibrdf_hash_cursor;
  Tlibrdf_digest_s = Tlibrdf_digest;
  Tlibrdf_digest_factory_s = Tlibrdf_digest_factory;
  Traptor_uri_s = Tlibrdf_uri;
  Tlibrdf_list_s = Tlibrdf_list;
  Tlibrdf_iterator_s = Tlibrdf_iterator;

  Plibrdf_node = ^Tlibrdf_node;
  Tlibrdf_node = Traptor_term;

  Plibrdf_statement = ^Tlibrdf_statement;
  Tlibrdf_statement = Traptor_statement;

  Tlibrdf_model_s = Tlibrdf_model;
  Tlibrdf_model_factory_s = Tlibrdf_model_factory;
  Tlibrdf_storage_s = Tlibrdf_storage;
  Tlibrdf_storage_factory_s = Tlibrdf_storage_factory;
  Tlibrdf_stream_s = Tlibrdf_stream;
  Tlibrdf_parser_s = Tlibrdf_parser;
  Tlibrdf_parser_factory_s = Tlibrdf_parser_factory;
  Tlibrdf_query_s = Tlibrdf_query;
  Tlibrdf_query_factory_s = Tlibrdf_query_factory;
  Tlibrdf_query_results_s = Tlibrdf_query_results;
  Tlibrdf_query_results_formatter_s = Tlibrdf_query_results_formatter;
  Tlibrdf_serializer_s = Tlibrdf_serializer;
  Tlibrdf_serializer_factory_s = Tlibrdf_serializer_factory;
  var
    librdf_short_copyright_string : Pchar;cvar;external librdf;
    librdf_copyright_string : Pchar;cvar;external librdf;
    librdf_version_string : Pchar;cvar;external librdf;
    librdf_version_major : dword;cvar;external librdf;
    librdf_version_minor : dword;cvar;external librdf;
    librdf_version_release : dword;cvar;external librdf;
    librdf_version_decimal : dword;cvar;external librdf;
    librdf_license_string : Pchar;cvar;external librdf;
    librdf_home_url_string : Pchar;cvar;external librdf;

// === Konventiert am: 26-11-25 19:55:10 ===


implementation



end.
