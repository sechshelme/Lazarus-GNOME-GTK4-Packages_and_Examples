unit gtkexpression;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_EXPRESSION_WATCH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EXPRESSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EXPRESSION(obj : longint) : longint;

type
{*
 * GtkExpressionNotify:
 * @user_data: data passed to gtk_expression_watch()
 *
 * Callback called by gtk_expression_watch() when the
 * expression value changes.
  }

  TGtkExpressionNotify = procedure (user_data:Tgpointer);cdecl;

function gtk_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_expression_ref(self:PGtkExpression):PGtkExpression;cdecl;external libgtk4;
procedure gtk_expression_unref(self:PGtkExpression);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkExpression, gtk_expression_unref) }
function gtk_expression_get_value_type(self:PGtkExpression):TGType;cdecl;external libgtk4;
function gtk_expression_is_static(self:PGtkExpression):Tgboolean;cdecl;external libgtk4;
function gtk_expression_evaluate(self:PGtkExpression; this_:Tgpointer; value:PGValue):Tgboolean;cdecl;external libgtk4;
function gtk_expression_watch(self:PGtkExpression; this_:Tgpointer; notify:TGtkExpressionNotify; user_data:Tgpointer; user_destroy:TGDestroyNotify):PGtkExpressionWatch;cdecl;external libgtk4;
function gtk_expression_bind(self:PGtkExpression; target:Tgpointer; _property:Pchar; this_:Tgpointer):PGtkExpressionWatch;cdecl;external libgtk4;
function gtk_expression_watch_get_type:TGType;cdecl;external libgtk4;
function gtk_expression_watch_ref(watch:PGtkExpressionWatch):PGtkExpressionWatch;cdecl;external libgtk4;
procedure gtk_expression_watch_unref(watch:PGtkExpressionWatch);cdecl;external libgtk4;
function gtk_expression_watch_evaluate(watch:PGtkExpressionWatch; value:PGValue):Tgboolean;cdecl;external libgtk4;
procedure gtk_expression_watch_unwatch(watch:PGtkExpressionWatch);cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_PROPERTY_EXPRESSION : longint; { return type might be wrong }

type

function gtk_property_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_property_expression_new(this_type:TGType; expression:PGtkExpression; property_name:Pchar):PGtkExpression;cdecl;external libgtk4;
function gtk_property_expression_new_for_pspec(expression:PGtkExpression; pspec:PGParamSpec):PGtkExpression;cdecl;external libgtk4;
function gtk_property_expression_get_expression(expression:PGtkExpression):PGtkExpression;cdecl;external libgtk4;
function gtk_property_expression_get_pspec(expression:PGtkExpression):PGParamSpec;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_CONSTANT_EXPRESSION : longint; { return type might be wrong }

type

function gtk_constant_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_constant_expression_new(value_type:TGType; args:array of const):PGtkExpression;cdecl;external libgtk4;
function gtk_constant_expression_new(value_type:TGType):PGtkExpression;cdecl;external libgtk4;
function gtk_constant_expression_new_for_value(value:PGValue):PGtkExpression;cdecl;external libgtk4;
function gtk_constant_expression_get_value(expression:PGtkExpression):PGValue;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_OBJECT_EXPRESSION : longint; { return type might be wrong }

type

function gtk_object_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_object_expression_new(object:PGObject):PGtkExpression;cdecl;external libgtk4;
function gtk_object_expression_get_object(expression:PGtkExpression):PGObject;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_CLOSURE_EXPRESSION : longint; { return type might be wrong }

type

function gtk_closure_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_closure_expression_new(value_type:TGType; closure:PGClosure; n_params:Tguint; params:PPGtkExpression):PGtkExpression;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_CCLOSURE_EXPRESSION : longint; { return type might be wrong }

type

function gtk_cclosure_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_cclosure_expression_new(value_type:TGType; marshal:TGClosureMarshal; n_params:Tguint; params:PPGtkExpression; callback_func:TGCallback; 
           user_data:Tgpointer; user_destroy:TGClosureNotify):PGtkExpression;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_TRY_EXPRESSION : longint; { return type might be wrong }

