

  {$IFDEF read_struct}
type
  PGtkShortcutActionClass = type Pointer;

  PGtkNothingAction = type Pointer;
  PGtkNothingActionClass = type Pointer;

  PGtkCallbackAction = type Pointer;
  PGtkCallbackActionClass = type Pointer;

  PGtkMnemonicAction = type Pointer;
  PGtkMnemonicActionClass = type Pointer;

  PGtkActivateAction = type Pointer;
  PGtkActivateActionClass = type Pointer;

  PGtkSignalAction = type Pointer;
  PGtkSignalActionClass = type Pointer;

  PGtkNamedAction = type Pointer;
  PGtkNamedActionClass = type Pointer;

  TGtkShortcutFunc = function(widget: PGtkWidget; args: PGVariant; user_data: Tgpointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGtkShortcutActionFlags = ^TGtkShortcutActionFlags;
  TGtkShortcutActionFlags = longint;
const
  GTK_SHORTCUT_ACTION_EXCLUSIVE = 1 shl 0;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_shortcut_action_get_type: TGType; cdecl; external libgtk4;
function gtk_shortcut_action_to_string(self: PGtkShortcutAction): pchar; cdecl; external libgtk4;
function gtk_shortcut_action_parse_string(_string: pchar): PGtkShortcutAction; cdecl; external libgtk4;
procedure gtk_shortcut_action_print(self: PGtkShortcutAction; _string: PGString); cdecl; external libgtk4;
function gtk_shortcut_action_activate(self: PGtkShortcutAction; flags: TGtkShortcutActionFlags; widget: PGtkWidget; args: PGVariant): Tgboolean; cdecl; external libgtk4;

function gtk_nothing_action_get_type: TGType; cdecl; external libgtk4;
function gtk_nothing_action_get: PGtkShortcutAction; cdecl; external libgtk4;

function gtk_callback_action_get_type: TGType; cdecl; external libgtk4;
function gtk_callback_action_new(callback: TGtkShortcutFunc; data: Tgpointer; destroy: TGDestroyNotify): PGtkShortcutAction; cdecl; external libgtk4;

function gtk_mnemonic_action_get_type: TGType; cdecl; external libgtk4;
function gtk_mnemonic_action_get: PGtkShortcutAction; cdecl; external libgtk4;

function gtk_activate_action_get_type: TGType; cdecl; external libgtk4;
function gtk_activate_action_get: PGtkShortcutAction; cdecl; external libgtk4;

function gtk_signal_action_get_type: TGType; cdecl; external libgtk4;
function gtk_signal_action_new(signal_name: pchar): PGtkShortcutAction; cdecl; external libgtk4;
function gtk_signal_action_get_signal_name(self: PGtkSignalAction): pchar; cdecl; external libgtk4;

function gtk_named_action_get_type: TGType; cdecl; external libgtk4;
function gtk_named_action_new(name: pchar): PGtkShortcutAction; cdecl; external libgtk4;
function gtk_named_action_get_action_name(self: PGtkNamedAction): pchar; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:19 ===

function GTK_TYPE_SHORTCUT_ACTION: TGType;
function GTK_SHORTCUT_ACTION(obj: Pointer): PGtkShortcutAction;
function GTK_IS_SHORTCUT_ACTION(obj: Pointer): Tgboolean;
function GTK_SHORTCUT_ACTION_CLASS(klass: Pointer): PGtkShortcutActionClass;
function GTK_IS_SHORTCUT_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_SHORTCUT_ACTION_GET_CLASS(obj: Pointer): PGtkShortcutActionClass;

function GTK_TYPE_NOTHING_ACTION: TGType;
function GTK_NOTHING_ACTION(obj: Pointer): PGtkNothingAction;
function GTK_IS_NOTHING_ACTION(obj: Pointer): Tgboolean;
function GTK_NOTHING_ACTION_CLASS(klass: Pointer): PGtkNothingActionClass;
function GTK_IS_NOTHING_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_NOTHING_ACTION_GET_CLASS(obj: Pointer): PGtkNothingActionClass;

function GTK_TYPE_CALLBACK_ACTION: TGType;
function GTK_CALLBACK_ACTION(obj: Pointer): PGtkCallbackAction;
function GTK_IS_CALLBACK_ACTION(obj: Pointer): Tgboolean;
function GTK_CALLBACK_ACTION_CLASS(klass: Pointer): PGtkCallbackActionClass;
function GTK_IS_CALLBACK_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_CALLBACK_ACTION_GET_CLASS(obj: Pointer): PGtkCallbackActionClass;

function GTK_TYPE_MNEMONIC_ACTION: TGType;
function GTK_MNEMONIC_ACTION(obj: Pointer): PGtkMnemonicAction;
function GTK_IS_MNEMONIC_ACTION(obj: Pointer): Tgboolean;
function GTK_MNEMONIC_ACTION_CLASS(klass: Pointer): PGtkMnemonicActionClass;
function GTK_IS_MNEMONIC_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_MNEMONIC_ACTION_GET_CLASS(obj: Pointer): PGtkMnemonicActionClass;

function GTK_TYPE_ACTIVATE_ACTION: TGType;
function GTK_ACTIVATE_ACTION(obj: Pointer): PGtkActivateAction;
function GTK_IS_ACTIVATE_ACTION(obj: Pointer): Tgboolean;
function GTK_ACTIVATE_ACTION_CLASS(klass: Pointer): PGtkActivateActionClass;
function GTK_IS_ACTIVATE_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_ACTIVATE_ACTION_GET_CLASS(obj: Pointer): PGtkActivateActionClass;

function GTK_TYPE_SIGNAL_ACTION: TGType;
function GTK_SIGNAL_ACTION(obj: Pointer): PGtkSignalAction;
function GTK_IS_SIGNAL_ACTION(obj: Pointer): Tgboolean;
function GTK_SIGNAL_ACTION_CLASS(klass: Pointer): PGtkSignalActionClass;
function GTK_IS_SIGNAL_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_SIGNAL_ACTION_GET_CLASS(obj: Pointer): PGtkSignalActionClass;

function GTK_TYPE_NAMED_ACTION: TGType;
function GTK_NAMED_ACTION(obj: Pointer): PGtkNamedAction;
function GTK_IS_NAMED_ACTION(obj: Pointer): Tgboolean;
function GTK_NAMED_ACTION_CLASS(klass: Pointer): PGtkNamedActionClass;
function GTK_IS_NAMED_ACTION_CLASS(klass: Pointer): Tgboolean;
function GTK_NAMED_ACTION_GET_CLASS(obj: Pointer): PGtkNamedActionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SHORTCUT_ACTION: TGType;
begin
  Result := gtk_shortcut_action_get_type;
end;

function GTK_SHORTCUT_ACTION(obj: Pointer): PGtkShortcutAction;
begin
  Result := PGtkShortcutAction(g_type_check_instance_cast(obj, GTK_TYPE_SHORTCUT_ACTION));
end;

function GTK_IS_SHORTCUT_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SHORTCUT_ACTION);
end;

