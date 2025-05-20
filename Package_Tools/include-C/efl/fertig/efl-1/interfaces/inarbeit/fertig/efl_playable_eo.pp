
unit efl_playable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_playable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_playable_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Playable  = ^Efl_Playable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PLAYABLE_EO_H_}
{$define _EFL_PLAYABLE_EO_H_}
{$ifndef _EFL_PLAYABLE_EO_CLASS_TYPE}
{$define _EFL_PLAYABLE_EO_CLASS_TYPE}
type
  PEfl_Playable = ^TEfl_Playable;
  TEfl_Playable = TEo;
{$endif}
{$ifndef _EFL_PLAYABLE_EO_TYPES}
{$define _EFL_PLAYABLE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl media playable interface
 *
 * @ingroup Efl_Playable
  }

{ was #define dname def_expr }
function EFL_PLAYABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_playable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Get the length of play for the media file.
 *
 * @param[in] obj The object.
 *
 * @return The length of the stream in seconds.
 *
 * @ingroup Efl_Playable
  }
(* Const before type ignored *)
function efl_playable_length_get(obj:PEo):Tdouble;cdecl;external;
(* Const before type ignored *)
function efl_playable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Get whether the media file is seekable.
 *
 * @param[in] obj The object.
 *
 * @return @c true if seekable.
 *
 * @ingroup Efl_Playable
  }
(* Const before type ignored *)
function efl_playable_seekable_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_PLAYABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PLAYABLE_INTERFACE:=efl_playable_interface_get;
  end;


end.
