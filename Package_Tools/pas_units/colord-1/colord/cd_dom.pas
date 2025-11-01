unit cd_dom;

interface

uses
  fp_glib2, fp_colord, cd_color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCdDomClass = record
    parent_class: TGObjectClass;
    _cd_dom_reserved1: procedure; cdecl;
    _cd_dom_reserved2: procedure; cdecl;
    _cd_dom_reserved3: procedure; cdecl;
    _cd_dom_reserved4: procedure; cdecl;
    _cd_dom_reserved5: procedure; cdecl;
    _cd_dom_reserved6: procedure; cdecl;
    _cd_dom_reserved7: procedure; cdecl;
    _cd_dom_reserved8: procedure; cdecl;
  end;
  PCdDomClass = ^TCdDomClass;

  TCdDom = record
    parent_instance: TGObject;
  end;
  PCdDom = ^TCdDom;

function cd_dom_get_type: TGType; cdecl; external libcolord;
function cd_dom_error_quark: TGQuark; cdecl; external libcolord;
function cd_dom_new: PCdDom; cdecl; external libcolord;
function cd_dom_to_string(dom: PCdDom): Pgchar; cdecl; external libcolord;
function cd_dom_parse_xml_data(dom: PCdDom; data: Pgchar; data_len: Tgssize; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_dom_get_node(dom: PCdDom; root: PGNode; path: Pgchar): PGNode; cdecl; external libcolord;
function cd_dom_get_node_name(node: PGNode): Pgchar; cdecl; external libcolord;
function cd_dom_get_node_data(node: PGNode): Pgchar; cdecl; external libcolord;
function cd_dom_get_node_data_as_int(node: PGNode): Tgint; cdecl; external libcolord;
function cd_dom_get_node_data_as_double(node: PGNode): Tgdouble; cdecl; external libcolord;
function cd_dom_get_node_attribute(node: PGNode; key: Pgchar): Pgchar; cdecl; external libcolord;
function cd_dom_get_node_rgb(node: PGNode; rgb: PCdColorRGB): Tgboolean; cdecl; external libcolord;
function cd_dom_get_node_yxy(node: PGNode; yxy: PCdColorYxy): Tgboolean; cdecl; external libcolord;
function cd_dom_get_node_lab(node: PGNode; lab: PCdColorLab): Tgboolean; cdecl; external libcolord;
function cd_dom_get_node_localized(node: PGNode; key: Pgchar): PGHashTable; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:17 ===

function CD_TYPE_DOM: TGType;
function CD_DOM(obj: Pointer): PCdDom;
function CD_IS_DOM(obj: Pointer): Tgboolean;
function CD_DOM_CLASS(klass: Pointer): PCdDomClass;
function CD_IS_DOM_CLASS(klass: Pointer): Tgboolean;
function CD_DOM_GET_CLASS(obj: Pointer): PCdDomClass;

implementation

function CD_TYPE_DOM: TGType;
begin
  Result := cd_dom_get_type;
end;

function CD_DOM(obj: Pointer): PCdDom;
begin
  Result := PCdDom(g_type_check_instance_cast(obj, CD_TYPE_DOM));
end;

function CD_IS_DOM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_DOM);
end;

function CD_DOM_CLASS(klass: Pointer): PCdDomClass;
begin
  Result := PCdDomClass(g_type_check_class_cast(klass, CD_TYPE_DOM));
end;

function CD_IS_DOM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_DOM);
end;

function CD_DOM_GET_CLASS(obj: Pointer): PCdDomClass;
begin
  Result := PCdDomClass(PGTypeInstance(obj)^.g_class);
end;



end.
