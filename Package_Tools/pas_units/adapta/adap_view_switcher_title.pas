unit adap_view_switcher_title;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_view_stack;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TAdapViewSwitcherTitle = record
  end;
  PAdapViewSwitcherTitle = ^TAdapViewSwitcherTitle;

  TAdapViewSwitcherTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewSwitcherTitleClass = ^TAdapViewSwitcherTitleClass;

function adap_view_switcher_title_get_type: TGType; cdecl; external libadapta; deprecated;
function adap_view_switcher_title_new: PGtkWidget; cdecl; external libadapta; deprecated;
function adap_view_switcher_title_get_stack(self: PAdapViewSwitcherTitle): PAdapViewStack; cdecl; external libadapta; deprecated;
procedure adap_view_switcher_title_set_stack(self: PAdapViewSwitcherTitle; stack: PAdapViewStack); cdecl; external libadapta; deprecated;
function adap_view_switcher_title_get_title(self: PAdapViewSwitcherTitle): pchar; cdecl; external libadapta; deprecated;
procedure adap_view_switcher_title_set_title(self: PAdapViewSwitcherTitle; title: pchar); cdecl; external libadapta; deprecated;
function adap_view_switcher_title_get_subtitle(self: PAdapViewSwitcherTitle): pchar; cdecl; external libadapta; deprecated;
procedure adap_view_switcher_title_set_subtitle(self: PAdapViewSwitcherTitle; subtitle: pchar); cdecl; external libadapta; deprecated;
function adap_view_switcher_title_get_view_switcher_enabled(self: PAdapViewSwitcherTitle): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_view_switcher_title_set_view_switcher_enabled(self: PAdapViewSwitcherTitle; enabled: Tgboolean); cdecl; external libadapta; deprecated;
function adap_view_switcher_title_get_title_visible(self: PAdapViewSwitcherTitle): Tgboolean; cdecl; external libadapta; deprecated;

// === Konventiert am: 4-12-25 17:27:23 ===

function ADAP_TYPE_VIEW_SWITCHER_TITLE: TGType;
function ADAP_VIEW_SWITCHER_TITLE(obj: Pointer): PAdapViewSwitcherTitle;
function ADAP_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_VIEW_SWITCHER_TITLE: TGType;
begin
  Result := adap_view_switcher_title_get_type;
end;

function ADAP_VIEW_SWITCHER_TITLE(obj: Pointer): PAdapViewSwitcherTitle;
begin
  Result := PAdapViewSwitcherTitle(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_SWITCHER_TITLE));
end;

function ADAP_IS_VIEW_SWITCHER_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_SWITCHER_TITLE);
end;


end.
