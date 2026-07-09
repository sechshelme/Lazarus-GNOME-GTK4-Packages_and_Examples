

  {$IFDEF read_struct}
type
  PGtkEditableLabel = type Pointer;

  TGtkEditableLabelClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkEditableLabelClass = ^TGtkEditableLabelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_editable_label_get_type: TGType; cdecl; external libgtk4;
function gtk_editable_label_new(str: pchar): PGtkWidget; cdecl; external libgtk4;
function gtk_editable_label_get_editing(self: PGtkEditableLabel): Tgboolean; cdecl; external libgtk4;
procedure gtk_editable_label_start_editing(self: PGtkEditableLabel); cdecl; external libgtk4;
procedure gtk_editable_label_stop_editing(self: PGtkEditableLabel; commit: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:34 ===

function GTK_TYPE_EDITABLE_LABEL: TGType;
function GTK_EDITABLE_LABEL(obj: Pointer): PGtkEditableLabel;
function GTK_IS_EDITABLE_LABEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_EDITABLE_LABEL: TGType;
begin
  Result := gtk_editable_label_get_type;
end;

function GTK_EDITABLE_LABEL(obj: Pointer): PGtkEditableLabel;
begin
  Result := PGtkEditableLabel(g_type_check_instance_cast(obj, GTK_TYPE_EDITABLE_LABEL));
end;

function GTK_IS_EDITABLE_LABEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EDITABLE_LABEL);
end;

{$ENDIF read_implementation}
