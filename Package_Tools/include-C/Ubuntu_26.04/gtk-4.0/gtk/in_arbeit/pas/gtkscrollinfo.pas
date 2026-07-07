unit gtkscrollinfo;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_function}
function gtk_scroll_info_get_type: TGType; cdecl; external libgtk4;
function gtk_scroll_info_new: PGtkScrollInfo; cdecl; external libgtk4;
function gtk_scroll_info_ref(self: PGtkScrollInfo): PGtkScrollInfo; cdecl; external libgtk4;
procedure gtk_scroll_info_unref(self: PGtkScrollInfo); cdecl; external libgtk4;
procedure gtk_scroll_info_set_enable_horizontal(self: PGtkScrollInfo; horizontal: Tgboolean); cdecl; external libgtk4;
function gtk_scroll_info_get_enable_horizontal(self: PGtkScrollInfo): Tgboolean; cdecl; external libgtk4;
procedure gtk_scroll_info_set_enable_vertical(self: PGtkScrollInfo; vertical: Tgboolean); cdecl; external libgtk4;
function gtk_scroll_info_get_enable_vertical(self: PGtkScrollInfo): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:07 ===

function GTK_TYPE_SCROLL_INFO: TGType;
{$ENDIF read_function}

implementation

function GTK_TYPE_SCROLL_INFO: TGType;
begin
  GTK_TYPE_SCROLL_INFO := gtk_scroll_info_get_type;
end;



end.