function GTK_SHORTCUT_ACTION_CLASS(klass: Pointer): PGtkShortcutActionClass;
begin
  Result := PGtkShortcutActionClass(g_type_check_class_cast(klass, GTK_TYPE_SHORTCUT_ACTION));
end;

function GTK_IS_SHORTCUT_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SHORTCUT_ACTION);
end;

function GTK_SHORTCUT_ACTION_GET_CLASS(obj: Pointer): PGtkShortcutActionClass;
begin
  Result := PGtkShortcutActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_NOTHING_ACTION: TGType;
begin
  Result := gtk_nothing_action_get_type;
end;

function GTK_NOTHING_ACTION(obj: Pointer): PGtkNothingAction;
begin
  Result := PGtkNothingAction(g_type_check_instance_cast(obj, GTK_TYPE_NOTHING_ACTION));
end;

function GTK_IS_NOTHING_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NOTHING_ACTION);
end;

function GTK_NOTHING_ACTION_CLASS(klass: Pointer): PGtkNothingActionClass;
begin
  Result := PGtkNothingActionClass(g_type_check_class_cast(klass, GTK_TYPE_NOTHING_ACTION));
end;

function GTK_IS_NOTHING_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_NOTHING_ACTION);
end;

function GTK_NOTHING_ACTION_GET_CLASS(obj: Pointer): PGtkNothingActionClass;
begin
  Result := PGtkNothingActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_CALLBACK_ACTION: TGType;
begin
  Result := gtk_callback_action_get_type;
end;

function GTK_CALLBACK_ACTION(obj: Pointer): PGtkCallbackAction;
begin
  Result := PGtkCallbackAction(g_type_check_instance_cast(obj, GTK_TYPE_CALLBACK_ACTION));
