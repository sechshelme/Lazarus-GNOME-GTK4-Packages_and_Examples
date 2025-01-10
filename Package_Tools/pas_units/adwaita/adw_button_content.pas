unit adw_button_content;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwButtonContent, adw_button_content, ADW, BUTTON_CONTENT, GtkWidget) }
type
  TAdwButtonContent = record
  end;
  PAdwButtonContent = ^TAdwButtonContent;

  TAdwButtonContentClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwButtonContentClass = ^TAdwButtonContentClass;

function adw_button_content_get_type: TGType; cdecl; external libadwaita;
function adw_button_content_new: PGtkWidget; cdecl; external libadwaita;
function adw_button_content_get_label(self: PAdwButtonContent): pchar; cdecl; external libadwaita;
procedure adw_button_content_set_label(self: PAdwButtonContent; _label: pchar); cdecl; external libadwaita;
function adw_button_content_get_icon_name(self: PAdwButtonContent): pchar; cdecl; external libadwaita;
procedure adw_button_content_set_icon_name(self: PAdwButtonContent; icon_name: pchar); cdecl; external libadwaita;
function adw_button_content_get_use_underline(self: PAdwButtonContent): Tgboolean; cdecl; external libadwaita;
procedure adw_button_content_set_use_underline(self: PAdwButtonContent; use_underline: Tgboolean); cdecl; external libadwaita;
function adw_button_content_get_can_shrink(self: PAdwButtonContent): Tgboolean; cdecl; external libadwaita;
procedure adw_button_content_set_can_shrink(self: PAdwButtonContent; can_shrink: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:39:54 ===

function ADW_TYPE_BUTTON_CONTENT: TGType;
function ADW_BUTTON_CONTENT(obj: Pointer): PAdwButtonContent;
function ADW_IS_BUTTON_CONTENT(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_BUTTON_CONTENT: TGType;
begin
  Result := adw_button_content_get_type;
end;

function ADW_BUTTON_CONTENT(obj: Pointer): PAdwButtonContent;
begin
  Result := PAdwButtonContent(g_type_check_instance_cast(obj, ADW_TYPE_BUTTON_CONTENT));
end;

function ADW_IS_BUTTON_CONTENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_BUTTON_CONTENT);
end;


end.
