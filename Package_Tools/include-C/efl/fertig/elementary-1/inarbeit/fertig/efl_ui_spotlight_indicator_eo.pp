
unit efl_ui_spotlight_indicator_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spotlight_indicator_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spotlight_indicator_eo.h
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
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Ui_Spotlight_Container  = ^Efl_Ui_Spotlight_Container;
PEfl_Ui_Spotlight_Indicator  = ^Efl_Ui_Spotlight_Indicator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SPOTLIGHT_INDICATOR_EO_H_}
{$define _EFL_UI_SPOTLIGHT_INDICATOR_EO_H_}
{$ifndef _EFL_UI_SPOTLIGHT_INDICATOR_EO_CLASS_TYPE}
{$define _EFL_UI_SPOTLIGHT_INDICATOR_EO_CLASS_TYPE}
type
  PEfl_Ui_Spotlight_Indicator = ^TEfl_Ui_Spotlight_Indicator;
  TEfl_Ui_Spotlight_Indicator = TEo;
{$endif}
{$ifndef _EFL_UI_SPOTLIGHT_INDICATOR_EO_TYPES}
{$define _EFL_UI_SPOTLIGHT_INDICATOR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Object used by @ref Efl_Ui_Spotlight_Container to render an
 * indication of the active widgets' position among the rest of the container's
 * widgets.
 *
 * An example would be Android's little dots in the home screen.
 *
 * @ingroup Efl_Ui_Spotlight_Indicator
  }

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_INDICATOR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_spotlight_indicator_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This method is called the first time an
 * @ref Efl_Ui_Spotlight_Indicator is assigned to an
 * @ref Efl_Ui_Spotlight_Container, binding them together.
 *
 * This call can be used to setup the indicator part of the @c spotlight.
 *
 * The Active View of the container (if there is any) will be informed to the
 * indicator by a later call to
 * @ref efl_ui_spotlight_indicator_position_update.
 *
 * @param[in] obj The object.
 * @param[in] spotlight The container to bind this indicator to.
 *
 * @ingroup Efl_Ui_Spotlight_Indicator
  }
procedure efl_ui_spotlight_indicator_bind(obj:PEo; spotlight:PEfl_Ui_Spotlight_Container);cdecl;external;
{*
 * @brief A @c subobj has been added at position @c index in the bound
 * container.
 *
 * @param[in] obj The object.
 * @param[in] subobj The new object that has been added to the container.
 * @param[in] index The index of the new object in the container's list.
 *
 * @ingroup Efl_Ui_Spotlight_Indicator
  }
procedure efl_ui_spotlight_indicator_content_add(obj:PEo; subobj:PEfl_Gfx_Entity; index:longint);cdecl;external;
{*
 * @brief The @c subobj at position @c index in the bound container has been
 * removed.
 *
 * @param[in] obj The object.
 * @param[in] subobj The object being removed from the container.
 * @param[in] index The index this object had in the container's list.
 *
 * @ingroup Efl_Ui_Spotlight_Indicator
  }
procedure efl_ui_spotlight_indicator_content_del(obj:PEo; subobj:PEfl_Gfx_Entity; index:longint);cdecl;external;
{*
 * @brief This method tells the indicator that
 * @ref efl_ui_spotlight_active_element_get has changed in the bound container.
 * @c position ranges from -1 to the number of views in the bound container
 * (@Efl.Container.content_count). Notice this allows moving to a position
 * before the first view or past the last view, which might happen if the view
 * is thumb-scrolled out-of-bounds. Indicators can choose to render these
 * out-of-bounds positions or not.
 *
 * Fractional values indicate positions in-between two views and should be
 * respected to obtain smooth transitions.
 *
 * @param[in] obj The object.
 * @param[in] position The index of the active view, or a value in-between
 * views if a transition is currently playing.
 *
 * @ingroup Efl_Ui_Spotlight_Indicator
  }
procedure efl_ui_spotlight_indicator_position_update(obj:PEo; position:Tdouble);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_INDICATOR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SPOTLIGHT_INDICATOR_CLASS:=efl_ui_spotlight_indicator_class_get;
  end;


end.
