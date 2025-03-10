
{$IFDEF read_interface}

type
  TGtkPrintContext = record // _GtkPrintContext
  end;
  PGtkPrintContext = ^TGtkPrintContext;

function gtk_print_context_get_type: TGType; cdecl; external libgtk4;
function gtk_print_context_get_cairo_context(context: PGtkPrintContext): Pcairo_t; cdecl; external libgtk4;
function gtk_print_context_get_page_setup(context: PGtkPrintContext): PGtkPageSetup; cdecl; external libgtk4;
function gtk_print_context_get_width(context: PGtkPrintContext): Tdouble; cdecl; external libgtk4;
function gtk_print_context_get_height(context: PGtkPrintContext): Tdouble; cdecl; external libgtk4;
function gtk_print_context_get_dpi_x(context: PGtkPrintContext): Tdouble; cdecl; external libgtk4;
function gtk_print_context_get_dpi_y(context: PGtkPrintContext): Tdouble; cdecl; external libgtk4;
function gtk_print_context_get_hard_margins(context: PGtkPrintContext; top: Pdouble; bottom: Pdouble; left: Pdouble; right: Pdouble): Tgboolean; cdecl; external libgtk4;
function gtk_print_context_get_pango_fontmap(context: PGtkPrintContext): PPangoFontMap; cdecl; external libgtk4;
function gtk_print_context_create_pango_context(context: PGtkPrintContext): PPangoContext; cdecl; external libgtk4;
function gtk_print_context_create_pango_layout(context: PGtkPrintContext): PPangoLayout; cdecl; external libgtk4;
procedure gtk_print_context_set_cairo_context(context: PGtkPrintContext; cr: Pcairo_t; dpi_x: Tdouble; dpi_y: Tdouble); cdecl; external libgtk4;

// === Konventiert am: 24-7-24 16:37:48 ===

function GTK_TYPE_PRINT_CONTEXT: TGType;
function GTK_PRINT_CONTEXT(obj: Pointer): PGtkPrintContext;
function GTK_IS_PRINT_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_PRINT_CONTEXT: TGType;
begin
  GTK_TYPE_PRINT_CONTEXT := gtk_print_context_get_type;
end;

function GTK_PRINT_CONTEXT(obj: Pointer): PGtkPrintContext;
begin
  Result := PGtkPrintContext(g_type_check_instance_cast(obj, GTK_TYPE_PRINT_CONTEXT));
end;

function GTK_IS_PRINT_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PRINT_CONTEXT);
end;



{$ENDIF read_implementation}
