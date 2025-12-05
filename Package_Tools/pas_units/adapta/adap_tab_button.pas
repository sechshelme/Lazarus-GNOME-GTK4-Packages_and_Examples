unit adap_tab_button;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapTabButton = record
  end;
  PAdapTabButton = ^TAdapTabButton;

  TAdapTabButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapTabButtonClass = ^TAdapTabButtonClass;

function adap_tab_button_get_type: TGType; cdecl; external libadapta;
function adap_tab_button_new: PGtkWidget; cdecl; external libadapta;
function adap_tab_button_get_view(self: PAdapTabButton): PAdapTabView; cdecl; external libadapta;
procedure adap_tab_button_set_view(self: PAdapTabButton; view: PAdapTabView); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:57 ===

function ADAP_TYPE_TAB_BUTTON: TGType;
function ADAP_TAB_BUTTON(obj: Pointer): PAdapTabButton;
function ADAP_IS_TAB_BUTTON(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TAB_BUTTON: TGType;
begin
  Result := adap_tab_button_get_type;
end;

function ADAP_TAB_BUTTON(obj: Pointer): PAdapTabButton;
begin
  Result := PAdapTabButton(g_type_check_instance_cast(obj, ADAP_TYPE_TAB_BUTTON));
end;

function ADAP_IS_TAB_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TAB_BUTTON);
end;


end.
