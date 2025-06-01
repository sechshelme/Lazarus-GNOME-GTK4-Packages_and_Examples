
unit elm_code_widget_selection;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_widget_selection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_widget_selection.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_WIDGET_SELECTION_H_}
{$define ELM_CODE_WIDGET_SELECTION_H_}
{ C++ extern C conditionnal removed }
{*
 * @brief Selection handling functions.
 * @defgroup Managing the complexities of selecting text across separate lines.
 *
 * @
 *
 * Functions for selection handling
 *
  }
{*
 * @brief Start the selection of widget contents.
 *
 * @param[in] widget @c The elm_widget object.
 * @param[in] line @c The line index of the widget.
 * @param[in] widget @c The column index of the widget.
 *
 * @return None
 *
  }

procedure elm_code_widget_selection_start(widget:PEvas_Object; line:dword; col:dword);cdecl;external;
{*
 * @brief End the selection of widget contents.
 *
 * @param[in] widget @c The elm_widget object.
 * @param[in] line @c The line index of the widget.
 * @param[in] widget @c The column index of the widget.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_end(widget:PEvas_Object; line:dword; col:dword);cdecl;external;
{*
 * @brief Clear selection of widget contents.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_clear(widget:PEvas_Object);cdecl;external;
{*
 * @brief Delete the selected contents of widget contents.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_delete(widget:PEvas_Object);cdecl;external;
{*
 * @brief Select the entire line from the widget.
 *
 * @param[in] widget @c The elm_widget object.
 * @param[in] line @c The line index of the widget.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_select_line(widget:PEvas_Object; line:dword);cdecl;external;
{*
 * @brief Select a word from the widget.
 *
 * @param[in] widget @c The elm_widget object.
 * @param[in] line @c The line index of the widget.
 * @param[in] col @c The column index of the widget.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_select_word(widget:PEvas_Object; line:dword; col:dword);cdecl;external;
{*
 * @brief Get the selected widget content.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return char pointer to text contents.
 *
  }
function elm_code_widget_selection_text_get(widget:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Cut the selected widget content.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_cut(widget:PEvas_Object);cdecl;external;
{*
 * @brief Copy the selected widget content to clipboard.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_copy(widget:PEvas_Object);cdecl;external;
{*
 * @brief Paste the copied widget content from clipboard.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_paste(widget:PEvas_Object);cdecl;external;
{*
 * @brief check if the widget selection is empty.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return true is empty, false otherwise
 *
  }
function elm_code_widget_selection_is_empty(widget:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Select the entire widget contents.
 *
 * @param[in] widget @c The elm_widget object.
 *
 * @return None
 *
  }
procedure elm_code_widget_selection_select_all(widget:PEvas_Object);cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_WIDGET_SELECTION_H_  }

implementation


end.
