

  {$IFDEF read_struct}
type
  PGtkExpression = type Pointer;
  PPGtkExpression = ^PGtkExpression;

  PGtkExpressionWatch = type Pointer;
  TGtkExpressionNotify = procedure(user_data: Tgpointer); cdecl;

  PGtkPropertyExpression = type Pointer;
  PGtkConstantExpression = type Pointer;
  PGtkObjectExpression = type Pointer;
  PGtkClosureExpression = type Pointer;
  PGtkCClosureExpression = type Pointer;
  PGtkTryExpression = type Pointer;

  PGtkParamSpecExpression = ^TGtkParamSpecExpression;
  TGtkParamSpecExpression = record
    parent_instance: TGParamSpec;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_expression_ref(self: PGtkExpression): PGtkExpression; cdecl; external libgtk4;
procedure gtk_expression_unref(self: PGtkExpression); cdecl; external libgtk4;
function gtk_expression_get_value_type(self: PGtkExpression): TGType; cdecl; external libgtk4;
function gtk_expression_is_static(self: PGtkExpression): Tgboolean; cdecl; external libgtk4;
function gtk_expression_evaluate(self: PGtkExpression; this_: Tgpointer; Value: PGValue): Tgboolean; cdecl; external libgtk4;
function gtk_expression_watch(self: PGtkExpression; this_: Tgpointer; notify: TGtkExpressionNotify; user_data: Tgpointer; user_destroy: TGDestroyNotify): PGtkExpressionWatch; cdecl; external libgtk4;
function gtk_expression_bind(self: PGtkExpression; target: Tgpointer; _property: pchar; this_: Tgpointer): PGtkExpressionWatch; cdecl; external libgtk4;
function gtk_expression_watch_get_type: TGType; cdecl; external libgtk4;
function gtk_expression_watch_ref(watch: PGtkExpressionWatch): PGtkExpressionWatch; cdecl; external libgtk4;
procedure gtk_expression_watch_unref(watch: PGtkExpressionWatch); cdecl; external libgtk4;
function gtk_expression_watch_evaluate(watch: PGtkExpressionWatch; Value: PGValue): Tgboolean; cdecl; external libgtk4;
procedure gtk_expression_watch_unwatch(watch: PGtkExpressionWatch); cdecl; external libgtk4;

function gtk_property_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_property_expression_new(this_type: TGType; expression: PGtkExpression; property_name: pchar): PGtkExpression; cdecl; external libgtk4;
function gtk_property_expression_new_for_pspec(expression: PGtkExpression; pspec: PGParamSpec): PGtkExpression; cdecl; external libgtk4;
function gtk_property_expression_get_expression(expression: PGtkExpression): PGtkExpression; cdecl; external libgtk4;
function gtk_property_expression_get_pspec(expression: PGtkExpression): PGParamSpec; cdecl; external libgtk4;

function gtk_constant_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_constant_expression_new(value_type: TGType): PGtkExpression; varargs cdecl; external libgtk4;
function gtk_constant_expression_new_for_value(Value: PGValue): PGtkExpression; cdecl; external libgtk4;
function gtk_constant_expression_get_value(expression: PGtkExpression): PGValue; cdecl; external libgtk4;

function gtk_object_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_object_expression_new(obj: PGObject): PGtkExpression; cdecl; external libgtk4;
function gtk_object_expression_get_object(expression: PGtkExpression): PGObject; cdecl; external libgtk4;

function gtk_closure_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_closure_expression_new(value_type: TGType; closure: PGClosure; n_params: Tguint; params: PPGtkExpression): PGtkExpression; cdecl; external libgtk4;

function gtk_cclosure_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_cclosure_expression_new(value_type: TGType; marshal: TGClosureMarshal; n_params: Tguint; params: PPGtkExpression; callback_func: TGCallback;
  user_data: Tgpointer; user_destroy: TGClosureNotify): PGtkExpression; cdecl; external libgtk4;

procedure gtk_value_set_expression(Value: PGValue; expression: PGtkExpression); cdecl; external libgtk4;
procedure gtk_value_take_expression(Value: PGValue; expression: PGtkExpression); cdecl; external libgtk4;
function gtk_value_get_expression(Value: PGValue): PGtkExpression; cdecl; external libgtk4;
function gtk_value_dup_expression(Value: PGValue): PGtkExpression; cdecl; external libgtk4;

