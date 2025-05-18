unit efl_class_eo;

interface

uses
  ctypes, efl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CLASS_EO_H_}
{$define _EFL_CLASS_EO_H_}
{$ifndef _EFL_CLASS_EO_CLASS_TYPE}
{$define _EFL_CLASS_EO_CLASS_TYPE}
type
  PEfl_Class = ^TEfl_Class;
  TEfl_Class = TEo;
{$endif}
{$ifndef _EFL_CLASS_EO_TYPES}
{$define _EFL_CLASS_EO_TYPES}
{$endif}
{* Abstract Efl class
 *
 * @since 1.22
 *
 * @ingroup Efl_Class
  }

{ was #define dname def_expr }
function EFL_CLASS_CLASS : longint; { return type might be wrong }

function efl_class_class_get:PEfl_Class;cdecl;external libeo;
{$endif}

// === Konventiert am: 18-5-25 13:19:01 ===


implementation


{ was #define dname def_expr }
function EFL_CLASS_CLASS : longint; { return type might be wrong }
  begin
    EFL_CLASS_CLASS:=efl_class_class_get;
  end;


end.
