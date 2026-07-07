unit gtkbuilder;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gtkenums, gtktypes, fp_gtk4, gtkbuilderscope;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
type
  PGtkBuilderError = ^TGtkBuilderError;
  TGtkBuilderError = longint;
const
  GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION = 0;
  GTK_BUILDER_ERROR_UNHANDLED_TAG = 1;
  GTK_BUILDER_ERROR_MISSING_ATTRIBUTE = 2;
  GTK_BUILDER_ERROR_INVALID_ATTRIBUTE = 3;
  GTK_BUILDER_ERROR_INVALID_TAG = 4;
  GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE = 5;
  GTK_BUILDER_ERROR_INVALID_VALUE = 6;
  GTK_BUILDER_ERROR_VERSION_MISMATCH = 7;
  GTK_BUILDER_ERROR_DUPLICATE_ID = 8;
  GTK_BUILDER_ERROR_OBJECT_TYPE_REFUSED = 9;
  GTK_BUILDER_ERROR_TEMPLATE_MISMATCH = 10;
  GTK_BUILDER_ERROR_INVALID_PROPERTY = 11;
  GTK_BUILDER_ERROR_INVALID_SIGNAL = 12;
  GTK_BUILDER_ERROR_INVALID_ID = 13;
  GTK_BUILDER_ERROR_INVALID_FUNCTION = 14;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkBuilderClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_builder_error_quark: TGQuark; cdecl; external libgtk4;
function gtk_builder_get_type: TGType; cdecl; external libgtk4;
function gtk_builder_new: PGtkBuilder; cdecl; external libgtk4;
function gtk_builder_add_from_file(builder: PGtkBuilder; filename: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_add_from_resource(builder: PGtkBuilder; resource_path: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_add_from_string(builder: PGtkBuilder; buffer: pchar; length: Tgssize; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_add_objects_from_file(builder: PGtkBuilder; filename: pchar; object_ids: PPchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_add_objects_from_resource(builder: PGtkBuilder; resource_path: pchar; object_ids: PPchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_add_objects_from_string(builder: PGtkBuilder; buffer: pchar; length: Tgssize; object_ids: PPchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_get_object(builder: PGtkBuilder; name: pchar): PGObject; cdecl; external libgtk4;
function gtk_builder_get_objects(builder: PGtkBuilder): PGSList; cdecl; external libgtk4;
procedure gtk_builder_expose_object(builder: PGtkBuilder; name: pchar; obj: PGObject); cdecl; external libgtk4;
function gtk_builder_get_current_object(builder: PGtkBuilder): PGObject; cdecl; external libgtk4;
procedure gtk_builder_set_current_object(builder: PGtkBuilder; current_object: PGObject); cdecl; external libgtk4;
procedure gtk_builder_set_translation_domain(builder: PGtkBuilder; domain: pchar); cdecl; external libgtk4;
function gtk_builder_get_translation_domain(builder: PGtkBuilder): pchar; cdecl; external libgtk4;
function gtk_builder_get_scope(builder: PGtkBuilder): PGtkBuilderScope; cdecl; external libgtk4;
procedure gtk_builder_set_scope(builder: PGtkBuilder; scope: PGtkBuilderScope); cdecl; external libgtk4;
function gtk_builder_get_type_from_name(builder: PGtkBuilder; type_name: pchar): TGType; cdecl; external libgtk4;
function gtk_builder_value_from_string(builder: PGtkBuilder; pspec: PGParamSpec; _string: pchar; value: PGValue; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_value_from_string_type(builder: PGtkBuilder; _type: TGType; _string: pchar; value: PGValue; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_builder_new_from_file(filename: pchar): PGtkBuilder; cdecl; external libgtk4;
function gtk_builder_new_from_resource(resource_path: pchar): PGtkBuilder; cdecl; external libgtk4;
function gtk_builder_new_from_string(_string: pchar; length: Tgssize): PGtkBuilder; cdecl; external libgtk4;
function gtk_builder_create_closure(builder: PGtkBuilder; function_name: pchar; flags: TGtkBuilderClosureFlags; obj: PGObject; error: PPGError): PGClosure; cdecl; external libgtk4;
function gtk_builder_extend_with_template(builder: PGtkBuilder; obj: PGObject; template_type: TGType; buffer: pchar; length: Tgssize;
  error: PPGError): Tgboolean; cdecl; external libgtk4;

function GTK_BUILDER_ERROR: TGQuark;

// === Konventiert am: 6-7-26 13:53:56 ===

function GTK_TYPE_BUILDER: TGType;
function GTK_BUILDER(obj: Pointer): PGtkBuilder;
function GTK_BUILDER_CLASS(klass: Pointer): PGtkBuilderClass;
function GTK_IS_BUILDER(obj: Pointer): Tgboolean;
function GTK_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
function GTK_BUILDER_GET_CLASS(obj: Pointer): PGtkBuilderClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_BUILDER: TGType;
begin
  GTK_TYPE_BUILDER := gtk_builder_get_type;
end;

function GTK_BUILDER(obj: Pointer): PGtkBuilder;
begin
  Result := PGtkBuilder(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER));
end;

function GTK_BUILDER_CLASS(klass: Pointer): PGtkBuilderClass;
begin
  Result := PGtkBuilderClass(g_type_check_class_cast(klass, GTK_TYPE_BUILDER));
end;

function GTK_IS_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BUILDER);
end;

function GTK_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_BUILDER);
end;

function GTK_BUILDER_GET_CLASS(obj: Pointer): PGtkBuilderClass;
begin
  Result := PGtkBuilderClass(PGTypeInstance(obj)^.g_class);
end;


function GTK_BUILDER_ERROR: TGQuark;
begin
  GTK_BUILDER_ERROR := gtk_builder_error_quark;
end;

end.
