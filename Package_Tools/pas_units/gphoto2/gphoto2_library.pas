unit gphoto2_library;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_camera, gphoto2_abilities_list, gphoto2_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCameraLibraryIdFunc = function(id: PCameraText): longint; cdecl;
  TCameraLibraryAbilitiesFunc = function(list: PCameraAbilitiesList): longint; cdecl;
  TCameraLibraryInitFunc = function(camera: PCamera; context: PGPContext): longint; cdecl;

function camera_id(id: PCameraText): longint; cdecl; external libgphoto2;
function camera_abilities(list: PCameraAbilitiesList): longint; cdecl; external libgphoto2;
function camera_init(camera: PCamera; context: PGPContext): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:46:55 ===


implementation



end.
