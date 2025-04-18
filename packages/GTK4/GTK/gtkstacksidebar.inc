
{$IFDEF read_interface}



type
  TGtkStackSidebar = record // _GtkStackSidebar
  end;
  PGtkStackSidebar = ^TGtkStackSidebar;

function gtk_stack_sidebar_get_type: TGType; cdecl; external libgtk4;
function gtk_stack_sidebar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_stack_sidebar_set_stack(self: PGtkStackSidebar; stack: PGtkStack); cdecl; external libgtk4;
function gtk_stack_sidebar_get_stack(self: PGtkStackSidebar): PGtkStack; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 16:33:34 ===

function GTK_TYPE_STACK_SIDEBAR: TGType;
function GTK_STACK_SIDEBAR(obj: Pointer): PGtkStackSidebar;
function GTK_IS_STACK_SIDEBAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_STACK_SIDEBAR: TGType;
begin
  GTK_TYPE_STACK_SIDEBAR := gtk_stack_sidebar_get_type;
end;

function GTK_STACK_SIDEBAR(obj: Pointer): PGtkStackSidebar;
begin
  Result := PGtkStackSidebar(g_type_check_instance_cast(obj, GTK_TYPE_STACK_SIDEBAR));
end;

function GTK_IS_STACK_SIDEBAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STACK_SIDEBAR);
end;



{$ENDIF read_implementation}
