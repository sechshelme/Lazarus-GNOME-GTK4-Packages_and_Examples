
  {$IFDEF read_struct}
type
  PGtkShortcutTriggerClass = type Pointer;

  PGtkKeyvalTrigger = type Pointer;
  PGtkKeyvalTriggerClass = type Pointer;

  PGtkMnemonicTrigger = type Pointer;
  PGtkMnemonicTriggerClass = type Pointer;

  PGtkAlternativeTrigger = type Pointer;
  PGtkAlternativeTriggerClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_shortcut_trigger_get_type: TGType; cdecl; external libgtk4;
function gtk_shortcut_trigger_parse_string(_string: pchar): PGtkShortcutTrigger; cdecl; external libgtk4;
function gtk_shortcut_trigger_to_string(self: PGtkShortcutTrigger): pchar; cdecl; external libgtk4;
procedure gtk_shortcut_trigger_print(self: PGtkShortcutTrigger; _string: PGString); cdecl; external libgtk4;
function gtk_shortcut_trigger_to_label(self: PGtkShortcutTrigger; display: PGdkDisplay): pchar; cdecl; external libgtk4;
function gtk_shortcut_trigger_print_label(self: PGtkShortcutTrigger; display: PGdkDisplay; _string: PGString): Tgboolean; cdecl; external libgtk4;
function gtk_shortcut_trigger_hash(trigger: Tgconstpointer): Tguint; cdecl; external libgtk4;
function gtk_shortcut_trigger_equal(trigger1: Tgconstpointer; trigger2: Tgconstpointer): Tgboolean; cdecl; external libgtk4;
function gtk_shortcut_trigger_compare(trigger1: Tgconstpointer; trigger2: Tgconstpointer): longint; cdecl; external libgtk4;
function gtk_shortcut_trigger_trigger(self: PGtkShortcutTrigger; event: PGdkEvent; enable_mnemonics: Tgboolean): TGdkKeyMatch; cdecl; external libgtk4;

function gtk_never_trigger_get: PGtkShortcutTrigger; cdecl; external libgtk4;

function gtk_keyval_trigger_get_type: TGType; cdecl; external libgtk4;
function gtk_keyval_trigger_new(keyval: Tguint; modifiers: TGdkModifierType): PGtkShortcutTrigger; cdecl; external libgtk4;
function gtk_keyval_trigger_get_modifiers(self: PGtkKeyvalTrigger): TGdkModifierType; cdecl; external libgtk4;
function gtk_keyval_trigger_get_keyval(self: PGtkKeyvalTrigger): Tguint; cdecl; external libgtk4;

function gtk_mnemonic_trigger_get_type: TGType; cdecl; external libgtk4;
function gtk_mnemonic_trigger_new(keyval: Tguint): PGtkShortcutTrigger; cdecl; external libgtk4;
function gtk_mnemonic_trigger_get_keyval(self: PGtkMnemonicTrigger): Tguint; cdecl; external libgtk4;

function gtk_alternative_trigger_get_type: TGType; cdecl; external libgtk4;
function gtk_alternative_trigger_new(first: PGtkShortcutTrigger; second: PGtkShortcutTrigger): PGtkShortcutTrigger; cdecl; external libgtk4;
function gtk_alternative_trigger_get_first(self: PGtkAlternativeTrigger): PGtkShortcutTrigger; cdecl; external libgtk4;
function gtk_alternative_trigger_get_second(self: PGtkAlternativeTrigger): PGtkShortcutTrigger; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:15 ===

function GTK_TYPE_SHORTCUT_TRIGGER: TGType;
function GTK_SHORTCUT_TRIGGER(obj: Pointer): PGtkShortcutTrigger;
function GTK_IS_SHORTCUT_TRIGGER(obj: Pointer): Tgboolean;
function GTK_SHORTCUT_TRIGGER_CLASS(klass: Pointer): PGtkShortcutTriggerClass;
function GTK_IS_SHORTCUT_TRIGGER_CLASS(klass: Pointer): Tgboolean;
function GTK_SHORTCUT_TRIGGER_GET_CLASS(obj: Pointer): PGtkShortcutTriggerClass;

function GTK_TYPE_KEYVAL_TRIGGER: TGType;
function GTK_KEYVAL_TRIGGER(obj: Pointer): PGtkKeyvalTrigger;
function GTK_IS_KEYVAL_TRIGGER(obj: Pointer): Tgboolean;
function GTK_KEYVAL_TRIGGER_CLASS(klass: Pointer): PGtkKeyvalTriggerClass;
function GTK_IS_KEYVAL_TRIGGER_CLASS(klass: Pointer): Tgboolean;
function GTK_KEYVAL_TRIGGER_GET_CLASS(obj: Pointer): PGtkKeyvalTriggerClass;

function GTK_TYPE_MNEMONIC_TRIGGER: TGType;
function GTK_MNEMONIC_TRIGGER(obj: Pointer): PGtkMnemonicTrigger;
function GTK_IS_MNEMONIC_TRIGGER(obj: Pointer): Tgboolean;
function GTK_MNEMONIC_TRIGGER_CLASS(klass: Pointer): PGtkMnemonicTriggerClass;
function GTK_IS_MNEMONIC_TRIGGER_CLASS(klass: Pointer): Tgboolean;
function GTK_MNEMONIC_TRIGGER_GET_CLASS(obj: Pointer): PGtkMnemonicTriggerClass;

