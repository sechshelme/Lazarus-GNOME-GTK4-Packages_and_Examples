unit nm_object;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_OBJECT_PATH = 'path';
  NM_OBJECT_CLIENT = 'client';

type
  PNMObject = type Pointer;
  PNMObjectClass = type Pointer;

function nm_object_get_type: TGType; cdecl; external libnm;
function nm_object_get_path(obj: PNMObject): pchar; cdecl; external libnm;

type
  PNMClient = type Pointer;

function nm_object_get_client(obj: PNMObject): PNMClient; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:33:43 ===

function NM_TYPE_OBJECT: TGType;
function NM_OBJECT(obj: Pointer): PNMObject;
function NM_OBJECT_CLASS(klass: Pointer): PNMObjectClass;
function NM_IS_OBJECT(obj: Pointer): Tgboolean;
function NM_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function NM_OBJECT_GET_CLASS(obj: Pointer): PNMObjectClass;

implementation

function NM_TYPE_OBJECT: TGType;
begin
  NM_TYPE_OBJECT := nm_object_get_type;
end;

function NM_OBJECT(obj: Pointer): PNMObject;
begin
  Result := PNMObject(g_type_check_instance_cast(obj, NM_TYPE_OBJECT));
end;

function NM_OBJECT_CLASS(klass: Pointer): PNMObjectClass;
begin
  Result := PNMObjectClass(g_type_check_class_cast(klass, NM_TYPE_OBJECT));
end;

function NM_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_OBJECT);
end;

function NM_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_OBJECT);
end;

function NM_OBJECT_GET_CLASS(obj: Pointer): PNMObjectClass;
begin
  Result := PNMObjectClass(PGTypeInstance(obj)^.g_class);
end;



end.
