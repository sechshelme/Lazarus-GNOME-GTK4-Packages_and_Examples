unit adw_application;

interface

uses
  fp_glib2, fp_GTK4, adw_style_manager;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (AdwApplication, adw_application, ADW, APPLICATION, GtkApplication) }
type
  TAdwApplicationClass = record
    parent_class: TGtkApplicationClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwApplicationClass = ^TAdwApplicationClass;

  TAdwApplication = record
    parent_instance: TGtkApplication;
  end;
  PAdwApplication = ^TAdwApplication;

function adw_application_get_type: TGType; cdecl; external libadwaita;
function adw_application_new(application_id: pchar; flags: TGApplicationFlags): PAdwApplication; cdecl; external libadwaita;
function adw_application_get_style_manager(self: PAdwApplication): PAdwStyleManager; cdecl; external libadwaita;

// === Konventiert am: 8-1-25 19:35:15 ===

function ADW_TYPE_APPLICATION: TGType;
function ADW_APPLICATION(obj: Pointer): PAdwApplication;
function ADW_IS_APPLICATION(obj: Pointer): Tgboolean;
function ADW_APPLICATION_CLASS(klass: Pointer): PAdwApplicationClass;
function ADW_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
function ADW_APPLICATION_GET_CLASS(obj: Pointer): PAdwApplicationClass;

implementation

function ADW_TYPE_APPLICATION: TGType;
begin
  Result := adw_application_get_type;
end;

function ADW_APPLICATION(obj: Pointer): PAdwApplication;
begin
  Result := PAdwApplication(g_type_check_instance_cast(obj, ADW_TYPE_APPLICATION));
end;

function ADW_IS_APPLICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_APPLICATION);
end;

function ADW_APPLICATION_CLASS(klass: Pointer): PAdwApplicationClass;
begin
  Result := PAdwApplicationClass(g_type_check_class_cast(klass, ADW_TYPE_APPLICATION));
end;

function ADW_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_APPLICATION);
end;

function ADW_APPLICATION_GET_CLASS(obj: Pointer): PAdwApplicationClass;
begin
  Result := PAdwApplicationClass(PGTypeInstance(obj)^.g_class);
end;


end.
