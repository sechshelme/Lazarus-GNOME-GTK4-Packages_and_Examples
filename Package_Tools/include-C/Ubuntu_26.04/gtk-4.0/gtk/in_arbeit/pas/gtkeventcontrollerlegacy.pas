unit gtkeventcontrollerlegacy;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkeventcontroller;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkEventControllerLegacy = type Pointer;
  PGtkEventControllerLegacyClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_event_controller_legacy_get_type: TGType; cdecl; external libgtk4;
function gtk_event_controller_legacy_new: PGtkEventController; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:07:45 ===

function GTK_TYPE_EVENT_CONTROLLER_LEGACY: TGType;
function GTK_EVENT_CONTROLLER_LEGACY(obj: Pointer): PGtkEventControllerLegacy;
function GTK_EVENT_CONTROLLER_LEGACY_CLASS(klass: Pointer): PGtkEventControllerLegacyClass;
function GTK_IS_EVENT_CONTROLLER_LEGACY(obj: Pointer): Tgboolean;
function GTK_IS_EVENT_CONTROLLER_LEGACY_CLASS(klass: Pointer): Tgboolean;
function GTK_EVENT_CONTROLLER_LEGACY_GET_CLASS(obj: Pointer): PGtkEventControllerLegacyClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_EVENT_CONTROLLER_LEGACY: TGType;
begin
  GTK_TYPE_EVENT_CONTROLLER_LEGACY := gtk_event_controller_legacy_get_type;
end;

function GTK_EVENT_CONTROLLER_LEGACY(obj: Pointer): PGtkEventControllerLegacy;
begin
  Result := PGtkEventControllerLegacy(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_LEGACY));
end;

function GTK_EVENT_CONTROLLER_LEGACY_CLASS(klass: Pointer): PGtkEventControllerLegacyClass;
begin
  Result := PGtkEventControllerLegacyClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_LEGACY));
end;

function GTK_IS_EVENT_CONTROLLER_LEGACY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVENT_CONTROLLER_LEGACY);
end;

function GTK_IS_EVENT_CONTROLLER_LEGACY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVENT_CONTROLLER_LEGACY);
end;

function GTK_EVENT_CONTROLLER_LEGACY_GET_CLASS(obj: Pointer): PGtkEventControllerLegacyClass;
begin
  Result := PGtkEventControllerLegacyClass(PGTypeInstance(obj)^.g_class);
end;



end.
