unit gvconfig;

interface

uses
  fp_graphviz, gvcext, gvplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure gvconfig_plugin_install_from_library(gvc: PGVC_t; path: pchar; lib: Pgvplugin_library_t); cdecl; external libgvc;

// === Konventiert am: 3-12-25 15:08:01 ===


implementation



end.