end;

function GTK_IS_CALLBACK_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CALLBACK_ACTION);
end;

function GTK_CALLBACK_ACTION_CLASS(klass: Pointer): PGtkCallbackActionClass;
begin
  Result := PGtkCallbackActionClass(g_type_check_class_cast(klass, GTK_TYPE_CALLBACK_ACTION));
end;

function GTK_IS_CALLBACK_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_CALLBACK_ACTION);
end;

function GTK_CALLBACK_ACTION_GET_CLASS(obj: Pointer): PGtkCallbackActionClass;
begin
  Result := PGtkCallbackActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_MNEMONIC_ACTION: TGType;
begin
  Result := gtk_mnemonic_action_get_type;
end;

function GTK_MNEMONIC_ACTION(obj: Pointer): PGtkMnemonicAction;
begin
  Result := PGtkMnemonicAction(g_type_check_instance_cast(obj, GTK_TYPE_MNEMONIC_ACTION));
end;

function GTK_IS_MNEMONIC_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MNEMONIC_ACTION);
end;

function GTK_MNEMONIC_ACTION_CLASS(klass: Pointer): PGtkMnemonicActionClass;
begin
  Result := PGtkMnemonicActionClass(g_type_check_class_cast(klass, GTK_TYPE_MNEMONIC_ACTION));
end;

function GTK_IS_MNEMONIC_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MNEMONIC_ACTION);
end;

function GTK_MNEMONIC_ACTION_GET_CLASS(obj: Pointer): PGtkMnemonicActionClass;
begin
  Result := PGtkMnemonicActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_ACTIVATE_ACTION: TGType;
begin
  Result := gtk_activate_action_get_type;
end;

function GTK_ACTIVATE_ACTION(obj: Pointer): PGtkActivateAction;
begin
  Result := PGtkActivateAction(g_type_check_instance_cast(obj, GTK_TYPE_ACTIVATE_ACTION));
end;

function GTK_IS_ACTIVATE_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACTIVATE_ACTION);
end;

function GTK_ACTIVATE_ACTION_CLASS(klass: Pointer): PGtkActivateActionClass;
begin
  Result := PGtkActivateActionClass(g_type_check_class_cast(klass, GTK_TYPE_ACTIVATE_ACTION));
end;

function GTK_IS_ACTIVATE_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_ACTIVATE_ACTION);
end;

function GTK_ACTIVATE_ACTION_GET_CLASS(obj: Pointer): PGtkActivateActionClass;
begin
  Result := PGtkActivateActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_SIGNAL_ACTION: TGType;
begin
  Result := gtk_signal_action_get_type;
end;

function GTK_SIGNAL_ACTION(obj: Pointer): PGtkSignalAction;
begin
  Result := PGtkSignalAction(g_type_check_instance_cast(obj, GTK_TYPE_SIGNAL_ACTION));
end;

function GTK_IS_SIGNAL_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SIGNAL_ACTION);
end;

function GTK_SIGNAL_ACTION_CLASS(klass: Pointer): PGtkSignalActionClass;
begin
  Result := PGtkSignalActionClass(g_type_check_class_cast(klass, GTK_TYPE_SIGNAL_ACTION));
end;

function GTK_IS_SIGNAL_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SIGNAL_ACTION);
end;

function GTK_SIGNAL_ACTION_GET_CLASS(obj: Pointer): PGtkSignalActionClass;
begin
  Result := PGtkSignalActionClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_TYPE_NAMED_ACTION: TGType;
begin
  Result := gtk_named_action_get_type;
end;

function GTK_NAMED_ACTION(obj: Pointer): PGtkNamedAction;
begin
  Result := PGtkNamedAction(g_type_check_instance_cast(obj, GTK_TYPE_NAMED_ACTION));
end;

function GTK_IS_NAMED_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NAMED_ACTION);
end;

function GTK_NAMED_ACTION_CLASS(klass: Pointer): PGtkNamedActionClass;
begin
  Result := PGtkNamedActionClass(g_type_check_class_cast(klass, GTK_TYPE_NAMED_ACTION));
end;

function GTK_IS_NAMED_ACTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_NAMED_ACTION);
end;

function GTK_NAMED_ACTION_GET_CLASS(obj: Pointer): PGtkNamedActionClass;
begin
  Result := PGtkNamedActionClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
