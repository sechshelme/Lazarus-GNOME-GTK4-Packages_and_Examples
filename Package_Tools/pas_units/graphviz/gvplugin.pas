unit gvplugin;

interface

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tgvplugin_installed_t = record
    id: longint;
    _type: pchar;
    quality: longint;
    engine: pointer;
    features: pointer;
  end;
  Pgvplugin_installed_t = ^Tgvplugin_installed_t;

  Pgvplugin_api_t = type Pointer;

  Tgvplugin_library_t = record
    packagename: pchar;
    apis: Pgvplugin_api_t;
  end;
  Pgvplugin_library_t = ^Tgvplugin_library_t;

  // === Konventiert am: 3-12-25 15:07:58 ===


implementation



end.
