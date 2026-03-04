unit lsmsvgfilterprimitive;

interface

uses
  fp_glib2, fp_lasem, lsmattributes, lsmutils, lsmsvgelement, lsmsvgattributes, lsmsvglength;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TLsmSvgFilterPrimitive = record
    element: TLsmSvgElement;
    x: TLsmSvgLengthAttribute;
    y: TLsmSvgLengthAttribute;
    width: TLsmSvgLengthAttribute;
    height: TLsmSvgLengthAttribute;
    in_: TLsmAttribute;
    result: TLsmAttribute;
  end;
  PLsmSvgFilterPrimitive = ^TLsmSvgFilterPrimitive;

  TLsmSvgFilterPrimitiveClass = record
    element_class: TLsmSvgElementClass;
    apply: procedure(self: PLsmSvgFilterPrimitive; view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox); cdecl;
  end;
  PLsmSvgFilterPrimitiveClass = ^TLsmSvgFilterPrimitiveClass;

function lsm_svg_filter_primitive_get_type: TGType; cdecl; external liblasem;
procedure lsm_svg_filter_primitive_apply(self: PLsmSvgFilterPrimitive; view: PLsmSvgView); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:13 ===

function LSM_TYPE_SVG_FILTER_PRIMITIVE: TGType;
function LSM_SVG_FILTER_PRIMITIVE(obj: Pointer): PLsmSvgFilterPrimitive;
function LSM_SVG_FILTER_PRIMITIVE_CLASS(klass: Pointer): PLsmSvgFilterPrimitiveClass;
function LSM_IS_SVG_FILTER_PRIMITIVE(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_PRIMITIVE_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_PRIMITIVE_GET_CLASS(obj: Pointer): PLsmSvgFilterPrimitiveClass;

implementation

function LSM_TYPE_SVG_FILTER_PRIMITIVE: TGType;
begin
  LSM_TYPE_SVG_FILTER_PRIMITIVE := lsm_svg_filter_primitive_get_type;
end;

function LSM_SVG_FILTER_PRIMITIVE(obj: Pointer): PLsmSvgFilterPrimitive;
begin
  Result := PLsmSvgFilterPrimitive(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_PRIMITIVE));
end;

function LSM_SVG_FILTER_PRIMITIVE_CLASS(klass: Pointer): PLsmSvgFilterPrimitiveClass;
begin
  Result := PLsmSvgFilterPrimitiveClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_PRIMITIVE));
end;

function LSM_IS_SVG_FILTER_PRIMITIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_PRIMITIVE);
end;

function LSM_IS_SVG_FILTER_PRIMITIVE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_PRIMITIVE);
end;

function LSM_SVG_FILTER_PRIMITIVE_GET_CLASS(obj: Pointer): PLsmSvgFilterPrimitiveClass;
begin
  Result := PLsmSvgFilterPrimitiveClass(PGTypeInstance(obj)^.g_class);
end;



end.
