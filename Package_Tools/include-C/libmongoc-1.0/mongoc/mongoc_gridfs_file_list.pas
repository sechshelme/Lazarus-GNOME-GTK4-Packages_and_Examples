unit mongoc_gridfs_file_list;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_gridfs_file;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_gridfs_file_list_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_gridfs_file_list_next(list: Pmongoc_gridfs_file_list_t): Pmongoc_gridfs_file_t; cdecl; external libmongoc;
procedure mongoc_gridfs_file_list_destroy(list: Pmongoc_gridfs_file_list_t); cdecl; external libmongoc;
function mongoc_gridfs_file_list_error(list: Pmongoc_gridfs_file_list_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:43 ===


implementation



end.
