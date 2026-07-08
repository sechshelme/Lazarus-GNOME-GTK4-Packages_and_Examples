unit gtkcustomlayout;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkwidget, gtklayoutmanager;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGtkCustomRequestModeFunc = function(widget: PGtkWidget): TGtkSizeRequestMode; cdecl;
  TGtkCustomMeasureFunc = procedure(widget: PGtkWidget; orientation: TGtkOrientation; for_size: longint; minimum: Plongint; natural: Plongint; minimum_baseline: Plongint; natural_baseline: Plongint); cdecl;
  TGtkCustomAllocateFunc = procedure(widget: PGtkWidget; width: longint; height: longint; baseline: longint); cdecl;

  PGtkCustomLayout = type Pointer;

  TGtkCustomLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkCustomLayoutClass = ^TGtkCustomLayoutClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_custom_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_custom_layout_new(request_mode: TGtkCustomRequestModeFunc; measure: TGtkCustomMeasureFunc; allocate: TGtkCustomAllocateFunc): PGtkLayoutManager; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:08:24 ===

function GTK_TYPE_CUSTOM_LAYOUT: TGType;
function GTK_CUSTOM_LAYOUT(obj: Pointer): PGtkCustomLayout;
function GTK_IS_CUSTOM_LAYOUT(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CUSTOM_LAYOUT: TGType;
begin
  Result := gtk_custom_layout_get_type;
end;

function GTK_CUSTOM_LAYOUT(obj: Pointer): PGtkCustomLayout;
begin
  Result := PGtkCustomLayout(g_type_check_instance_cast(obj, GTK_TYPE_CUSTOM_LAYOUT));
end;

function GTK_IS_CUSTOM_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CUSTOM_LAYOUT);
end;

end.
