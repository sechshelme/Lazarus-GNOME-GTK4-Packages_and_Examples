unit mongoc_stream_gridfs;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_gridfs_file, mongoc_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function mongoc_stream_gridfs_new(file_: Pmongoc_gridfs_file_t): Pmongoc_stream_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:36 ===


implementation



end.
