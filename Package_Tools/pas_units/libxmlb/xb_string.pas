unit xb_string;

interface

uses
  fp_glib2, fp_xmlb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure xb_string_append_union(xpath: PGString; fmt: Pgchar); cdecl; varargs; external libxmlb;
function xb_string_escape(str: Pgchar): Pgchar; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:54 ===


implementation



end.
