unit nma_bar_code;

interface

uses
  fp_glib2, fp_cairo, fp_nma;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NMA_BAR_CODE_TEXT = 'text';
  NMA_BAR_CODE_SIZE = 'size';

type
  PNMABarCode = type Pointer;
  PNMABarCodeClass = type Pointer;

function nma_bar_code_get_type: TGType; cdecl; external libnma;
function nma_bar_code_new(text: pchar): PNMABarCode; cdecl; external libnma;
procedure nma_bar_code_set_text(self: PNMABarCode; text: pchar); cdecl; external libnma;
function nma_bar_code_get_size(self: PNMABarCode): longint; cdecl; external libnma;
procedure nma_bar_code_draw(self: PNMABarCode; cr: Pcairo_t); cdecl; external libnma;

// === Konventiert am: 8-8-26 13:27:15 ===

function NMA_TYPE_BAR_CODE: TGType;
function NMA_BAR_CODE(obj: Pointer): PNMABarCode;
function NMA_BAR_CODE_CLASS(klass: Pointer): PNMABarCodeClass;
function NMA_IS_BAR_CODE(obj: Pointer): Tgboolean;
function NMA_IS_BAR_CODE_CLASS(klass: Pointer): Tgboolean;
function NMA_BAR_CODE_GET_CLASS(obj: Pointer): PNMABarCodeClass;

implementation

function NMA_TYPE_BAR_CODE: TGType;
begin
  NMA_TYPE_BAR_CODE := nma_bar_code_get_type;
end;

function NMA_BAR_CODE(obj: Pointer): PNMABarCode;
begin
  Result := PNMABarCode(g_type_check_instance_cast(obj, NMA_TYPE_BAR_CODE));
end;

function NMA_BAR_CODE_CLASS(klass: Pointer): PNMABarCodeClass;
begin
  Result := PNMABarCodeClass(g_type_check_class_cast(klass, NMA_TYPE_BAR_CODE));
end;

function NMA_IS_BAR_CODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_BAR_CODE);
end;

function NMA_IS_BAR_CODE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_BAR_CODE);
end;

function NMA_BAR_CODE_GET_CLASS(obj: Pointer): PNMABarCodeClass;
begin
  Result := PNMABarCodeClass(PGTypeInstance(obj)^.g_class);
end;



end.
