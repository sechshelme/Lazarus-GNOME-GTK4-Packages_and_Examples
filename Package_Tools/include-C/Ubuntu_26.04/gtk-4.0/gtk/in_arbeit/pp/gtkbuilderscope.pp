
unit gtkbuilderscope;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkbuilderscope.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkbuilderscope.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGClosure  = ^GClosure;
PGError  = ^GError;
PGObject  = ^GObject;
PGtkBuilder  = ^GtkBuilder;
PGtkBuilderClosureFlags  = ^GtkBuilderClosureFlags;
PGtkBuilderCScope  = ^GtkBuilderCScope;
PGtkBuilderCScopeClass  = ^GtkBuilderCScopeClass;
PGtkBuilderScope  = ^GtkBuilderScope;
PGtkBuilderScopeInterface  = ^GtkBuilderScopeInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_BUILDER_SCOPE : longint; { return type might be wrong }

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
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
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
function gtk_builder_cscope_new:PGtkBuilderScope;cdecl;external;
(* Const before type ignored *)
procedure gtk_builder_cscope_add_callback_symbol(self:PGtkBuilderCScope; callback_name:Pchar; callback_symbol:TGCallback);cdecl;external;
(* Const before type ignored *)
procedure gtk_builder_cscope_add_callback_symbols(self:PGtkBuilderCScope; first_callback_name:Pchar; first_callback_symbol:TGCallback; args:array of const);cdecl;external;
procedure gtk_builder_cscope_add_callback_symbols(self:PGtkBuilderCScope; first_callback_name:Pchar; first_callback_symbol:TGCallback);cdecl;external;
{ xxxxxx #define gtk_builder_cscope_add_callback(scope, callback) gtk_builder_cscope_add_callback_symbol (GTK_BUILDER_CSCOPE (scope), #callback, G_CALLBACK (callback)) }
(* Const before type ignored *)
function gtk_builder_cscope_lookup_callback_symbol(self:PGtkBuilderCScope; callback_name:Pchar):TGCallback;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_BUILDER_SCOPE : longint; { return type might be wrong }
  begin
    GTK_TYPE_BUILDER_SCOPE:=gtk_builder_scope_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_BUILDER_CSCOPE : longint; { return type might be wrong }
  begin
    GTK_TYPE_BUILDER_CSCOPE:=gtk_builder_cscope_get_type;
  end;


end.
