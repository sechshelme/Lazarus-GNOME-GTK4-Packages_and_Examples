unit rdf;

interface

uses
  fp_rdf;

const
  LIBRDF_VERSION = 10017;
  LIBRDF_VERSION_STRING_ = '1.0.17';
  LIBRDF_VERSION_MAJOR_ = 1;
  LIBRDF_VERSION_MINOR_ = 0;
  LIBRDF_VERSION_RELEASE_ = 17;

type
  Plibrdf_world = type Pointer;
  Plibrdf_hash = type Pointer;
  Plibrdf_hash_cursor = type Pointer;
  Plibrdf_digest = type Pointer;
  Plibrdf_digest_factory = type Pointer;
  Plibrdf_uri = type Pointer;
  Plibrdf_list = type Pointer;
  Plibrdf_iterator = type Pointer;
  Plibrdf_node =Praptor_term;
  PPlibrdf_node=^Plibrdf_node;
  Plibrdf_statement=Praptor_statement;
  Plibrdf_model = type Pointer;
  Plibrdf_model_factory = type Pointer;
  Plibrdf_storage = type Pointer;
  Plibrdf_storage_factory = type Pointer;
  Plibrdf_stream = type Pointer;
  Plibrdf_parser = type Pointer;
  Plibrdf_parser_factory = type Pointer;
  Plibrdf_query = type Pointer;
  Plibrdf_query_factory = type Pointer;
  Plibrdf_query_results = type Pointer;
  Plibrdf_query_results_formatter = type Pointer;
  Plibrdf_serializer = type Pointer;
  Plibrdf_serializer_factory = type Pointer;

var
  librdf_short_copyright_string: pchar; cvar;external librdf;
  librdf_copyright_string: pchar; cvar;external librdf;
  librdf_version_string: pchar; cvar;external librdf;
  librdf_version_major: dword; cvar;external librdf;
  librdf_version_minor: dword; cvar;external librdf;
  librdf_version_release: dword; cvar;external librdf;
  librdf_version_decimal: dword; cvar;external librdf;
  librdf_license_string: pchar; cvar;external librdf;
  librdf_home_url_string: pchar; cvar;external librdf;

  // === Konventiert am: 26-11-25 19:55:10 ===


implementation



end.
