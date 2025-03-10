
{$IFDEF read_interface}

type
  TGdkDrawContext = record
  end;
  PGdkDrawContext = ^TGdkDrawContext;

function gdk_draw_context_get_type: TGType; cdecl; external libgtk4;
function gdk_draw_context_get_display(context: PGdkDrawContext): PGdkDisplay; cdecl; external libgtk4;
function gdk_draw_context_get_surface(context: PGdkDrawContext): PGdkSurface; cdecl; external libgtk4;
procedure gdk_draw_context_begin_frame(context: PGdkDrawContext; region: Pcairo_region_t); cdecl; external libgtk4;
procedure gdk_draw_context_end_frame(context: PGdkDrawContext); cdecl; external libgtk4;
function gdk_draw_context_is_in_frame(context: PGdkDrawContext): Tgboolean; cdecl; external libgtk4;
function gdk_draw_context_get_frame_region(context: PGdkDrawContext): Pcairo_region_t; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:23:10 ===

function GDK_TYPE_DRAW_CONTEXT: TGType;
function GDK_DRAW_CONTEXT(obj: Pointer): PGdkDrawContext;
function GDK_IS_DRAW_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_DRAW_CONTEXT: TGType;
begin
  GDK_TYPE_DRAW_CONTEXT := gdk_draw_context_get_type;
end;

function GDK_DRAW_CONTEXT(obj: Pointer): PGdkDrawContext;
begin
  Result := PGdkDrawContext(g_type_check_instance_cast(obj, GDK_TYPE_DRAW_CONTEXT));
end;

function GDK_IS_DRAW_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DRAW_CONTEXT);
end;



{$ENDIF read_implementation}
