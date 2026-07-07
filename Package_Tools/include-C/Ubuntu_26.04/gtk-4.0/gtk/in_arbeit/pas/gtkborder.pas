unit gtkborder;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkBorder = ^TGtkBorder;
  TGtkBorder = record
    left: Tgint16;
    right: Tgint16;
    top: Tgint16;
    bottom: Tgint16;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_border_get_type: TGType; cdecl; external libgtk4;
function gtk_border_new: PGtkBorder; cdecl; external libgtk4;
function gtk_border_copy(border_: PGtkBorder): PGtkBorder; cdecl; external libgtk4;
procedure gtk_border_free(border_: PGtkBorder); cdecl; external libgtk4;

// === Konventiert am: 5-7-26 19:15:26 ===

function GTK_TYPE_BORDER: TGType;
{$ENDIF read_function}

implementation

function GTK_TYPE_BORDER: TGType;
begin
  GTK_TYPE_BORDER := gtk_border_get_type;
end;



end.
