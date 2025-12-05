unit adap_clamp_layout;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_length_unit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapClampLayout = record
  end;
  PAdapClampLayout = ^TAdapClampLayout;

  TAdapClampLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PAdapClampLayoutClass = ^TAdapClampLayoutClass;

function adap_clamp_layout_get_type: TGType; cdecl; external libadapta;
function adap_clamp_layout_new: PGtkLayoutManager; cdecl; external libadapta;
function adap_clamp_layout_get_maximum_size(self: PAdapClampLayout): longint; cdecl; external libadapta;
procedure adap_clamp_layout_set_maximum_size(self: PAdapClampLayout; maximum_size: longint); cdecl; external libadapta;
function adap_clamp_layout_get_tightening_threshold(self: PAdapClampLayout): longint; cdecl; external libadapta;
procedure adap_clamp_layout_set_tightening_threshold(self: PAdapClampLayout; tightening_threshold: longint); cdecl; external libadapta;
function adap_clamp_layout_get_unit(self: PAdapClampLayout): TAdapLengthUnit; cdecl; external libadapta;
procedure adap_clamp_layout_set_unit(self: PAdapClampLayout; unit_: TAdapLengthUnit); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:39 ===

function ADAP_TYPE_CLAMP_LAYOUT: TGType;
function ADAP_CLAMP_LAYOUT(obj: Pointer): PAdapClampLayout;
function ADAP_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CLAMP_LAYOUT: TGType;
begin
  Result := adap_clamp_layout_get_type;
end;

function ADAP_CLAMP_LAYOUT(obj: Pointer): PAdapClampLayout;
begin
  Result := PAdapClampLayout(g_type_check_instance_cast(obj, ADAP_TYPE_CLAMP_LAYOUT));
end;

function ADAP_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CLAMP_LAYOUT);
end;


end.
