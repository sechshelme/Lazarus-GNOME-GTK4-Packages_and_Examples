unit adw_combo_row;

interface

uses
  fp_glib2, fp_GTK4, adw_action_row;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (AdwComboRow, adw_combo_row, ADW, COMBO_ROW, AdwActionRow) }
type
  TAdwComboRowClass = record
    parent_class: TAdwActionRowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwComboRowClass = ^TAdwComboRowClass;

  TAdwComboRow = record
    parent_instance: TAdwActionRow;
  end;
  PAdwComboRow = ^TAdwComboRow;

function adw_combo_row_get_type: TGType; cdecl; external libadwaita;
function adw_combo_row_new: PGtkWidget; cdecl; external libadwaita;
function adw_combo_row_get_model(self: PAdwComboRow): PGListModel; cdecl; external libadwaita;
procedure adw_combo_row_set_model(self: PAdwComboRow; model: PGListModel); cdecl; external libadwaita;
function adw_combo_row_get_selected(self: PAdwComboRow): Tguint; cdecl; external libadwaita;
procedure adw_combo_row_set_selected(self: PAdwComboRow; position: Tguint); cdecl; external libadwaita;
function adw_combo_row_get_selected_item(self: PAdwComboRow): Tgpointer; cdecl; external libadwaita;
function adw_combo_row_get_factory(self: PAdwComboRow): PGtkListItemFactory; cdecl; external libadwaita;
procedure adw_combo_row_set_factory(self: PAdwComboRow; factory: PGtkListItemFactory); cdecl; external libadwaita;
function adw_combo_row_get_list_factory(self: PAdwComboRow): PGtkListItemFactory; cdecl; external libadwaita;
procedure adw_combo_row_set_list_factory(self: PAdwComboRow; factory: PGtkListItemFactory); cdecl; external libadwaita;
function adw_combo_row_get_expression(self: PAdwComboRow): PGtkExpression; cdecl; external libadwaita;
procedure adw_combo_row_set_expression(self: PAdwComboRow; expression: PGtkExpression); cdecl; external libadwaita;
function adw_combo_row_get_use_subtitle(self: PAdwComboRow): Tgboolean; cdecl; external libadwaita;
procedure adw_combo_row_set_use_subtitle(self: PAdwComboRow; use_subtitle: Tgboolean); cdecl; external libadwaita;
function adw_combo_row_get_enable_search(self: PAdwComboRow): Tgboolean; cdecl; external libadwaita;
procedure adw_combo_row_set_enable_search(self: PAdwComboRow; enable_search: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:43:18 ===

function ADW_TYPE_COMBO_ROW: TGType;
function ADW_COMBO_ROW(obj: Pointer): PAdwComboRow;
function ADW_IS_COMBO_ROW(obj: Pointer): Tgboolean;
function ADW_COMBO_ROW_CLASS(klass: Pointer): PAdwComboRowClass;
function ADW_IS_COMBO_ROW_CLASS(klass: Pointer): Tgboolean;
function ADW_COMBO_ROW_GET_CLASS(obj: Pointer): PAdwComboRowClass;

implementation

function ADW_TYPE_COMBO_ROW: TGType;
begin
  Result := adw_combo_row_get_type;
end;

function ADW_COMBO_ROW(obj: Pointer): PAdwComboRow;
begin
  Result := PAdwComboRow(g_type_check_instance_cast(obj, ADW_TYPE_COMBO_ROW));
end;

function ADW_IS_COMBO_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_COMBO_ROW);
end;

function ADW_COMBO_ROW_CLASS(klass: Pointer): PAdwComboRowClass;
begin
  Result := PAdwComboRowClass(g_type_check_class_cast(klass, ADW_TYPE_COMBO_ROW));
end;

function ADW_IS_COMBO_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_COMBO_ROW);
end;

function ADW_COMBO_ROW_GET_CLASS(obj: Pointer): PAdwComboRowClass;
begin
  Result := PAdwComboRowClass(PGTypeInstance(obj)^.g_class);
end;


end.
