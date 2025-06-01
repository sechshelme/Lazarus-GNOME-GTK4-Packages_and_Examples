
unit elm_grid_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_grid_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_grid_eo_legacy.h
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
PEina_List  = ^Eina_List;
PElm_Grid  = ^Elm_Grid;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_GRID_EO_LEGACY_H_}
{$define _ELM_GRID_EO_LEGACY_H_}
{$ifndef _ELM_GRID_EO_CLASS_TYPE}
{$define _ELM_GRID_EO_CLASS_TYPE}
type
  PElm_Grid = ^TElm_Grid;
  TElm_Grid = TEo;
{$endif}
{$ifndef _ELM_GRID_EO_TYPES}
{$define _ELM_GRID_EO_TYPES}
{$endif}
{*
 * @brief Set the virtual size of the grid
 *
 * @param[in] obj The object.
 * @param[in] w The virtual width of the grid
 * @param[in] h The virtual height of the grid
 *
 * @ingroup Elm_Grid_Group
  }

procedure elm_grid_size_set(obj:PElm_Grid; w:longint; h:longint);cdecl;external;
{*
 * @brief Get the virtual size of the grid
 *
 * @param[in] obj The object.
 * @param[out] w The virtual width of the grid
 * @param[out] h The virtual height of the grid
 *
 * @ingroup Elm_Grid_Group
  }
(* Const before type ignored *)
procedure elm_grid_size_get(obj:PElm_Grid; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Get the list of the children for the grid.
 *
 * @note This is a duplicate of the list kept by the grid internally. It's up
 * to the user to destroy it when it no longer needs it. It's possible to
 * remove objects from the grid when walking this list, but these removals
 * won't be reflected on it.
 *
 * @param[in] obj The object.
 *
 * @return List of children
 *
 * @ingroup Elm_Grid_Group
  }
(* Const before type ignored *)
function elm_grid_children_get(obj:PElm_Grid):PEina_List;cdecl;external;
{*
 * @brief Faster way to remove all child objects from a grid object.
 *
 * @param[in] obj The object.
 * @param[in] clear If @c true, it will delete just removed children
 *
 * @ingroup Elm_Grid_Group
  }
procedure elm_grid_clear(obj:PElm_Grid; clear:TEina_Bool);cdecl;external;
{*
 * @brief Unpack a child from a grid object
 *
 * @param[in] obj The object.
 * @param[in] subobj The child to unpack
 *
 * @ingroup Elm_Grid_Group
  }
procedure elm_grid_unpack(obj:PElm_Grid; subobj:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Pack child at given position and size
 *
 * @param[in] obj The object.
 * @param[in] subobj The child to pack.
 * @param[in] x The virtual x coord at which to pack it.
 * @param[in] y The virtual y coord at which to pack it.
 * @param[in] w The virtual width at which to pack it.
 * @param[in] h The virtual height at which to pack it.
 *
 * @ingroup Elm_Grid_Group
  }
procedure elm_grid_pack(obj:PElm_Grid; subobj:PEfl_Canvas_Object; x:longint; y:longint; w:longint; 
            h:longint);cdecl;external;
{$endif}

implementation


end.
