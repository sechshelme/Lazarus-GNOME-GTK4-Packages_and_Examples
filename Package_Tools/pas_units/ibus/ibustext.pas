unit ibustext;

interface

uses
  fp_glib2, ibus, ibusserializable, ibusattrlist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TIBusText = record
    parent: TIBusSerializable;
    is_static: Tgboolean;
    text: Pgchar;
    attrs: PIBusAttrList;
  end;
  PIBusText = ^TIBusText;
  PPIBusText = ^PIBusText;

  TIBusTextClass = record
    parent: TIBusSerializableClass;
  end;

  PIBusTextClass = ^TIBusTextClass;

function ibus_text_get_type: TGType; cdecl; external libibus;
function ibus_text_new_from_string(str: Pgchar): PIBusText; cdecl; external libibus;
function ibus_text_new_from_ucs4(str: Pgunichar): PIBusText; cdecl; external libibus;
function ibus_text_new_from_static_string(str: Pgchar): PIBusText; cdecl; external libibus;
function ibus_text_new_from_printf(fmt: Pgchar): PIBusText; cdecl; varargs; external libibus;
function ibus_text_new_from_unichar(c: Tgunichar): PIBusText; cdecl; external libibus;
procedure ibus_text_append_attribute(text: PIBusText; _type: Tguint; value: Tguint; start_index: Tguint; end_index: Tgint); cdecl; external libibus;
function ibus_text_get_length(text: PIBusText): Tguint; cdecl; external libibus;
function ibus_text_get_is_static(text: PIBusText): Tgboolean; cdecl; external libibus;
function ibus_text_get_text(text: PIBusText): Pgchar; cdecl; external libibus;
function ibus_text_get_attributes(text: PIBusText): PIBusAttrList; cdecl; external libibus;
procedure ibus_text_set_attributes(text: PIBusText; attrs: PIBusAttrList); cdecl; external libibus;

// === Konventiert am: 25-7-25 17:12:29 ===

function IBUS_TYPE_TEXT: TGType;
function IBUS_TEXT(obj: Pointer): PIBusText;
function IBUS_TEXT_CLASS(klass: Pointer): PIBusTextClass;
function IBUS_IS_TEXT(obj: Pointer): Tgboolean;
function IBUS_IS_TEXT_CLASS(klass: Pointer): Tgboolean;
function IBUS_TEXT_GET_CLASS(obj: Pointer): PIBusTextClass;

implementation

function IBUS_TYPE_TEXT: TGType;
begin
  IBUS_TYPE_TEXT := ibus_text_get_type;
end;

function IBUS_TEXT(obj: Pointer): PIBusText;
begin
  Result := PIBusText(g_type_check_instance_cast(obj, IBUS_TYPE_TEXT));
end;

function IBUS_TEXT_CLASS(klass: Pointer): PIBusTextClass;
begin
  Result := PIBusTextClass(g_type_check_class_cast(klass, IBUS_TYPE_TEXT));
end;

function IBUS_IS_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_TEXT);
end;

function IBUS_IS_TEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_TEXT);
end;

function IBUS_TEXT_GET_CLASS(obj: Pointer): PIBusTextClass;
begin
  Result := PIBusTextClass(PGTypeInstance(obj)^.g_class);
end;



end.
