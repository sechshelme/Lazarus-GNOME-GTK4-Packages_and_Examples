
unit elm_map_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_map_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_map_legacy.h
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
PElm_Map_Zoom_Mode  = ^Elm_Map_Zoom_Mode;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
{*< Zoom controlled manually by
                                 * elm_map_zoom_set(). It's set by default.  }
{*< Zoom until map fits inside the scroll frame
                               * with no pixels outside this area.  }
{*< Zoom until map fills scroll, ensuring no
                                * pixels are left unfilled.  }
{*< Sentinel value to indicate last enum field during
                          * iteration  }
type
  PElm_Map_Zoom_Mode = ^TElm_Map_Zoom_Mode;
  TElm_Map_Zoom_Mode =  Longint;
  Const
    ELM_MAP_ZOOM_MODE_MANUAL = 0;
    ELM_MAP_ZOOM_MODE_AUTO_FIT = 1;
    ELM_MAP_ZOOM_MODE_AUTO_FILL = 2;
    ELM_MAP_ZOOM_MODE_LAST = 3;
;
{*
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }

function elm_map_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
procedure elm_map_zoom_set(obj:PEvas_Object; zoom:longint);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_zoom_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
procedure elm_map_zoom_mode_set(obj:PEvas_Object; mode:TElm_Map_Zoom_Mode);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_zoom_mode_get(obj:PEvas_Object):TElm_Map_Zoom_Mode;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
procedure elm_map_wheel_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_wheel_disabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
procedure elm_map_paused_set(obj:PEvas_Object; paused:TEina_Bool);cdecl;external;
{*
 * @brief Widget is broken due to on-line service API breaks
 * Widget is broken due to on-line service API breaks
 * @ingroup Elm_Map_Group
  }
(* Const before type ignored *)
function elm_map_paused_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{$include "elm_map_eo.legacy.h"}

implementation


end.
