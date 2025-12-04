unit adap_application;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_style_manager;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TAdapApplicationClass = record
    parent_class: TGtkApplicationClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapApplicationClass = ^TAdapApplicationClass;

  TAdapApplication = record
    parent_instance: TGtkApplication;
  end;
  PAdapApplication = ^TAdapApplication;

function adap_application_get_type: TGType; cdecl; external libadapta;
function adap_application_new(application_id: pchar; flags: TGApplicationFlags): PAdapApplication; cdecl; external libadapta;
function adap_application_get_style_manager(self: PAdapApplication): PAdapStyleManager; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:00:53 ===

function ADAP_TYPE_APPLICATION: TGType;
function ADAP_APPLICATION(obj: Pointer): PAdapApplication;
function ADAP_IS_APPLICATION(obj: Pointer): Tgboolean;
function ADAP_APPLICATION_CLASS(klass: Pointer): PAdapApplicationClass;
function ADAP_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
function ADAP_APPLICATION_GET_CLASS(obj: Pointer): PAdapApplicationClass;

implementation

function ADAP_TYPE_APPLICATION: TGType;
begin
  Result := adap_application_get_type;
end;

function ADAP_APPLICATION(obj: Pointer): PAdapApplication;
begin
  Result := PAdapApplication(g_type_check_instance_cast(obj, ADAP_TYPE_APPLICATION));
end;

function ADAP_IS_APPLICATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_APPLICATION);
end;

function ADAP_APPLICATION_CLASS(klass: Pointer): PAdapApplicationClass;
begin
  Result := PAdapApplicationClass(g_type_check_class_cast(klass, ADAP_TYPE_APPLICATION));
end;

function ADAP_IS_APPLICATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_APPLICATION);
end;

function ADAP_APPLICATION_GET_CLASS(obj: Pointer): PAdapApplicationClass;
begin
  Result := PAdapApplicationClass(PGTypeInstance(obj)^.g_class);
end;


end.
