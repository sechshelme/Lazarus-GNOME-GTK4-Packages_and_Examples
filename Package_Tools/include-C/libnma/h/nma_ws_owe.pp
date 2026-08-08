
unit nma_ws_owe;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws_owe.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws_owe.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PNMAWsOwe  = ^NMAWsOwe;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef NMA_WS_OWE_H}
{$define NMA_WS_OWE_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS_OWE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_OWE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_OWE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE_GET_CLASS(obj : longint) : longint;

function nma_ws_owe_get_type:TGType;cdecl;external;
function nma_ws_owe_new(connection:PNMConnection):PNMAWsOwe;cdecl;external;
{$endif}
{ NMA_WS_OWE_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS_OWE : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS_OWE:=nma_ws_owe_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE(obj : longint) : longint;
begin
  NMA_WS_OWE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS_OWE,NMAWsOwe);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE_CLASS(klass : longint) : longint;
begin
  NMA_WS_OWE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WS_OWE,NMAWsOweClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_OWE(obj : longint) : longint;
begin
  NMA_IS_WS_OWE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_OWE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_OWE_CLASS(klass : longint) : longint;
begin
  NMA_IS_OWE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WS_OWE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_OWE_GET_CLASS(obj : longint) : longint;
begin
  NMA_WS_OWE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WS_OWE,NMAWsOweClass);
end;


end.
