unit efl_object_override_eo;

interface

uses
  ctypes, efl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_OBJECT_OVERRIDE_EO_H_}
{$define _EFL_OBJECT_OVERRIDE_EO_H_}
{$ifndef _EFL_OBJECT_OVERRIDE_EO_CLASS_TYPE}
{$define _EFL_OBJECT_OVERRIDE_EO_CLASS_TYPE}
type
  PEfl_Object_Override = ^TEfl_Object_Override;
  TEfl_Object_Override = TEo;
{$endif}
{$ifndef _EFL_OBJECT_OVERRIDE_EO_TYPES}
{$define _EFL_OBJECT_OVERRIDE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A special class to pass to #eo_super() when using #eo_override()
 *
 * Shouldn't be inherited from or anything of this sort.
 *
 * @ingroup Efl_Object_Override
  }

{ was #define dname def_expr }
function EFL_OBJECT_OVERRIDE_CLASS : longint; { return type might be wrong }

function efl_object_override_class_get:PEfl_Class;cdecl;external libeo;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

// === Konventiert am: 18-5-25 13:19:09 ===


implementation


{ was #define dname def_expr }
function EFL_OBJECT_OVERRIDE_CLASS : longint; { return type might be wrong }
  begin
    EFL_OBJECT_OVERRIDE_CLASS:=efl_object_override_class_get;
  end;


end.
