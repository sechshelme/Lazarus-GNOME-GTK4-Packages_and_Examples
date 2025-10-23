{$IFDEF read_interface}


{G_DECLARE_FINAL_TYPE (AdwClampLayout, adw_clamp_layout, ADW, CLAMP_LAYOUT, GtkLayoutManager) }
type
  TAdwClampLayout = record
  end;
  PAdwClampLayout = ^TAdwClampLayout;

  TAdwClampLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PAdwClampLayoutClass = ^TAdwClampLayoutClass;

function adw_clamp_layout_get_type: TGType; cdecl; external libadwaita;
function adw_clamp_layout_new:PGtkLayoutManager;cdecl;external libadwaita;
function adw_clamp_layout_get_maximum_size(self:PAdwClampLayout):longint;cdecl;external libadwaita;
procedure adw_clamp_layout_set_maximum_size(self:PAdwClampLayout; maximum_size:longint);cdecl;external libadwaita;
function adw_clamp_layout_get_tightening_threshold(self:PAdwClampLayout):longint;cdecl;external libadwaita;
procedure adw_clamp_layout_set_tightening_threshold(self:PAdwClampLayout; tightening_threshold:longint);cdecl;external libadwaita;
function adw_clamp_layout_get_unit(self:PAdwClampLayout):TAdwLengthUnit;cdecl;external libadwaita;
procedure adw_clamp_layout_set_unit(self:PAdwClampLayout; unit_:TAdwLengthUnit);cdecl;external libadwaita;

// === Konventiert am: 10-1-25 14:40:00 ===

function ADW_TYPE_CLAMP_LAYOUT: TGType;
function ADW_CLAMP_LAYOUT(obj: Pointer): PAdwClampLayout;
function ADW_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_CLAMP_LAYOUT: TGType;
begin
  Result := adw_clamp_layout_get_type;
end;

function ADW_CLAMP_LAYOUT(obj: Pointer): PAdwClampLayout;
begin
  Result := PAdwClampLayout(g_type_check_instance_cast(obj, ADW_TYPE_CLAMP_LAYOUT));
end;

function ADW_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CLAMP_LAYOUT);
end;


{$ENDIF read_implementation}
