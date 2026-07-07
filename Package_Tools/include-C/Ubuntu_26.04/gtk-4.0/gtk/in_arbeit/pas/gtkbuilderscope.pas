unit gtkbuilderscope;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gtktypes, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkBuilderClosureFlags = ^TGtkBuilderClosureFlags;
  TGtkBuilderClosureFlags = longint;
const
  GTK_BUILDER_CLOSURE_SWAPPED = 1 shl 0;

type
  PGtkBuilderScope = type Pointer;

  PGtkBuilderScopeInterface = ^TGtkBuilderScopeInterface;
  TGtkBuilderScopeInterface = record
    g_iface: TGTypeInterface;
    get_type_from_name: function(self: PGtkBuilderScope; builder: PGtkBuilder; type_name: pchar): TGType; cdecl;
    get_type_from_function: function(self: PGtkBuilderScope; builder: PGtkBuilder; function_name: pchar): TGType; cdecl;
    create_closure: function(self: PGtkBuilderScope; builder: PGtkBuilder; function_name: pchar; flags: TGtkBuilderClosureFlags; obj: PGObject; error: PPGError): PGClosure; cdecl;
  end;

  TGtkBuilderCScope = record
    parent_instance: TGObject;
  end;
  PGtkBuilderCScope = ^TGtkBuilderCScope;

  PGtkBuilderCScopeClass = ^TGtkBuilderCScopeClass;
  TGtkBuilderCScopeClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_builder_scope_get_type: TGType; cdecl; external libgtk4;
function gtk_builder_cscope_get_type: TGType; cdecl; external libgtk4;
function gtk_builder_cscope_new: PGtkBuilderScope; cdecl; external libgtk4;
procedure gtk_builder_cscope_add_callback_symbol(self: PGtkBuilderCScope; callback_name: pchar; callback_symbol: TGCallback); cdecl; external libgtk4;
procedure gtk_builder_cscope_add_callback_symbols(self: PGtkBuilderCScope; first_callback_name: pchar; first_callback_symbol: TGCallback; args: array of const); cdecl; external libgtk4;
procedure gtk_builder_cscope_add_callback_symbols(self: PGtkBuilderCScope; first_callback_name: pchar; first_callback_symbol: TGCallback); cdecl; external libgtk4;
function gtk_builder_cscope_lookup_callback_symbol(self: PGtkBuilderCScope; callback_name: pchar): TGCallback; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:53:29 ===

function GTK_TYPE_BUILDER_SCOPE: TGType;
function GTK_BUILDER_SCOPE(obj: Pointer): PGtkBuilderScope;
function GTK_IS_BUILDER_SCOPE(obj: Pointer): Tgboolean;
function GTK_BUILDER_SCOPE_GET_IFACE(obj: Pointer): PGtkBuilderScopeInterface;

function GTK_TYPE_BUILDER_CSCOPE: TGType;
function GTK_BUILDER_CSCOPE(obj: Pointer): PGtkBuilderCScope;
function GTK_IS_BUILDER_CSCOPE(obj: Pointer): Tgboolean;
function GTK_BUILDER_CSCOPE_CLASS(klass: Pointer): PGtkBuilderCScopeClass;
function GTK_IS_BUILDER_CSCOPE_CLASS(klass: Pointer): Tgboolean;
function GTK_BUILDER_CSCOPE_GET_CLASS(obj: Pointer): PGtkBuilderCScopeClass;
{$ENDIF read_struct}

implementation

function GTK_TYPE_BUILDER_SCOPE: TGType;
begin
  Result := gtk_builder_scope_get_type;
end;

function GTK_BUILDER_SCOPE(obj: Pointer): PGtkBuilderScope;
begin
  Result := PGtkBuilderScope(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER_SCOPE));
end;

function GTK_IS_BUILDER_SCOPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BUILDER_SCOPE);
end;

function GTK_BUILDER_SCOPE_GET_IFACE(obj: Pointer): PGtkBuilderScopeInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_BUILDER_SCOPE);
end;


function GTK_TYPE_BUILDER_CSCOPE: TGType;
begin
  Result := gtk_builder_cscope_get_type;
end;

function GTK_BUILDER_CSCOPE(obj: Pointer): PGtkBuilderCScope;
begin
  Result := PGtkBuilderCScope(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER_CSCOPE));
end;

function GTK_IS_BUILDER_CSCOPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BUILDER_CSCOPE);
end;

function GTK_BUILDER_CSCOPE_CLASS(klass: Pointer): PGtkBuilderCScopeClass;
begin
  Result := PGtkBuilderCScopeClass(g_type_check_class_cast(klass, GTK_TYPE_BUILDER_CSCOPE));
end;

function GTK_IS_BUILDER_CSCOPE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_BUILDER_CSCOPE);
end;

function GTK_BUILDER_CSCOPE_GET_CLASS(obj: Pointer): PGtkBuilderCScopeClass;
begin
  Result := PGtkBuilderCScopeClass(PGTypeInstance(obj)^.g_class);
end;


end.
