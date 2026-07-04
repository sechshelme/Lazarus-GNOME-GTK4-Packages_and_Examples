{$IFDEF read_interface}


function gdk_cairo_context_get_type: TGType; cdecl; external libgtk4;
function gdk_cairo_context_cairo_create(self: PGdkCairoContext): Pcairo_t; cdecl; external libgtk4; deprecated;

function GDK_CAIRO_ERROR: TGQuark;

// === Konventiert am: 2-7-26 17:35:42 ===

function GDK_TYPE_CAIRO_CONTEXT: TGType;
function GDK_CAIRO_CONTEXT(obj: Pointer): PGdkCairoContext;
function GDK_IS_CAIRO_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_CAIRO_CONTEXT: TGType;
begin
  GDK_TYPE_CAIRO_CONTEXT := gdk_cairo_context_get_type;
end;

function GDK_CAIRO_CONTEXT(obj: Pointer): PGdkCairoContext;
begin
  Result := PGdkCairoContext(g_type_check_instance_cast(obj, GDK_TYPE_CAIRO_CONTEXT));
end;

function GDK_IS_CAIRO_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_CAIRO_CONTEXT);
end;


function GDK_CAIRO_ERROR: TGQuark;
begin
  // Fehlt im original
  //  GDK_CAIRO_ERROR := gdk_cairo_error_quark;
end;


{$ENDIF read_implementation}
