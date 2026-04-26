unit intl;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ i18n stuff for vips. Deprecated in favour of glib/gi18n.h.
  }
{$ifndef VIPS_INTL_H}
{$define VIPS_INTL_H}
{$ifdef ENABLE_NLS}
{$include <glib/gi18n.h>}
{$else}
{!ENABLE_NLS }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _(_String : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function N_(_String : longint) : longint;

{$endif}
{ ENABLE_NLS  }
{$endif}
{ VIPS_INTL_H  }

// === Konventiert am: 26-4-26 16:12:41 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _(_String : longint) : longint;
begin
  _:=_String;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function N_(_String : longint) : longint;
begin
  N_:=_String;
end;


end.
