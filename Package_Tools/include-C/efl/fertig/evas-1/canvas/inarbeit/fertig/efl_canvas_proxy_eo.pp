
unit efl_canvas_proxy_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_proxy_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_proxy_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Canvas_Proxy  = ^Efl_Canvas_Proxy;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_PROXY_EO_H_}
{$define _EFL_CANVAS_PROXY_EO_H_}
{$ifndef _EFL_CANVAS_PROXY_EO_CLASS_TYPE}
{$define _EFL_CANVAS_PROXY_EO_CLASS_TYPE}
type
  PEfl_Canvas_Proxy = ^TEfl_Canvas_Proxy;
  TEfl_Canvas_Proxy = TEo;
{$endif}
{$ifndef _EFL_CANVAS_PROXY_EO_TYPES}
{$define _EFL_CANVAS_PROXY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Low-level proxy image object.
 *
 * A proxy is a special kind of image containing the pixels from a source
 * object attached to it. It can be used to apply some sort of image
 * transformation to any object (eg. filters, map or zoom).
 *
 * @ingroup Efl_Canvas_Proxy
  }

{ was #define dname def_expr }
function EFL_CANVAS_PROXY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_proxy_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The source object for this proxy.
 *
 * The proxy object will mirror the rendering contents of a given source object
 * in its drawing region, without affecting that source in any way. The source
 * must be another valid @ref Efl_Canvas_Object. Other effects may be applied
 * to the proxy, such as a map (see @ref Efl_Gfx_Mapping) to create a
 * reflection of the original object (for example).
 *
 * Any existing source object will be removed after this call.
 *
 * @note This property should be set as soon as creating a proxy object,
 * otherwise the proxy will do nothing.
 *
 * @warning You cannot set a proxy as another proxy's source.
 *
 * @param[in] obj The object.
 * @param[in] src Source object to use for the proxy.
 *
 * @return Returns @c true in case of success.
 *
 * @ingroup Efl_Canvas_Proxy
  }
function efl_canvas_proxy_source_set(obj:PEo; src:PEfl_Canvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief The source object for this proxy.
 *
 * The proxy object will mirror the rendering contents of a given source object
 * in its drawing region, without affecting that source in any way. The source
 * must be another valid @ref Efl_Canvas_Object. Other effects may be applied
 * to the proxy, such as a map (see @ref Efl_Gfx_Mapping) to create a
 * reflection of the original object (for example).
 *
 * Any existing source object will be removed after this call.
 *
 * @note This property should be set as soon as creating a proxy object,
 * otherwise the proxy will do nothing.
 *
 * @warning You cannot set a proxy as another proxy's source.
 *
 * @param[in] obj The object.
 *
 * @return Source object to use for the proxy.
 *
 * @ingroup Efl_Canvas_Proxy
  }
(* Const before type ignored *)
function efl_canvas_proxy_source_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{*
 * @brief Clip this proxy object with the source object's clipper.
 *
 * Use this if you want to overlay an existing object with its proxy, and apply
 * some sort of transformation on it.
 *
 * @c true means both objects will share the same clip.
 *
 * @param[in] obj The object.
 * @param[in] source_clip Whether @c obj is clipped by the source clipper
 * ($true) or not ($false).
 *
 * @ingroup Efl_Canvas_Proxy
  }
procedure efl_canvas_proxy_source_clip_set(obj:PEo; source_clip:TEina_Bool);cdecl;external;
{*
 * @brief Clip this proxy object with the source object's clipper.
 *
 * Use this if you want to overlay an existing object with its proxy, and apply
 * some sort of transformation on it.
 *
 * @c true means both objects will share the same clip.
 *
 * @param[in] obj The object.
 *
 * @return Whether @c obj is clipped by the source clipper ($true) or not
 * ($false).
 *
 * @ingroup Efl_Canvas_Proxy
  }
(* Const before type ignored *)
function efl_canvas_proxy_source_clip_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Defines whether the events on this object are repeated to the source.
 *
 * If @c source is @c true, it will make events on @c obj to also be repeated
 * for the source object (see @ref efl_canvas_proxy_source_set). Even the
 * @c obj and source geometries are different, the event position will be
 * transformed to the source object's space.
 *
 * If @c source is @c false, events occurring on @c obj will be processed only
 * on it.
 *
 * @param[in] obj The object.
 * @param[in] repeat Whether this object should pass events ($true) or not
 * ($false) to its source.
 *
 * @ingroup Efl_Canvas_Proxy
  }
procedure efl_canvas_proxy_source_events_set(obj:PEo; _repeat:TEina_Bool);cdecl;external;
{*
 * @brief Defines whether the events on this object are repeated to the source.
 *
 * If @c source is @c true, it will make events on @c obj to also be repeated
 * for the source object (see @ref efl_canvas_proxy_source_set). Even the
 * @c obj and source geometries are different, the event position will be
 * transformed to the source object's space.
 *
 * If @c source is @c false, events occurring on @c obj will be processed only
 * on it.
 *
 * @param[in] obj The object.
 *
 * @return Whether this object should pass events ($true) or not ($false) to
 * its source.
 *
 * @ingroup Efl_Canvas_Proxy
  }
(* Const before type ignored *)
function efl_canvas_proxy_source_events_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_PROXY_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_PROXY_CLASS:=efl_canvas_proxy_class_get;
  end;


end.
