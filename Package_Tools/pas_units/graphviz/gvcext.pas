unit gvcext;

interface

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papi_t = ^Tapi_t;
  Tapi_t = longint;

type
  PGVJ_t = type Pointer;
  PGVG_t = type Pointer;
  PGVC_t = type Pointer;

  Plt_symlist_t = ^Tlt_symlist_t;

  Tlt_symlist_t = record
    name: pchar;
    address: pointer;
  end;
  Pgvplugin_available_t = type Pointer;

  // === Konventiert am: 3-12-25 15:08:12 ===


implementation



end.
