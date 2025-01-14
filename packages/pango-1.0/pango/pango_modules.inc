
{$IFDEF read_interface}

type
  TPangoMap = record
  end;
  PPangoMap = ^TPangoMap;

  TPangoIncludedModule = record
    list: procedure(engines: PPPangoEngineInfo; n_engines: Plongint); cdecl;
    init: procedure(module: PGTypeModule); cdecl;
    exit_: procedure; cdecl;
    Create: function(id: pchar): PPangoEngine; cdecl;
  end;
  PPangoIncludedModule = ^TPangoIncludedModule;


function pango_find_map(language: PPangoLanguage; engine_type_id: Tguint; render_type_id: Tguint): PPangoMap; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_38
function pango_map_get_engine(map: PPangoMap; script: TPangoScript): PPangoEngine; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_38
procedure pango_map_get_engines(map: PPangoMap; script: TPangoScript; exact_engines: PPGSList; fallback_engines: PPGSList); cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_38
procedure pango_module_register(module: PPangoIncludedModule); cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_38

// === Konventiert am: 26-11-24 15:50:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
