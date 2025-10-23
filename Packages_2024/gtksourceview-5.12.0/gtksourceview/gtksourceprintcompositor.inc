{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourcePrintCompositor, gtk_source_print_compositor, GTK_SOURCE, PRINT_COMPOSITOR, GObject) }


type
  TGtkSourcePrintCompositor = record
    parent_instance: TGObject;
  end;
  PGtkSourcePrintCompositor = ^TGtkSourcePrintCompositor;

  TGtkSourcePrintCompositorClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourcePrintCompositorClass = ^TGtkSourcePrintCompositorClass;

function gtk_source_print_compositor_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_new(buffer: PGtkSourceBuffer): PGtkSourcePrintCompositor; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_new_from_view(view: PGtkSourceView): PGtkSourcePrintCompositor; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_buffer(compositor: PGtkSourcePrintCompositor): PGtkSourceBuffer; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_tab_width(compositor: PGtkSourcePrintCompositor; Width: Tguint); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_tab_width(compositor: PGtkSourcePrintCompositor): Tguint; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_wrap_mode(compositor: PGtkSourcePrintCompositor; wrap_mode: TGtkWrapMode); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_wrap_mode(compositor: PGtkSourcePrintCompositor): TGtkWrapMode; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_highlight_syntax(compositor: PGtkSourcePrintCompositor; highlight: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_highlight_syntax(compositor: PGtkSourcePrintCompositor): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_print_line_numbers(compositor: PGtkSourcePrintCompositor; interval: Tguint); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_print_line_numbers(compositor: PGtkSourcePrintCompositor): Tguint; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_body_font_name(compositor: PGtkSourcePrintCompositor; font_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_body_font_name(compositor: PGtkSourcePrintCompositor): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_line_numbers_font_name(compositor: PGtkSourcePrintCompositor; font_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_line_numbers_font_name(compositor: PGtkSourcePrintCompositor): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_header_font_name(compositor: PGtkSourcePrintCompositor; font_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_header_font_name(compositor: PGtkSourcePrintCompositor): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_footer_font_name(compositor: PGtkSourcePrintCompositor; font_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_footer_font_name(compositor: PGtkSourcePrintCompositor): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_top_margin(compositor: PGtkSourcePrintCompositor; unit_: TGtkUnit): Tgdouble; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_top_margin(compositor: PGtkSourcePrintCompositor; margin: Tgdouble; unit_: TGtkUnit); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_bottom_margin(compositor: PGtkSourcePrintCompositor; unit_: TGtkUnit): Tgdouble; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_bottom_margin(compositor: PGtkSourcePrintCompositor; margin: Tgdouble; unit_: TGtkUnit); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_left_margin(compositor: PGtkSourcePrintCompositor; unit_: TGtkUnit): Tgdouble; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_left_margin(compositor: PGtkSourcePrintCompositor; margin: Tgdouble; unit_: TGtkUnit); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_right_margin(compositor: PGtkSourcePrintCompositor; unit_: TGtkUnit): Tgdouble; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_right_margin(compositor: PGtkSourcePrintCompositor; margin: Tgdouble; unit_: TGtkUnit); cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_print_header(compositor: PGtkSourcePrintCompositor; print: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_print_header(compositor: PGtkSourcePrintCompositor): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_print_footer(compositor: PGtkSourcePrintCompositor; print: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_print_footer(compositor: PGtkSourcePrintCompositor): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_header_format(compositor: PGtkSourcePrintCompositor; separator: Tgboolean; left: Pgchar; center: Pgchar; right: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_set_footer_format(compositor: PGtkSourcePrintCompositor; separator: Tgboolean; left: Pgchar; center: Pgchar; right: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_n_pages(compositor: PGtkSourcePrintCompositor): Tgint; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_paginate(compositor: PGtkSourcePrintCompositor; context: PGtkPrintContext): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_print_compositor_get_pagination_progress(compositor: PGtkSourcePrintCompositor): Tgdouble; cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_draw_page(compositor: PGtkSourcePrintCompositor; context: PGtkPrintContext; page_nr: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_print_compositor_ignore_tag(compositor: PGtkSourcePrintCompositor; tag: PGtkTextTag); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 16:41:11 ===

function GTK_SOURCE_TYPE_PRINT_COMPOSITOR: TGType;
function GTK_SOURCE_PRINT_COMPOSITOR(obj: Pointer): PGtkSourcePrintCompositor;
function GTK_SOURCE_IS_PRINT_COMPOSITOR(obj: Pointer): Tgboolean;
function GTK_SOURCE_PRINT_COMPOSITOR_CLASS(klass: Pointer): PGtkSourcePrintCompositorClass;
function GTK_SOURCE_IS_PRINT_COMPOSITOR_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_PRINT_COMPOSITOR_GET_CLASS(obj: Pointer): PGtkSourcePrintCompositorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_PRINT_COMPOSITOR: TGType;
begin
  Result := gtk_source_print_compositor_get_type;
end;

function GTK_SOURCE_PRINT_COMPOSITOR(obj: Pointer): PGtkSourcePrintCompositor;
begin
  Result := PGtkSourcePrintCompositor(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_PRINT_COMPOSITOR));
end;

function GTK_SOURCE_IS_PRINT_COMPOSITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_PRINT_COMPOSITOR);
end;

function GTK_SOURCE_PRINT_COMPOSITOR_CLASS(klass: Pointer): PGtkSourcePrintCompositorClass;
begin
  Result := PGtkSourcePrintCompositorClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_PRINT_COMPOSITOR));
end;

function GTK_SOURCE_IS_PRINT_COMPOSITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_PRINT_COMPOSITOR);
end;

function GTK_SOURCE_PRINT_COMPOSITOR_GET_CLASS(obj: Pointer): PGtkSourcePrintCompositorClass;
begin
  Result := PGtkSourcePrintCompositorClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