type

function gtk_try_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_try_expression_new(n_expressions:Tguint; expressions:PPGtkExpression):PGtkExpression;cdecl;external libgtk4;
{ GObject integration, so we can use GtkBuilder  }
{*
 * GTK_VALUE_HOLDS_EXPRESSION:
 * @value: a `GValue`
 *
 * Evaluates to true if @value was initialized with `GTK_TYPE_EXPRESSION`
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_VALUE_HOLDS_EXPRESSION(value : longint) : longint;

procedure gtk_value_set_expression(value:PGValue; expression:PGtkExpression);cdecl;external libgtk4;
procedure gtk_value_take_expression(value:PGValue; expression:PGtkExpression);cdecl;external libgtk4;
function gtk_value_get_expression(value:PGValue):PGtkExpression;cdecl;external libgtk4;
function gtk_value_dup_expression(value:PGValue):PGtkExpression;cdecl;external libgtk4;
{ was #define dname def_expr }
function GTK_TYPE_PARAM_SPEC_EXPRESSION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_PARAM_SPEC_EXPRESSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_PARAM_SPEC_EXPRESSION(obj : longint) : longint;

{*
 * GtkParamSpecExpression:
 *
 * A `GParamSpec` for properties holding a `GtkExpression`.
  }
{< private > }
type
  PGtkParamSpecExpression = ^TGtkParamSpecExpression;
  TGtkParamSpecExpression = record
      parent_instance : TGParamSpec;
    end;

function gtk_param_expression_get_type:TGType;cdecl;external libgtk4;
function gtk_param_spec_expression(name:Pchar; nick:Pchar; blurb:Pchar; flags:TGParamFlags):PGParamSpec;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:08:55 ===

function GTK_TYPE_EXPRESSION : TGType;

implementation

function GTK_TYPE_EXPRESSION : TGType;
  begin
    GTK_TYPE_EXPRESSION:=gtk_expression_get_type;
  end;


{ was #define dname def_expr }
function GTK_TYPE_EXPRESSION_WATCH : longint; { return type might be wrong }
  begin
    GTK_TYPE_EXPRESSION_WATCH:=gtk_expression_watch_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_EXPRESSION(obj : longint) : longint;
begin
  GTK_IS_EXPRESSION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_EXPRESSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_EXPRESSION(obj : longint) : longint;
begin
  GTK_EXPRESSION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_EXPRESSION,GtkExpression);
end;

{ was #define dname def_expr }
function GTK_TYPE_PROPERTY_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_PROPERTY_EXPRESSION:=gtk_property_expression_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_CONSTANT_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_CONSTANT_EXPRESSION:=gtk_constant_expression_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_OBJECT_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_OBJECT_EXPRESSION:=gtk_object_expression_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_CLOSURE_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_CLOSURE_EXPRESSION:=gtk_closure_expression_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_CCLOSURE_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_CCLOSURE_EXPRESSION:=gtk_cclosure_expression_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_TRY_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_TRY_EXPRESSION:=gtk_try_expression_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_VALUE_HOLDS_EXPRESSION(value : longint) : longint;
begin
  GTK_VALUE_HOLDS_EXPRESSION:=G_VALUE_HOLDS(value,GTK_TYPE_EXPRESSION);
end;

{ was #define dname def_expr }
function GTK_TYPE_PARAM_SPEC_EXPRESSION : longint; { return type might be wrong }
  begin
    GTK_TYPE_PARAM_SPEC_EXPRESSION:=gtk_param_expression_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_PARAM_SPEC_EXPRESSION(obj : longint) : longint;
begin
  GTK_PARAM_SPEC_EXPRESSION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_PARAM_SPEC_EXPRESSION,GtkParamSpecExpression);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_PARAM_SPEC_EXPRESSION(obj : longint) : longint;
begin
  GTK_IS_PARAM_SPEC_EXPRESSION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_PARAM_SPEC_EXPRESSION);
end;


end.
