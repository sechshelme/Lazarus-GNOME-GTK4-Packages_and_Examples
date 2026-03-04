unit lsmsvgfilterconvolvematrix;

interface

uses
  fp_glib2, fp_lasem, lsmdomnode, lsmsvgattributes, lsmsvgfilterprimitive;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TLsmSvgFilterConvolveMatrix = record
    base: TLsmSvgFilterPrimitive;
    order: TLsmSvgOneOrTwoIntegerAttribute;
    kernel: TLsmSvgVectorAttribute;
    divisor: TLsmSvgDoubleAttribute;
    bias: TLsmSvgDoubleAttribute;
    target_x: TLsmSvgIntegerAttribute;
    target_y: TLsmSvgIntegerAttribute;
    edge_mode: TLsmSvgEdgeModeAttribute;
    preserve_alpha: TLsmSvgBooleanAttribute;
  end;
  PLsmSvgFilterConvolveMatrix = ^TLsmSvgFilterConvolveMatrix;

  TLsmSvgFilterConvolveMatrixClass = record
    element_class: TLsmSvgFilterPrimitiveClass;
  end;
  PLsmSvgFilterConvolveMatrixClass = ^TLsmSvgFilterConvolveMatrixClass;

function lsm_svg_filter_convolve_matrix_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_convolve_matrix_new: PLsmDomNode; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:00:36 ===

function LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX: TGType;
function LSM_SVG_FILTER_CONVOLVE_MATRIX(obj: Pointer): PLsmSvgFilterConvolveMatrix;
function LSM_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass: Pointer): PLsmSvgFilterConvolveMatrixClass;
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX(obj: Pointer): Tgboolean;
function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_FILTER_CONVOLVE_MATRIX_GET_CLASS(obj: Pointer): PLsmSvgFilterConvolveMatrixClass;

implementation

function LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX: TGType;
begin
  LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX := lsm_svg_filter_convolve_matrix_get_type;
end;

function LSM_SVG_FILTER_CONVOLVE_MATRIX(obj: Pointer): PLsmSvgFilterConvolveMatrix;
begin
  Result := PLsmSvgFilterConvolveMatrix(g_type_check_instance_cast(obj, LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX));
end;

function LSM_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass: Pointer): PLsmSvgFilterConvolveMatrixClass;
begin
  Result := PLsmSvgFilterConvolveMatrixClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX));
end;

function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX);
end;

function LSM_IS_SVG_FILTER_CONVOLVE_MATRIX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_FILTER_CONVOLVE_MATRIX);
end;

function LSM_SVG_FILTER_CONVOLVE_MATRIX_GET_CLASS(obj: Pointer): PLsmSvgFilterConvolveMatrixClass;
begin
  Result := PLsmSvgFilterConvolveMatrixClass(PGTypeInstance(obj)^.g_class);
end;



end.
