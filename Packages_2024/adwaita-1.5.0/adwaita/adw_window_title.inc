{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwWindowTitle, adw_window_title, ADW, WINDOW_TITLE, GtkWidget) }
type
  TAdwWindowTitle = record
  end;
  PAdwWindowTitle = ^TAdwWindowTitle;

  TAdwWindowTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwWindowTitleClass = ^TAdwWindowTitleClass;

function adw_window_title_get_type: TGType; cdecl; external libadwaita;
function adw_window_title_new(title: pchar; subtitle: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_window_title_get_title(self: PAdwWindowTitle): pchar; cdecl; external libadwaita;
procedure adw_window_title_set_title(self: PAdwWindowTitle; title: pchar); cdecl; external libadwaita;
function adw_window_title_get_subtitle(self: PAdwWindowTitle): pchar; cdecl; external libadwaita;
procedure adw_window_title_set_subtitle(self: PAdwWindowTitle; subtitle: pchar); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:49:58 ===

function ADW_TYPE_WINDOW_TITLE: TGType;
function ADW_WINDOW_TITLE(obj: Pointer): PAdwWindowTitle;
function ADW_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_WINDOW_TITLE: TGType;
begin
  Result := adw_window_title_get_type;
end;

function ADW_WINDOW_TITLE(obj: Pointer): PAdwWindowTitle;
begin
  Result := PAdwWindowTitle(g_type_check_instance_cast(obj, ADW_TYPE_WINDOW_TITLE));
end;

function ADW_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_WINDOW_TITLE);
end;


{$ENDIF read_implementation}
