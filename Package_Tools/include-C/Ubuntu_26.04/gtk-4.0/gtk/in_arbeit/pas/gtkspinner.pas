unit gtkspinner;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkSpinner = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_spinner_get_type: TGType; cdecl; external libgtk4;
function gtk_spinner_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_spinner_start(spinner: PGtkSpinner); cdecl; external libgtk4;
procedure gtk_spinner_stop(spinner: PGtkSpinner); cdecl; external libgtk4;
procedure gtk_spinner_set_spinning(spinner: PGtkSpinner; spinning: Tgboolean); cdecl; external libgtk4;
function gtk_spinner_get_spinning(spinner: PGtkSpinner): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:09 ===

function GTK_TYPE_SPINNER: TGType;
function GTK_SPINNER(obj: Pointer): PGtkSpinner;
function GTK_IS_SPINNER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_SPINNER: TGType;
begin
  GTK_TYPE_SPINNER := gtk_spinner_get_type;
end;

function GTK_SPINNER(obj: Pointer): PGtkSpinner;
begin
  Result := PGtkSpinner(g_type_check_instance_cast(obj, GTK_TYPE_SPINNER));
end;

function GTK_IS_SPINNER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SPINNER);
end;



end.
