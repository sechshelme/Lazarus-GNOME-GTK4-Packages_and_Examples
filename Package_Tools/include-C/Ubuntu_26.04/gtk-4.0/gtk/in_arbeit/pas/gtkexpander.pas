unit gtkexpander;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkExpander = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_expander_get_type: TGType; cdecl; external libgtk4;
function gtk_expander_new(_label: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_expander_new_with_mnemonic(_label: pchar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_expander_set_expanded(expander: PGtkExpander; expanded: Tgboolean); cdecl; external libgtk4;
function gtk_expander_get_expanded(expander: PGtkExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_expander_set_label(expander: PGtkExpander; _label: pchar); cdecl; external libgtk4;
function gtk_expander_get_label(expander: PGtkExpander): pchar; cdecl; external libgtk4;
procedure gtk_expander_set_use_underline(expander: PGtkExpander; use_underline: Tgboolean); cdecl; external libgtk4;
function gtk_expander_get_use_underline(expander: PGtkExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_expander_set_use_markup(expander: PGtkExpander; use_markup: Tgboolean); cdecl; external libgtk4;
function gtk_expander_get_use_markup(expander: PGtkExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_expander_set_label_widget(expander: PGtkExpander; label_widget: PGtkWidget); cdecl; external libgtk4;
function gtk_expander_get_label_widget(expander: PGtkExpander): PGtkWidget; cdecl; external libgtk4;
procedure gtk_expander_set_resize_toplevel(expander: PGtkExpander; resize_toplevel: Tgboolean); cdecl; external libgtk4;
function gtk_expander_get_resize_toplevel(expander: PGtkExpander): Tgboolean; cdecl; external libgtk4;
procedure gtk_expander_set_child(expander: PGtkExpander; child: PGtkWidget); cdecl; external libgtk4;
function gtk_expander_get_child(expander: PGtkExpander): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:33:30 ===

function GTK_TYPE_EXPANDER: TGType;
function GTK_EXPANDER(obj: Pointer): PGtkExpander;
function GTK_IS_EXPANDER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_EXPANDER: TGType;
begin
  GTK_TYPE_EXPANDER := gtk_expander_get_type;
end;

function GTK_EXPANDER(obj: Pointer): PGtkExpander;
begin
  Result := PGtkExpander(g_type_check_instance_cast(obj, GTK_TYPE_EXPANDER));
end;

function GTK_IS_EXPANDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EXPANDER);
end;



end.
