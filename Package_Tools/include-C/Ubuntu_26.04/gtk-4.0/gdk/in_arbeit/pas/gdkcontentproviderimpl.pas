unit gdkcontentproviderimpl;

interface

uses
  fp_glib2, fp_gtk4, gdktypes, gdkcontentprovider;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_content_provider_new_for_value(value: PGValue): PGdkContentProvider; cdecl; external libgtk4;
function gdk_content_provider_new_typed(_type: TGType): PGdkContentProvider; cdecl; varargs; external libgtk4;
function gdk_content_provider_new_union(providers: PPGdkContentProvider; n_providers: Tgsize): PGdkContentProvider; cdecl; external libgtk4;
function gdk_content_provider_new_for_bytes(mime_type: pchar; bytes: PGBytes): PGdkContentProvider; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 17:29:31 ===


implementation



end.
