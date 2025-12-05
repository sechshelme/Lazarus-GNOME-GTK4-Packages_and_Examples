unit adap_clamp;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_length_unit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapClamp = record
  end;
  PAdapClamp = ^TAdapClamp;

  TAdapClampClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapClampClass = ^TAdapClampClass;

function adap_clamp_get_type: TGType; cdecl; external libadapta;
function adap_clamp_new: PGtkWidget; cdecl; external libadapta;
function adap_clamp_get_child(self: PAdapClamp): PGtkWidget; cdecl; external libadapta;
procedure adap_clamp_set_child(self: PAdapClamp; child: PGtkWidget); cdecl; external libadapta;
function adap_clamp_get_maximum_size(self: PAdapClamp): longint; cdecl; external libadapta;
procedure adap_clamp_set_maximum_size(self: PAdapClamp; maximum_size: longint); cdecl; external libadapta;
function adap_clamp_get_tightening_threshold(self: PAdapClamp): longint; cdecl; external libadapta;
procedure adap_clamp_set_tightening_threshold(self: PAdapClamp; tightening_threshold: longint); cdecl; external libadapta;
function adap_clamp_get_unit(self: PAdapClamp): TAdapLengthUnit; cdecl; external libadapta;
procedure adap_clamp_set_unit(self: PAdapClamp; unit_: TAdapLengthUnit); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:37 ===

function ADAP_TYPE_CLAMP: TGType;
function ADAP_CLAMP(obj: Pointer): PAdapClamp;
function ADAP_IS_CLAMP(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CLAMP: TGType;
begin
  Result := adap_clamp_get_type;
end;

function ADAP_CLAMP(obj: Pointer): PAdapClamp;
begin
  Result := PAdapClamp(g_type_check_instance_cast(obj, ADAP_TYPE_CLAMP));
end;

function ADAP_IS_CLAMP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CLAMP);
end;


end.