function gtk_param_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_param_spec_expression(Name: pchar; nick: pchar; blurb: pchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgtk4;

function gtk_try_expression_get_type: TGType; cdecl; external libgtk4;
function gtk_try_expression_new(n_expressions: Tguint; expressions: PPGtkExpression): PGtkExpression; cdecl; external libgtk4;


function GTK_TYPE_EXPRESSION: TGType;
function GTK_EXPRESSION(obj: Pointer): PGtkExpression;
function GTK_IS_EXPRESSION(obj: Pointer): Tgboolean;

function GTK_TYPE_EXPRESSION_WATCH: TGType;
function GTK_TYPE_PROPERTY_EXPRESSION: TGType;
function GTK_TYPE_CONSTANT_EXPRESSION: TGType;
function GTK_TYPE_OBJECT_EXPRESSION: TGType;
function GTK_TYPE_CLOSURE_EXPRESSION: TGType;

function GTK_TYPE_CCLOSURE_EXPRESSION: TGType;
function GTK_VALUE_HOLDS_EXPRESSION(Value: Pointer): Tgboolean;

function GTK_TYPE_PARAM_SPEC_EXPRESSION: TGType;
function GTK_PARAM_SPEC_EXPRESSION(obj: Pointer): PGtkParamSpecExpression;
function GTK_IS_PARAM_SPEC_EXPRESSION(obj: Pointer): Tgboolean;

function GTK_TYPE_TRY_EXPRESSION: TGType;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 16:08:55 ===


{$IFDEF read_implementation}

function GTK_TYPE_EXPRESSION: TGType;
begin
  Result := gtk_expression_get_type();
end;

function GTK_EXPRESSION(obj: Pointer): PGtkExpression;
begin
  Result := PGtkExpression(g_type_check_instance_cast(obj, GTK_TYPE_EXPRESSION));
end;

function GTK_IS_EXPRESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EXPRESSION);
end;


function GTK_TYPE_EXPRESSION_WATCH: TGType;
begin
  GTK_TYPE_EXPRESSION_WATCH := gtk_expression_watch_get_type;
end;

function GTK_TYPE_PROPERTY_EXPRESSION: TGType;
begin
  GTK_TYPE_PROPERTY_EXPRESSION := gtk_property_expression_get_type;
end;

function GTK_TYPE_CONSTANT_EXPRESSION: TGType;
begin
  GTK_TYPE_CONSTANT_EXPRESSION := gtk_constant_expression_get_type;
end;

function GTK_TYPE_OBJECT_EXPRESSION: TGType;
begin
  GTK_TYPE_OBJECT_EXPRESSION := gtk_object_expression_get_type;
end;

function GTK_TYPE_CLOSURE_EXPRESSION: TGType;
begin
  GTK_TYPE_CLOSURE_EXPRESSION := gtk_closure_expression_get_type;
end;

function GTK_TYPE_CCLOSURE_EXPRESSION: TGType;
begin
  GTK_TYPE_CCLOSURE_EXPRESSION := gtk_cclosure_expression_get_type;
end;

function GTK_VALUE_HOLDS_EXPRESSION(Value: Pointer): Tgboolean;
begin
  GTK_VALUE_HOLDS_EXPRESSION := G_VALUE_HOLDS(Value, GTK_TYPE_EXPRESSION);
end;


function GTK_TYPE_PARAM_SPEC_EXPRESSION: TGType;
begin
  GTK_TYPE_PARAM_SPEC_EXPRESSION := gtk_param_expression_get_type;
end;

function GTK_PARAM_SPEC_EXPRESSION(obj: Pointer): PGtkParamSpecExpression;
begin
  Result := PGtkParamSpecExpression(g_type_check_instance_cast(obj, GTK_TYPE_PARAM_SPEC_EXPRESSION));
end;

function GTK_IS_PARAM_SPEC_EXPRESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PARAM_SPEC_EXPRESSION);
end;


function GTK_TYPE_TRY_EXPRESSION: TGType;
begin
  GTK_TYPE_TRY_EXPRESSION := gtk_try_expression_get_type;
end;



{$ENDIF read_implementation}