function GTK_TYPE_ALTERNATIVE_TRIGGER: TGType;
function GTK_ALTERNATIVE_TRIGGER(obj: Pointer): PGtkAlternativeTrigger;
function GTK_IS_ALTERNATIVE_TRIGGER(obj: Pointer): Tgboolean;
function GTK_ALTERNATIVE_TRIGGER_CLASS(klass: Pointer): PGtkAlternativeTriggerClass;
function GTK_IS_ALTERNATIVE_TRIGGER_CLASS(klass: Pointer): Tgboolean;
function GTK_ALTERNATIVE_TRIGGER_GET_CLASS(obj: Pointer): PGtkAlternativeTriggerClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SHORTCUT_TRIGGER: TGType;
begin
  Result := gtk_shortcut_trigger_get_type;
end;

function GTK_SHORTCUT_TRIGGER(obj: Pointer): PGtkShortcutTrigger;
begin
  Result := PGtkShortcutTrigger(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_TRIGGER));
end;

function GTK_IS_SHORTCUT_TRIGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_TRIGGER);
end;

function GTK_SHORTCUT_TRIGGER_CLASS(klass: Pointer): PGtkShortcutTriggerClass;
begin
  Result := PGtkShortcutTriggerClass(g_type_check_class_cast(klass, GTK_TYPE_SHORTCUT_TRIGGER));
end;

function GTK_IS_SHORTCUT_TRIGGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SHORTCUT_TRIGGER);
end;

function GTK_SHORTCUT_TRIGGER_GET_CLASS(obj: Pointer): PGtkShortcutTriggerClass;
begin
  Result := PGtkShortcutTriggerClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_KEYVAL_TRIGGER: TGType;
begin
  Result := gtk_keyval_trigger_get_type;
end;

function GTK_KEYVAL_TRIGGER(obj: Pointer): PGtkKeyvalTrigger;
begin
  Result := PGtkKeyvalTrigger(g_type_check_instance_cast(obj, GTK_TYPE_KEYVAL_TRIGGER));
end;

function GTK_IS_KEYVAL_TRIGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_KEYVAL_TRIGGER);
end;

function GTK_KEYVAL_TRIGGER_CLASS(klass: Pointer): PGtkKeyvalTriggerClass;
begin
  Result := PGtkKeyvalTriggerClass(g_type_check_class_cast(klass, GTK_TYPE_KEYVAL_TRIGGER));
end;

function GTK_IS_KEYVAL_TRIGGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_KEYVAL_TRIGGER);
end;

function GTK_KEYVAL_TRIGGER_GET_CLASS(obj: Pointer): PGtkKeyvalTriggerClass;
begin
  Result := PGtkKeyvalTriggerClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_MNEMONIC_TRIGGER: TGType;
begin
  Result := gtk_mnemonic_trigger_get_type;
end;

function GTK_MNEMONIC_TRIGGER(obj: Pointer): PGtkMnemonicTrigger;
begin
  Result := PGtkMnemonicTrigger(g_type_check_instance_cast(obj, GTK_TYPE_MNEMONIC_TRIGGER));
end;

function GTK_IS_MNEMONIC_TRIGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MNEMONIC_TRIGGER);
end;

function GTK_MNEMONIC_TRIGGER_CLASS(klass: Pointer): PGtkMnemonicTriggerClass;
begin
  Result := PGtkMnemonicTriggerClass(g_type_check_class_cast(klass, GTK_TYPE_MNEMONIC_TRIGGER));
end;

function GTK_IS_MNEMONIC_TRIGGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MNEMONIC_TRIGGER);
end;

function GTK_MNEMONIC_TRIGGER_GET_CLASS(obj: Pointer): PGtkMnemonicTriggerClass;
begin
  Result := PGtkMnemonicTriggerClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_ALTERNATIVE_TRIGGER: TGType;
begin
  Result := gtk_alternative_trigger_get_type;
end;

function GTK_ALTERNATIVE_TRIGGER(obj: Pointer): PGtkAlternativeTrigger;
begin
  Result := PGtkAlternativeTrigger(g_type_check_instance_cast(obj, GTK_TYPE_ALTERNATIVE_TRIGGER));
end;

function GTK_IS_ALTERNATIVE_TRIGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ALTERNATIVE_TRIGGER);
end;

function GTK_ALTERNATIVE_TRIGGER_CLASS(klass: Pointer): PGtkAlternativeTriggerClass;
begin
  Result := PGtkAlternativeTriggerClass(g_type_check_class_cast(klass, GTK_TYPE_ALTERNATIVE_TRIGGER));
end;

function GTK_IS_ALTERNATIVE_TRIGGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_ALTERNATIVE_TRIGGER);
end;

function GTK_ALTERNATIVE_TRIGGER_GET_CLASS(obj: Pointer): PGtkAlternativeTriggerClass;
begin
  Result := PGtkAlternativeTriggerClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
