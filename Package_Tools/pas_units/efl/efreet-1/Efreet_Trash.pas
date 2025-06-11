unit Efreet_Trash;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efreet_uri;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efreet_trash_init: longint; cdecl; external libefreet;
function efreet_trash_shutdown: longint; cdecl; external libefreet;
function efreet_trash_dir_get(for_file: pchar): pchar; cdecl; external libefreet;
function efreet_trash_delete_uri(uri: PEfreet_Uri; force_delete: longint): longint; cdecl; external libefreet;
function efreet_trash_ls: PEina_List; cdecl; external libefreet;
function efreet_trash_is_empty: longint; cdecl; external libefreet;
function efreet_trash_empty_trash: longint; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:24 ===


implementation



end.
