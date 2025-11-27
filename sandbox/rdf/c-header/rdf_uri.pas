unit rdf_uri;

interface

uses
  fp_rdf, rdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tlibrdf_uri_filter_func = function(user_data: pointer; uri: Plibrdf_uri): longint; cdecl;

function librdf_new_uri(world: Plibrdf_world; uri_string: pbyte): Plibrdf_uri; cdecl; external librdf;
function librdf_new_uri2(world: Plibrdf_world; uri_string: pbyte; length: Tsize_t): Plibrdf_uri; cdecl; external librdf;
function librdf_new_uri_from_uri(old_uri: Plibrdf_uri): Plibrdf_uri; cdecl; external librdf;
function librdf_new_uri_from_uri_local_name(old_uri: Plibrdf_uri; local_name: pbyte): Plibrdf_uri; cdecl; external librdf;
procedure librdf_free_uri(uri: Plibrdf_uri); cdecl; external librdf;
function librdf_uri_as_string(uri: Plibrdf_uri): pbyte; cdecl; external librdf;
function librdf_uri_as_counted_string(uri: Plibrdf_uri; len_p: Psize_t): pbyte; cdecl; external librdf;
procedure librdf_uri_print(uri: Plibrdf_uri; fh: PFILE); cdecl; external librdf;
function librdf_uri_to_string(uri: Plibrdf_uri): pbyte; cdecl; external librdf;
function librdf_uri_to_counted_string(uri: Plibrdf_uri; len_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_uri_equals(first_uri: Plibrdf_uri; second_uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_uri_compare(uri1: Plibrdf_uri; uri2: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_uri_is_file_uri(uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_uri_to_filename(uri: Plibrdf_uri): pchar; cdecl; external librdf;
function librdf_new_uri_normalised_to_base(uri_string: pbyte; source_uri: Plibrdf_uri; base_uri: Plibrdf_uri): Plibrdf_uri; cdecl; external librdf;
function librdf_new_uri_relative_to_base(base_uri: Plibrdf_uri; uri_string: pbyte): Plibrdf_uri; cdecl; external librdf;
function librdf_new_uri_from_filename(world: Plibrdf_world; filename: pchar): Plibrdf_uri; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:02 ===


implementation



end.
