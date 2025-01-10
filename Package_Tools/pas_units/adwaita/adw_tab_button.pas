unit adw_tab_button;

interface

uses
  fp_glib2, fp_GTK4, adw_tab_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_FINAL_TYPE (AdwTabButton, adw_tab_button, ADW, TAB_BUTTON, GtkWidget) }
type
  TAdwTabButton = record
  end;
  PAdwTabButton = ^TAdwTabButton;

  TAdwTabButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwTabButtonClass = ^TAdwTabButtonClass;

function adw_tab_button_get_type: TGType; cdecl; external libadwaita;
function adw_tab_button_new: PGtkWidget; cdecl; external libadwaita;
function adw_tab_button_get_view(self: PAdwTabButton): PAdwTabView; cdecl; external libadwaita;
procedure adw_tab_button_set_view(self: PAdwTabButton; view: PAdwTabView); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:01:33 ===

function ADW_TYPE_TAB_BUTTON: TGType;
function ADW_TAB_BUTTON(obj: Pointer): PAdwTabButton;
function ADW_IS_TAB_BUTTON(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_TAB_BUTTON: TGType;
begin
  Result := adw_tab_button_get_type;
end;

function ADW_TAB_BUTTON(obj: Pointer): PAdwTabButton;
begin
  Result := PAdwTabButton(g_type_check_instance_cast(obj, ADW_TYPE_TAB_BUTTON));
end;

function ADW_IS_TAB_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_TAB_BUTTON);
end;


end.
