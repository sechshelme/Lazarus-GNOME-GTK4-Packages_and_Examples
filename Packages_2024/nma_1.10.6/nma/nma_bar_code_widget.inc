{$IFDEF read_interface}


const
  NMA_BAR_CODE_WIDGET_CONNECTION = 'connection';

type
  PNMABarCodeWidget = type Pointer;
  PNMABarCodeWidgetClass = type Pointer;

function nma_bar_code_widget_get_type: TGType; cdecl; external libnma;
function nma_bar_code_widget_new(connection: PNMConnection): PGtkWidget; cdecl; external libnma;

// === Konventiert am: 8-8-26 13:27:09 ===

function NMA_TYPE_BAR_CODE_WIDGET: TGType;
function NMA_BAR_CODE_WIDGET(obj: Pointer): PNMABarCodeWidget;
function NMA_BAR_CODE_WIDGET_CLASS(klass: Pointer): PNMABarCodeWidgetClass;
function NMA_IS_BAR_CODE_WIDGET(obj: Pointer): Tgboolean;
function NMA_IS_BAR_CODE_WIDGET_CLASS(klass: Pointer): Tgboolean;
function NMA_BAR_CODE_WIDGET_GET_CLASS(obj: Pointer): PNMABarCodeWidgetClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_TYPE_BAR_CODE_WIDGET: TGType;
begin
  NMA_TYPE_BAR_CODE_WIDGET := nma_bar_code_widget_get_type;
end;

function NMA_BAR_CODE_WIDGET(obj: Pointer): PNMABarCodeWidget;
begin
  Result := PNMABarCodeWidget(g_type_check_instance_cast(obj, NMA_TYPE_BAR_CODE_WIDGET));
end;

function NMA_BAR_CODE_WIDGET_CLASS(klass: Pointer): PNMABarCodeWidgetClass;
begin
  Result := PNMABarCodeWidgetClass(g_type_check_class_cast(klass, NMA_TYPE_BAR_CODE_WIDGET));
end;

function NMA_IS_BAR_CODE_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_BAR_CODE_WIDGET);
end;

function NMA_IS_BAR_CODE_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_BAR_CODE_WIDGET);
end;

function NMA_BAR_CODE_WIDGET_GET_CLASS(obj: Pointer): PNMABarCodeWidgetClass;
begin
  Result := PNMABarCodeWidgetClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
