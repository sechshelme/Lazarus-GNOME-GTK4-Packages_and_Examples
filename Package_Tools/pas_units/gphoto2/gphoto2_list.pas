unit gphoto2_list;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCameraList = type Pointer;
  PPCameraList = ^PCameraList;

function gp_list_new(list: PPCameraList): longint; cdecl; external libgphoto2;
function gp_list_ref(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_unref(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_free(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_count(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_append(list: PCameraList; name: pchar; value: pchar): longint; cdecl; external libgphoto2;
function gp_list_reset(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_sort(list: PCameraList): longint; cdecl; external libgphoto2;
function gp_list_find_by_name(list: PCameraList; index: Plongint; name: pchar): longint; cdecl; external libgphoto2;
function gp_list_get_name(list: PCameraList; index: longint; name: PPchar): longint; cdecl; external libgphoto2;
function gp_list_get_value(list: PCameraList; index: longint; value: PPchar): longint; cdecl; external libgphoto2;
function gp_list_set_name(list: PCameraList; index: longint; name: pchar): longint; cdecl; external libgphoto2;
function gp_list_set_value(list: PCameraList; index: longint; value: pchar): longint; cdecl; external libgphoto2;
function gp_list_populate(list: PCameraList; format: pchar; count: longint): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:57 ===


implementation



end.
