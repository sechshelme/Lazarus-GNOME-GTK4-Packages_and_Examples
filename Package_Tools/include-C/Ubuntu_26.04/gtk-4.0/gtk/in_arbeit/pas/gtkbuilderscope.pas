unit gtkbuilderscope;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ G_DECLARE_INTERFACE (GtkBuilderScope, gtk_builder_scope, GTK, BUILDER_SCOPE, GObject) }
{< prefix=GTK_BUILDER_CLOSURE > }
type
  PGtkBuilderClosureFlags = ^TGtkBuilderClosureFlags;
  TGtkBuilderClosureFlags =  Longint;
  Const
    GTK_BUILDER_CLOSURE_SWAPPED = 1 shl 0;
;
{< private > }
{< public > }
type
  PGtkBuilderScopeInterface = ^TGtkBuilderScopeInterface;
  TGtkBuilderScopeInterface = record
      g_iface : TGTypeInterface;
      get_type_from_name : function (self:PGtkBuilderScope; builder:PGtkBuilder; type_name:Pchar):TGType;cdecl;
      get_type_from_function : function (self:PGtkBuilderScope; builder:PGtkBuilder; function_name:Pchar):TGType;cdecl;
      create_closure : function (self:PGtkBuilderScope; builder:PGtkBuilder; function_name:Pchar; flags:TGtkBuilderClosureFlags; object:PGObject; 
                   error:PPGError):PGClosure;cdecl;
    end;

  PGtkBuilderCScopeClass = ^TGtkBuilderCScopeClass;
  TGtkBuilderCScopeClass = record
      parent_class : TGObjectClass;
    end;


{ was #define dname def_expr }
function GTK_TYPE_BUILDER_CSCOPE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkBuilderCScope, gtk_builder_cscope, GTK, BUILDER_CSCOPE, GObject) }
function gtk_builder_cscope_new:PGtkBuilderScope;cdecl;external libgtk4;
procedure gtk_builder_cscope_add_callback_symbol(self:PGtkBuilderCScope; callback_name:Pchar; callback_symbol:TGCallback);cdecl;external libgtk4;
procedure gtk_builder_cscope_add_callback_symbols(self:PGtkBuilderCScope; first_callback_name:Pchar; first_callback_symbol:TGCallback; args:array of const);cdecl;external libgtk4;
procedure gtk_builder_cscope_add_callback_symbols(self:PGtkBuilderCScope; first_callback_name:Pchar; first_callback_symbol:TGCallback);cdecl;external libgtk4;
{ xxxxxx #define gtk_builder_cscope_add_callback(scope, callback) gtk_builder_cscope_add_callback_symbol (GTK_BUILDER_CSCOPE (scope), #callback, G_CALLBACK (callback)) }
function gtk_builder_cscope_lookup_callback_symbol(self:PGtkBuilderCScope; callback_name:Pchar):TGCallback;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 13:53:29 ===

function GTK_TYPE_BUILDER_SCOPE: TGType;
function GTK_BUILDER_SCOPE(obj: Pointer): PGtkBuilderScope;
function GTK_IS_BUILDER_SCOPE(obj: Pointer): Tgboolean;
function GTK_BUILDER_SCOPE_GET_IFACE(obj: Pointer): PGtkBuilderScopeInterface;

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

type 
  PGtkBuilderScope = type Pointer;

  PGtkBuilderScopeInterface = type Pointer

function gtk_builder_scope_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_BUILDER_CSCOPE : longint; { return type might be wrong }
  begin
    GTK_TYPE_BUILDER_CSCOPE:=gtk_builder_cscope_get_type;
  end;


end.
