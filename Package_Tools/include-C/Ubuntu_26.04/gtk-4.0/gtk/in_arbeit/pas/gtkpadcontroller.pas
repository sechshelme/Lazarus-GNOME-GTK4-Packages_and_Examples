unit gtkpadcontroller;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGtkPadActionType = ^TGtkPadActionType;
  TGtkPadActionType = longint;
const
  GTK_PAD_ACTION_BUTTON = 0;
  GTK_PAD_ACTION_RING = 1;
  GTK_PAD_ACTION_STRIP = 2;
  GTK_PAD_ACTION_DIAL = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkPadController = type Pointer;
  PGtkPadControllerClass = type Pointer;

  PGtkPadActionEntry = ^TGtkPadActionEntry;
  TGtkPadActionEntry = record
    _type: TGtkPadActionType;
    index: longint;
    mode: longint;
    _label: pchar;
    action_name: pchar;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_pad_controller_get_type: TGType; cdecl; external libgtk4;
function gtk_pad_controller_new(group: PGActionGroup; pad: PGdkDevice): PGtkPadController; cdecl; external libgtk4;
procedure gtk_pad_controller_set_action_entries(controller: PGtkPadController; entries: PGtkPadActionEntry; n_entries: longint); cdecl; external libgtk4;
procedure gtk_pad_controller_set_action(controller: PGtkPadController; _type: TGtkPadActionType; index: longint; mode: longint; _label: pchar;
  action_name: pchar); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:29:03 ===

function GTK_TYPE_PAD_CONTROLLER: TGType;
function GTK_PAD_CONTROLLER(obj: Pointer): PGtkPadController;
function GTK_PAD_CONTROLLER_CLASS(klass: Pointer): PGtkPadControllerClass;
function GTK_IS_PAD_CONTROLLER(obj: Pointer): Tgboolean;
function GTK_IS_PAD_CONTROLLER_CLASS(klass: Pointer): Tgboolean;
function GTK_PAD_CONTROLLER_GET_CLASS(obj: Pointer): PGtkPadControllerClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_PAD_CONTROLLER: TGType;
begin
  GTK_TYPE_PAD_CONTROLLER := gtk_pad_controller_get_type;
end;

function GTK_PAD_CONTROLLER(obj: Pointer): PGtkPadController;
begin
  Result := PGtkPadController(g_type_check_instance_cast(obj, GTK_TYPE_PAD_CONTROLLER));
end;

function GTK_PAD_CONTROLLER_CLASS(klass: Pointer): PGtkPadControllerClass;
begin
  Result := PGtkPadControllerClass(g_type_check_class_cast(klass, GTK_TYPE_PAD_CONTROLLER));
end;

function GTK_IS_PAD_CONTROLLER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PAD_CONTROLLER);
end;

function GTK_IS_PAD_CONTROLLER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_PAD_CONTROLLER);
end;

function GTK_PAD_CONTROLLER_GET_CLASS(obj: Pointer): PGtkPadControllerClass;
begin
  Result := PGtkPadControllerClass(PGTypeInstance(obj)^.g_class);
end;



end.
