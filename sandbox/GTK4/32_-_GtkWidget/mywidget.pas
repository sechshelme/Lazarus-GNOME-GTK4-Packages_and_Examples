unit MyWidget;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2, fp_GTK4;

type
  TMyWidget = record
  private
    parent_instance: TGtkBox;
    gender: Pgchar;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
  private
    parent_class: TGtkBoxClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PMyWidget;
procedure my_widget_set_gender(self: PMyWidget; gender: Pgchar);
function my_widget_get_gender(self: PMyWidget): Pgchar;

function MY_TYPE_WIDGET: TGType;
function MY_WIDGET(obj: Pointer): PMyWidget;
function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
function MY_IS_WIDGET(obj: Pointer): Tgboolean;
function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;

implementation

// ==== private

var
  e_human_ext_parent_class: PMyWidgetClass = nil;

procedure E_humanExt_set_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
  ch: Pgchar;
begin
  self := MY_WIDGET(obj);
  case property_id of
    1: begin
      ch := g_value_get_string(Value);
      if self^.gender <> nil then  begin
        g_free(self^.gender);
      end;
      if (g_strcmp0('Mann', ch) = 0) or (g_strcmp0('Frau', ch) = 0) then begin
        self^.gender := g_value_dup_string(Value);
      end else begin
        self^.gender := g_strdup('unbekannt');
      end;
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;
end;

procedure E_humanExt_get_property(obj: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PMyWidget;
begin
  self := MY_WIDGET(obj);
  case property_id of
    1: begin
      g_value_set_string(Value, self^.gender);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, property_id, pspec);
    end;
  end;
end;

procedure E_humanExt_finalize(obj: PGObject); cdecl;
var
  self: PMyWidget;
begin
  self := MY_WIDGET(obj);
  if self^.gender <> nil then begin
    g_free(self^.gender);
  end;

  G_OBJECT_CLASS(e_human_ext_parent_class)^.finalize(obj);
end;

procedure E_humanExt_init(self: PMyWidget); cdecl;
begin
  self^.gender := nil;
end;

procedure E_humanExt_class_init(klass: PMyWidgetClass); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);
  object_class^.set_property := @E_humanExt_set_property;
  object_class^.get_property := @E_humanExt_get_property;

  object_class^.finalize := @E_humanExt_finalize;
  e_human_ext_parent_class := g_type_class_peek_parent(klass);

  spec := g_param_spec_string('gender', 'Gender', 'Gender of the human', nil, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, spec);
end;

// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  info: TGTypeInfo = (
  class_size: SizeOf(TMyWidgetClass);
  base_init: nil;
  base_finalize: nil;
  class_init: TGClassInitFunc(@E_humanExt_class_init);
  class_finalize: nil;
  class_data: nil;
  instance_size: SizeOf(TMyWidget);
  n_preallocs: 0;
  instance_init: TGInstanceInitFunc(@E_humanExt_init);
  value_table: nil);
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static(GTK_TYPE_BOX, 'MyWidget', @info, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PMyWidget;
var
  button: PGtkWidget;
begin
  Result := g_object_new(MY_TYPE_WIDGET, 'orientation', GTK_ORIENTATION_VERTICAL, nil);
  button := gtk_button_new_with_label('Widget Button');
//  g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
  gtk_box_append(GTK_BOX(Result), button);

end;

procedure my_widget_set_gender(self: PMyWidget; gender: Pgchar);
begin
  g_object_set(self, 'gender', gender, nil);
end;

function my_widget_get_gender(self: PMyWidget): Pgchar;
begin
  Result := self^.gender;
end;

// ====

function MY_TYPE_WIDGET: TGType;
begin
  Result := my_widget_get_type;
end;

function MY_WIDGET(obj: Pointer): PMyWidget;
begin
  Result := PMyWidget(g_type_check_instance_cast(obj, MY_TYPE_WIDGET));
end;

function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(g_type_check_class_cast(klass, MY_TYPE_WIDGET));
end;

function MY_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MY_TYPE_WIDGET);
end;

function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, MY_TYPE_WIDGET);
end;

function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
