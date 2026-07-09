unit gtkstacksidebar;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget, gtkstack;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkStackSidebar = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_stack_sidebar_get_type: TGType; cdecl; external libgtk4;
function gtk_stack_sidebar_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_stack_sidebar_set_stack(self: PGtkStackSidebar; stack: PGtkStack); cdecl; external libgtk4;
function gtk_stack_sidebar_get_stack(self: PGtkStackSidebar): PGtkStack; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:06 ===

function GTK_TYPE_STACK_SIDEBAR: TGType;
function GTK_STACK_SIDEBAR(obj: Pointer): PGtkStackSidebar;
function GTK_IS_STACK_SIDEBAR(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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



end.
