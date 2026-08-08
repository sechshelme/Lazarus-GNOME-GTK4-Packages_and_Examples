unit nma_ws_owe;

interface

uses
  fp_glib2, fp_nma;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef NMA_WS_OWE_H}
{$define NMA_WS_OWE_H}
{$include "nma-version.h"}
type

function nma_ws_owe_get_type:TGType;cdecl;external libnma;
function nma_ws_owe_new(connection:PNMConnection):PNMAWsOwe;cdecl;external libnma;
{$endif}
{ NMA_WS_OWE_H  }

// === Konventiert am: 8-8-26 13:24:24 ===

function NMA_TYPE_WS_OWE : TGType;
function NMA_WS_OWE(obj : Pointer) : PNMAWsOwe;
function NMA_WS_OWE_CLASS(klass : Pointer) : PNMAWsOweClass;
function NMA_IS_WS_OWE(obj : Pointer) : Tgboolean;
function NMA_IS_OWE_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_OWE_GET_CLASS(obj : Pointer) : PNMAWsOweClass;

implementation

function NMA_TYPE_WS_OWE : TGType;
  begin
    NMA_TYPE_WS_OWE:=nma_ws_owe_get_type;
  end;

function NMA_WS_OWE(obj : Pointer) : PNMAWsOwe;
begin
  Result := PNMAWsOwe(g_type_check_instance_cast(obj, NMA_TYPE_WS_OWE));
end;

function NMA_WS_OWE_CLASS(klass : Pointer) : PNMAWsOweClass;
begin
  Result := PNMAWsOweClass(g_type_check_class_cast(klass, NMA_TYPE_WS_OWE));
end;

function NMA_IS_WS_OWE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_OWE);
end;

function NMA_IS_OWE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_OWE);
end;

function NMA_WS_OWE_GET_CLASS(obj : Pointer) : PNMAWsOweClass;
begin
  Result := PNMAWsOweClass(PGTypeInstance(obj)^.g_class);
end;



end.
