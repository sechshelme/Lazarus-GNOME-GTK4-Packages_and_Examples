unit mongoc_gridfs_file_page;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_gridfs_file_page_t = type Pointer;
  {$ENDIF read_struct}

  // === Konventiert am: 15-5-26 15:15:41 ===


implementation



end.
