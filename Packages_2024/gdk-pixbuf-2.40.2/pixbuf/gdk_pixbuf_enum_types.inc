
{$IFDEF read_interface}

function gdk_pixbuf_alpha_mode_get_type: TGType; cdecl; external libgdk_pixbuf2;
function GDK_TYPE_PIXBUF_ALPHA_MODE: TGType;

function gdk_colorspace_get_type: TGType; cdecl; external libgdk_pixbuf2;
function GDK_TYPE_COLORSPACE: TGType;

function gdk_pixbuf_error_get_type: TGType; cdecl; external libgdk_pixbuf2;
function GDK_TYPE_PIXBUF_ERROR: TGType;

function gdk_interp_type_get_type: TGType; cdecl; external libgdk_pixbuf2;
function GDK_TYPE_INTERP_TYPE: TGType;

function gdk_pixbuf_rotation_get_type: TGType; cdecl; external libgdk_pixbuf2;
function GDK_TYPE_PIXBUF_ROTATION: TGType;


// === Konventiert am: 8-11-24 17:06:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GDK_TYPE_PIXBUF_ALPHA_MODE: TGType;
begin
  GDK_TYPE_PIXBUF_ALPHA_MODE := gdk_pixbuf_alpha_mode_get_type;
end;

function GDK_TYPE_COLORSPACE: TGType;
begin
  GDK_TYPE_COLORSPACE := gdk_colorspace_get_type;
end;

function GDK_TYPE_PIXBUF_ERROR: TGType;
begin
  GDK_TYPE_PIXBUF_ERROR := gdk_pixbuf_error_get_type;
end;

function GDK_TYPE_INTERP_TYPE: TGType;
begin
  GDK_TYPE_INTERP_TYPE := gdk_interp_type_get_type;
end;

function GDK_TYPE_PIXBUF_ROTATION: TGType;
begin
  GDK_TYPE_PIXBUF_ROTATION := gdk_pixbuf_rotation_get_type;
end;


{$ENDIF read_implementation}
