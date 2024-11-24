unit 2;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}




// === Konventiert am: 24-11-24 19:32:27 ===

function PANGO_TYPE_LAYOUT : TGType;
function PANGO_LAYOUT(obj : Pointer) : PPangoLayout;
function PANGO_LAYOUT_CLASS(klass : Pointer) : PPangoLayoutClass;
function PANGO_IS_LAYOUT(obj : Pointer) : Tgboolean;
function PANGO_IS_LAYOUT_CLASS(klass : Pointer) : Tgboolean;
function PANGO_LAYOUT_GET_CLASS(obj : Pointer) : PPangoLayoutClass;

implementation

function PANGO_TYPE_LAYOUT : TGType;
  begin
    PANGO_TYPE_LAYOUT:=pango_layout_get_type;
  end;

function PANGO_LAYOUT(obj : Pointer) : PPangoLayout;
begin
  Result := PPangoLayout(g_type_check_instance_cast(obj, PANGO_TYPE_LAYOUT));
end;

function PANGO_LAYOUT_CLASS(klass : Pointer) : PPangoLayoutClass;
begin
  Result := PPangoLayoutClass(g_type_check_class_cast(klass, PANGO_TYPE_LAYOUT));
end;

function PANGO_IS_LAYOUT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_LAYOUT);
end;

function PANGO_IS_LAYOUT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PANGO_TYPE_LAYOUT);
end;

function PANGO_LAYOUT_GET_CLASS(obj : Pointer) : PPangoLayoutClass;
begin
  Result := PPangoLayoutClass(PGTypeInstance(obj)^.g_class);
end;



end.
