unit gcontenttype;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function g_content_type_equals(type1: Pgchar; type2: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_a(_type: Pgchar; supertype: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_mime_type(_type: Pgchar; mime_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_is_unknown(_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_get_description(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_get_mime_type(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_get_icon(_type: Pgchar): PGIcon; cdecl; external libgio2;
function g_content_type_get_symbolic_icon(_type: Pgchar): PGIcon; cdecl; external libgio2;
function g_content_type_get_generic_icon_name(_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_can_be_executable(_type: Pgchar): Tgboolean; cdecl; external libgio2;
function g_content_type_from_mime_type(mime_type: Pgchar): Pgchar; cdecl; external libgio2;
function g_content_type_guess(filename: Pgchar; data: Pguchar; data_size: Tgsize; result_uncertain: Pgboolean): Pgchar; cdecl; external libgio2;
function g_content_type_guess_for_tree(root: PGFile): PPgchar; cdecl; external libgio2;
function g_content_types_get_registered: PGList; cdecl; external libgio2;

function g_content_type_get_mime_dirs: PPgchar; cdecl; external libgio2;
procedure g_content_type_set_mime_dirs(dirs: PPgchar); cdecl; external libgio2;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 16:35:59 ===


implementation



end.
