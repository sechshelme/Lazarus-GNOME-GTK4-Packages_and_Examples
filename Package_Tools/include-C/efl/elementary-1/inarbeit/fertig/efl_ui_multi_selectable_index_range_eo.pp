
unit efl_ui_multi_selectable_index_range_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_multi_selectable_index_range_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_multi_selectable_index_range_eo.h
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
PEfl_Ui_Multi_Selectable_Index_Range  = ^Efl_Ui_Multi_Selectable_Index_Range;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_H_}
{$define _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_H_}
{$ifndef _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_CLASS_TYPE}
{$define _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_CLASS_TYPE}
type
  PEfl_Ui_Multi_Selectable_Index_Range = ^TEfl_Ui_Multi_Selectable_Index_Range;
  TEfl_Ui_Multi_Selectable_Index_Range = TEo;
{$endif}
{$ifndef _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_TYPES}
{$define _EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_EO_TYPES}
{$endif}
{*
 * @brief Interface for getting access to a range of selected items through
 * their indices.
 *
 * The implementor of this interface provides the possibility to select
 * multiple @ref Efl_Ui_Selectable objects. If not, only
 * @ref Efl_Ui_Single_Selectable should be implemented. A widget can only
 * provide either this interface or @ref Efl_Ui_Multi_Selectable_Object_Range,
 * but not both.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable_Index_Range
  }

{ was #define dname def_expr }
function EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_multi_selectable_index_range_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Gets an iterator over the indices of all the selected children.
 *
 * @param[in] obj The object.
 *
 * @return The iterator gives the indices of the selected children. It is valid
 * until any change is made to the selection state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable_Index_Range
  }
function efl_ui_multi_selectable_selected_ndx_iterator_new(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Gets an iterator over the indices of all the unselected children.
 *
 * @param[in] obj The object.
 *
 * @return The iterator gives the indices of the unselected children. It is
 * valid until any change is made to the selection state.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable_Index_Range
  }
function efl_ui_multi_selectable_unselected_ndx_iterator_new(obj:PEo):PEina_Iterator;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Select a range of @ref Efl_Ui_Selectable objects using their indices
 * inside the container.
 *
 * This will select the range of @ref Efl_Ui_Selectable objects from @c a to
 * @c b or from @c b to @c a depending on which one comes first. If @c a or
 * @c b are not part of the widget, an error is returned, and no change is
 * applied. @c NULL is not allowed as either of the parameters.
 *
 * @param[in] obj The object.
 * @param[in] a One side of the range.
 * @param[in] b The other side of the range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable_Index_Range
  }
procedure efl_ui_multi_selectable_ndx_range_select(obj:PEo; a:dword; b:dword);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Unselect a range of @ref Efl_Ui_Selectable objects using their
 * indices inside the container.
 *
 * This will unselect the range of @ref Efl_Ui_Selectable objects from @c a to
 * @c b or from @c b to @c a depending on which one comes first. If @c a or
 * @c b are not part of the widget, an error is returned, and no change is
 * applied. @c NULL is not allowed as either of the parameters. Both of the
 * passed values will also be unselected.
 *
 * @param[in] obj The object.
 * @param[in] a One side of the range.
 * @param[in] b The other side of the range.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Multi_Selectable_Index_Range
  }

procedure efl_ui_multi_selectable_ndx_range_unselect(obj:PEo; a:dword; b:dword);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE:=efl_ui_multi_selectable_index_range_interface_get;
  end;


end.
