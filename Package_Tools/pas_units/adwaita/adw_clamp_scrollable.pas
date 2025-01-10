unit adw_clamp_scrollable;

interface

uses
  fp_glib2, fp_GTK4, adw_length_unit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{G_DECLARE_FINAL_TYPE (AdwClampScrollable, adw_clamp_scrollable, ADW, CLAMP_SCROLLABLE, GtkWidget) }
type
  TAdwClampScrollable = record
  end;
  PAdwClampScrollable = ^TAdwClampScrollable;

  TAdwClampScrollableClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwClampScrollableClass = ^TAdwClampScrollableClass;

function adw_clamp_scrollable_get_type: TGType; cdecl; external libadwaita;
function adw_clamp_scrollable_new:PGtkWidget;cdecl;external libadwaita;
function adw_clamp_scrollable_get_child(self:PAdwClampScrollable):PGtkWidget;cdecl;external libadwaita;
procedure adw_clamp_scrollable_set_child(self:PAdwClampScrollable; child:PGtkWidget);cdecl;external libadwaita;
function adw_clamp_scrollable_get_maximum_size(self:PAdwClampScrollable):longint;cdecl;external libadwaita;
procedure adw_clamp_scrollable_set_maximum_size(self:PAdwClampScrollable; maximum_size:longint);cdecl;external libadwaita;
function adw_clamp_scrollable_get_tightening_threshold(self:PAdwClampScrollable):longint;cdecl;external libadwaita;
procedure adw_clamp_scrollable_set_tightening_threshold(self:PAdwClampScrollable; tightening_threshold:longint);cdecl;external libadwaita;
function adw_clamp_scrollable_get_unit(self:PAdwClampScrollable):TAdwLengthUnit;cdecl;external libadwaita;
procedure adw_clamp_scrollable_set_unit(self:PAdwClampScrollable; unit_:TAdwLengthUnit);cdecl;external libadwaita;

// === Konventiert am: 10-1-25 13:55:26 ===

function ADW_TYPE_CLAMP_SCROLLABLE: TGType;
function ADW_CLAMP_SCROLLABLE(obj: Pointer): PAdwClampScrollable;
function ADW_IS_CLAMP_SCROLLABLE(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_CLAMP_SCROLLABLE: TGType;
begin
  Result := adw_clamp_scrollable_get_type;
end;

function ADW_CLAMP_SCROLLABLE(obj: Pointer): PAdwClampScrollable;
begin
  Result := PAdwClampScrollable(g_type_check_instance_cast(obj, ADW_TYPE_CLAMP_SCROLLABLE));
end;

function ADW_IS_CLAMP_SCROLLABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CLAMP_SCROLLABLE);
end;


end.
