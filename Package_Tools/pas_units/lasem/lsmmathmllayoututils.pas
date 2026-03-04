unit lsmmathmllayoututils;

interface

uses
  fp_glib2, fp_lasem, lsmmathmlelement, lsmmathmlenums, lsmmathmlutils, lsmmathmlmathelement;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure lsm_mathml_measure_sub_sup(parent: PLsmMathmlElement; view: PLsmMathmlView; base: PLsmMathmlElement; subscript: PLsmMathmlElement; superscript: PLsmMathmlElement;
  subscript_offset_min: double; superscript_offset_min: double; display: TLsmMathmlDisplay; stretch_bbox: PLsmMathmlBbox; bbox: PLsmMathmlBbox;
  subscript_offset: Pdouble; superscript_offset: Pdouble); cdecl; external liblasem;
procedure lsm_mathml_layout_sub_sup(parent: PLsmMathmlElement; view: PLsmMathmlView; x: double; y: double; base: PLsmMathmlElement;
  subscript: PLsmMathmlElement; superscript: PLsmMathmlElement; subscript_offset: double; superscript_offset: double); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:39 ===


implementation



end.
