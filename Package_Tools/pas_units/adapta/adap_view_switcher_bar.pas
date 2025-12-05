unit adap_view_switcher_bar;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_view_stack;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapViewSwitcherBar = record
  end;
  PAdapViewSwitcherBar = ^TAdapViewSwitcherBar;

  TAdapViewSwitcherBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewSwitcherBarClass = ^TAdapViewSwitcherBarClass;

function adap_view_switcher_bar_get_type: TGType; cdecl; external libadapta;
function adap_view_switcher_bar_new: PGtkWidget; cdecl; external libadapta;
function adap_view_switcher_bar_get_stack(self: PAdapViewSwitcherBar): PAdapViewStack; cdecl; external libadapta;
procedure adap_view_switcher_bar_set_stack(self: PAdapViewSwitcherBar; stack: PAdapViewStack); cdecl; external libadapta;
function adap_view_switcher_bar_get_reveal(self: PAdapViewSwitcherBar): Tgboolean; cdecl; external libadapta;
procedure adap_view_switcher_bar_set_reveal(self: PAdapViewSwitcherBar; reveal: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:25 ===

function ADAP_TYPE_VIEW_SWITCHER_BAR: TGType;
function ADAP_VIEW_SWITCHER_BAR(obj: Pointer): PAdapViewSwitcherBar;
function ADAP_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_SWITCHER_BAR: TGType;
begin
  Result := adap_view_switcher_bar_get_type;
end;

function ADAP_VIEW_SWITCHER_BAR(obj: Pointer): PAdapViewSwitcherBar;
begin
  Result := PAdapViewSwitcherBar(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_SWITCHER_BAR));
end;

function ADAP_IS_VIEW_SWITCHER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_SWITCHER_BAR);
end;


end.
