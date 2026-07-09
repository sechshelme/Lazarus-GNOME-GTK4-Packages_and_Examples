

{$IFDEF read_struct}
type
  PGtkStackSwitcher = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_stack_switcher_get_type: TGType; cdecl; external libgtk4;
function gtk_stack_switcher_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_stack_switcher_set_stack(switcher: PGtkStackSwitcher; stack: PGtkStack); cdecl; external libgtk4;
function gtk_stack_switcher_get_stack(switcher: PGtkStackSwitcher): PGtkStack; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:02 ===

function GTK_TYPE_STACK_SWITCHER: TGType;
function GTK_STACK_SWITCHER(obj: Pointer): PGtkStackSwitcher;
function GTK_IS_STACK_SWITCHER(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_STACK_SWITCHER: TGType;
begin
  GTK_TYPE_STACK_SWITCHER := gtk_stack_switcher_get_type;
end;

function GTK_STACK_SWITCHER(obj: Pointer): PGtkStackSwitcher;
begin
  Result := PGtkStackSwitcher(g_type_check_instance_cast(obj, GTK_TYPE_STACK_SWITCHER));
end;

function GTK_IS_STACK_SWITCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STACK_SWITCHER);
end;



{$ENDIF read_implementation}
