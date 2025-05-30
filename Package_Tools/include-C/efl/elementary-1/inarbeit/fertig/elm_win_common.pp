
unit elm_win_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_win_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_win_common.h
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
PElm_Win_Trap  = ^Elm_Win_Trap;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Win_Group
 *
 * @
  }
{*
 * @typedef Elm_Win_Trap
 *
 * Trap can be set with elm_win_trap_set() and will intercept the
 * calls to internal ecore_evas with the same name and parameters. If
 * there is a trap and it returns @c EINA_TRUE then the call will be
 * allowed, otherwise it will be ignored.
 *
 * @since 1.7
  }
type

const
  ELM_WIN_TRAP_VERSION = 1;  
{*< object was just added. The returned pointer will be handled to every other trap call.  }
{*< object will be deleted.  }
{ not in ecore_evas, but nice to trap  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Win_Trap = ^TElm_Win_Trap;
  TElm_Win_Trap = record
      version : dword;
      add : function (o:PEvas_Object):pointer;cdecl;
      del : procedure (data:pointer; o:PEvas_Object);cdecl;
      hide : function (data:pointer; o:PEvas_Object):TEina_Bool;cdecl;
      show : function (data:pointer; o:PEvas_Object):TEina_Bool;cdecl;
      move : function (data:pointer; o:PEvas_Object; x:longint; y:longint):TEina_Bool;cdecl;
      resize : function (data:pointer; o:PEvas_Object; w:longint; h:longint):TEina_Bool;cdecl;
      center : function (data:pointer; o:PEvas_Object; h:TEina_Bool; v:TEina_Bool):TEina_Bool;cdecl;
      lower : function (data:pointer; o:PEvas_Object):TEina_Bool;cdecl;
      raise : function (data:pointer; o:PEvas_Object):TEina_Bool;cdecl;
      activate : function (data:pointer; o:PEvas_Object):TEina_Bool;cdecl;
      alpha_set : function (data:pointer; o:PEvas_Object; alpha:TEina_Bool):TEina_Bool;cdecl;
      aspect_set : function (data:pointer; o:PEvas_Object; aspect:Tdouble):TEina_Bool;cdecl;
      avoid_damage_set : function (data:pointer; o:PEvas_Object; on:TEcore_Evas_Avoid_Damage_Type):TEina_Bool;cdecl;
      borderless_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      demand_attention_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      focus_skip_set : function (data:pointer; o:PEvas_Object; skip:TEina_Bool):TEina_Bool;cdecl;
      fullscreen_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      iconified_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      layer_set : function (data:pointer; o:PEvas_Object; layer:longint):TEina_Bool;cdecl;
      manual_render_set : function (data:pointer; o:PEvas_Object; manual_render:TEina_Bool):TEina_Bool;cdecl;
      maximized_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      modal_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      name_class_set : function (data:pointer; o:PEvas_Object; n:Pchar; c:Pchar):TEina_Bool;cdecl;
      object_cursor_set : function (data:pointer; o:PEvas_Object; obj:PEvas_Object; layer:longint; hot_x:longint; 
                   hot_y:longint):TEina_Bool;cdecl;
      override_set : function (data:pointer; o:PEvas_Object; on:TEina_Bool):TEina_Bool;cdecl;
      rotation_set : function (data:pointer; o:PEvas_Object; rot:longint):TEina_Bool;cdecl;
      rotation_with_resize_set : function (data:pointer; o:PEvas_Object; rot:longint):TEina_Bool;cdecl;
      shaped_set : function (data:pointer; o:PEvas_Object; shaped:TEina_Bool):TEina_Bool;cdecl;
      size_base_set : function (data:pointer; o:PEvas_Object; w:longint; h:longint):TEina_Bool;cdecl;
      size_step_set : function (data:pointer; o:PEvas_Object; w:longint; h:longint):TEina_Bool;cdecl;
      size_min_set : function (data:pointer; o:PEvas_Object; w:longint; h:longint):TEina_Bool;cdecl;
      size_max_set : function (data:pointer; o:PEvas_Object; w:longint; h:longint):TEina_Bool;cdecl;
      sticky_set : function (data:pointer; o:PEvas_Object; sticky:TEina_Bool):TEina_Bool;cdecl;
      title_set : function (data:pointer; o:PEvas_Object; t:Pchar):TEina_Bool;cdecl;
      urgent_set : function (data:pointer; o:PEvas_Object; urgent:TEina_Bool):TEina_Bool;cdecl;
      withdrawn_set : function (data:pointer; o:PEvas_Object; withdrawn:TEina_Bool):TEina_Bool;cdecl;
    end;

{*
 * Sets the trap to be used for internal @c Ecore_Evas management.
 *
 * @param trap the trap to be used or @c NULL to remove traps. Pointer
 *        is not modified or copied, keep it alive.
 * @return @c EINA_TRUE on success, @c EINA_FALSE if there was a
 *         problem, such as invalid version number.
 *
 * @warning this is an advanced feature that you should avoid using.
 *
 * @since 1.7
  }
(* Const before type ignored *)

function elm_win_trap_set(trap:PElm_Win_Trap):TEina_Bool;cdecl;external;
{*
 * @
  }

implementation


end.
