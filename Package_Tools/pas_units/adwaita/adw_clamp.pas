unit adw_clamp;

interface

uses
  fp_glib2, fp_GTK4, adw_length_unit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwClamp, adw_clamp, ADW, CLAMP, GtkWidget) }
type
  TAdwClamp = record
  end;
  PAdwClamp = ^TAdwClamp;

  TAdwClampClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwClampClass = ^TAdwClampClass;

function adw_clamp_get_type: TGType; cdecl; external libadwaita;
function adw_clamp_new: PGtkWidget; cdecl; external libadwaita;
function adw_clamp_get_child(self: PAdwClamp): PGtkWidget; cdecl; external libadwaita;
procedure adw_clamp_set_child(self: PAdwClamp; child: PGtkWidget); cdecl; external libadwaita;
function adw_clamp_get_maximum_size(self: PAdwClamp): longint; cdecl; external libadwaita;
procedure adw_clamp_set_maximum_size(self: PAdwClamp; maximum_size: longint); cdecl; external libadwaita;
function adw_clamp_get_tightening_threshold(self: PAdwClamp): longint; cdecl; external libadwaita;
procedure adw_clamp_set_tightening_threshold(self: PAdwClamp; tightening_threshold: longint); cdecl; external libadwaita;
function adw_clamp_get_unit(self: PAdwClamp): TAdwLengthUnit; cdecl; external libadwaita;
procedure adw_clamp_set_unit(self: PAdwClamp; unit_: TAdwLengthUnit); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:39:58 ===

function ADW_TYPE_CLAMP: TGType;
function ADW_CLAMP(obj: Pointer): PAdwClamp;
function ADW_IS_CLAMP(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_CLAMP: TGType;
begin
  Result := adw_clamp_get_type;
end;

function ADW_CLAMP(obj: Pointer): PAdwClamp;
begin
  Result := PAdwClamp(g_type_check_instance_cast(obj, ADW_TYPE_CLAMP));
end;

function ADW_IS_CLAMP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CLAMP);
end;


end.
