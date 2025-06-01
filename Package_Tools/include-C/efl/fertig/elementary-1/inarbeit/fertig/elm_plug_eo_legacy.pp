
unit elm_plug_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_plug_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_plug_eo_legacy.h
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
Pchar  = ^char;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PElm_Plug  = ^Elm_Plug;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PLUG_EO_LEGACY_H_}
{$define _ELM_PLUG_EO_LEGACY_H_}
{$ifndef _ELM_PLUG_EO_CLASS_TYPE}
{$define _ELM_PLUG_EO_CLASS_TYPE}
type
  PElm_Plug = ^TElm_Plug;
  TElm_Plug = TEo;
{$endif}
{$ifndef _ELM_PLUG_EO_TYPES}
{$define _ELM_PLUG_EO_TYPES}
{$endif}
{*
 * @brief Get the basic Evas_Image object from this object (widget).
 *
 * This function allows one to get the underlying Evas object of type Image
 * from this elementary widget. It can be useful to do things like get the
 * pixel data, save the image to a file, etc.
 *
 * @note Be careful to not manipulate it, as it is under control of elementary.
 *
 * @param[in] obj The object.
 *
 * @return The inlined image object or @c null.
 *
 * @ingroup Elm_Plug_Group
  }
(* Const before type ignored *)

function elm_plug_image_object_get(obj:PElm_Plug):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Connect a plug widget to service provided by socket image.
 *
 * @param[in] obj The object.
 * @param[in] svcname The service name to connect to set up by the socket.
 * @param[in] svcnum The service number to connect to (set up by socket).
 * @param[in] svcsys Boolean to set if the service is a system one or not (set
 * up by socket).
 *
 * @return @c true on success, @c false on error.
 *
 * @ingroup Elm_Plug_Group
  }
(* Const before type ignored *)
function elm_plug_connect(obj:PElm_Plug; svcname:Pchar; svcnum:longint; svcsys:TEina_Bool):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
