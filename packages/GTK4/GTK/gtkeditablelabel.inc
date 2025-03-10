
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkEditableLabel, gtk_editable_label, GTK, EDITABLE_LABEL, GtkWidget) }
type
  TGtkEditableLabel = record
  end;
  PGtkEditableLabel = ^TGtkEditableLabel;

  TGtkEditableLabelClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkEditableLabelClass = ^TGtkEditableLabelClass;

function gtk_editable_label_get_type: TGType; cdecl; external libgtk4;
function gtk_editable_label_new(str: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_editable_label_get_editing(self: PGtkEditableLabel): Tgboolean; cdecl; external libgtk4;
procedure gtk_editable_label_start_editing(self: PGtkEditableLabel); cdecl; external libgtk4;
procedure gtk_editable_label_stop_editing(self: PGtkEditableLabel; commit: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 24-7-24 19:55:13 ===

function GTK_TYPE_EDITABLE_LABEL: TGType;
function GTK_EDITABLE_LABEL(obj: Pointer): PGtkEditableLabel;
function GTK_IS_EDITABLE_LABEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


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
