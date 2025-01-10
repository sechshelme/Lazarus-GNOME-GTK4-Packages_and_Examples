{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwStatusPage, adw_status_page, ADW, STATUS_PAGE, GtkWidget) }
type
  TAdwStatusPage = record
  end;
  PAdwStatusPage = ^TAdwStatusPage;

  TAdwStatusPageClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwStatusPageClass = ^TAdwStatusPageClass;

function adw_status_page_get_type: TGType; cdecl; external libadwaita;
function adw_status_page_new: PGtkWidget; cdecl; external libadwaita;
function adw_status_page_get_icon_name(self: PAdwStatusPage): pchar; cdecl; external libadwaita;
procedure adw_status_page_set_icon_name(self: PAdwStatusPage; icon_name: pchar); cdecl; external libadwaita;
function adw_status_page_get_paintable(self: PAdwStatusPage): PGdkPaintable; cdecl; external libadwaita;
procedure adw_status_page_set_paintable(self: PAdwStatusPage; paintable: PGdkPaintable); cdecl; external libadwaita;
function adw_status_page_get_title(self: PAdwStatusPage): pchar; cdecl; external libadwaita;
procedure adw_status_page_set_title(self: PAdwStatusPage; title: pchar); cdecl; external libadwaita;
function adw_status_page_get_description(self: PAdwStatusPage): pchar; cdecl; external libadwaita;
procedure adw_status_page_set_description(self: PAdwStatusPage; description: pchar); cdecl; external libadwaita;
function adw_status_page_get_child(self: PAdwStatusPage): PGtkWidget; cdecl; external libadwaita;
procedure adw_status_page_set_child(self: PAdwStatusPage; child: PGtkWidget); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:55:29 ===

function ADW_TYPE_STATUS_PAGE: TGType;
function ADW_STATUS_PAGE(obj: Pointer): PAdwStatusPage;
function ADW_IS_STATUS_PAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_STATUS_PAGE: TGType;
begin
  Result := adw_status_page_get_type;
end;

function ADW_STATUS_PAGE(obj: Pointer): PAdwStatusPage;
begin
  Result := PAdwStatusPage(g_type_check_instance_cast(obj, ADW_TYPE_STATUS_PAGE));
end;

function ADW_IS_STATUS_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_STATUS_PAGE);
end;


{$ENDIF read_implementation}
