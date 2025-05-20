
unit efl_text_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_types_eot.h
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
PEfl_Text_Bidirectional_Type  = ^Efl_Text_Bidirectional_Type;
PEfl_Text_Change_Info  = ^Efl_Text_Change_Info;
PEfl_Text_Change_Type  = ^Efl_Text_Change_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_TYPES_EOT_H_}
{$define _EFL_TEXT_TYPES_EOT_H_}
{$ifndef _EFL_TEXT_TYPES_EOT_TYPES}
{$define _EFL_TEXT_TYPES_EOT_TYPES}
{* Bidirectionaltext type
 *
 * @since 1.23
 *
 * @ingroup Efl_Text_Bidirectional_Type
  }
{*< Natural text type, same as
                                            * neutral
                                            *
                                            * @since 1.23  }
{*< Neutral text type, same as
                                            * natural
                                            *
                                            * @since 1.23  }
{*< Left to right text type
                                    *
                                    * @since 1.23  }
{*< Right to left text type
                                    *
                                    * @since 1.23  }
{*< Inherit text type
                                       *
                                       * @since 1.23  }
type
  PEfl_Text_Bidirectional_Type = ^TEfl_Text_Bidirectional_Type;
  TEfl_Text_Bidirectional_Type =  Longint;
  Const
    EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL = 0;
    EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL = 0;
    EFL_TEXT_BIDIRECTIONAL_TYPE_LTR = 1;
    EFL_TEXT_BIDIRECTIONAL_TYPE_RTL = 2;
    EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT = 3;
;
{* Text change type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Change_Type
  }
{*< the content was inserted.
                                    *
                                    * @since 1.24  }
{*< the content was removed.
                               *
                               * @since 1.24  }
type
  PEfl_Text_Change_Type = ^TEfl_Text_Change_Type;
  TEfl_Text_Change_Type =  Longint;
  Const
    EFL_TEXT_CHANGE_TYPE_INSERT = 0;
    EFL_TEXT_CHANGE_TYPE_REMOVE = 1;
;
{*
 * @brief This structure includes all the information about content changes.
 *
 * It's meant to be used to implement undo/redo.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Change_Info
  }
(* Const before type ignored *)
{*< The content added/removed
                        *
                        * @since 1.24  }
{*< The position where it was added/removed
                    *
                    * @since 1.24  }
{*< The length of content in characters (not bytes, actual
                  * unicode characters)
                  *
                  * @since 1.24  }
{*< Text change type
                              *
                              * @since 1.24  }
{*< @c true if can be merged with the previous one. Used
                        * for example with insertion when something is already
                        * selected
                        *
                        * @since 1.24  }
type
  PEfl_Text_Change_Info = ^TEfl_Text_Change_Info;
  TEfl_Text_Change_Info = record
      content : Pchar;
      position : Tsize_t;
      length : Tsize_t;
      _type : TEfl_Text_Change_Type;
      mergeable : TEina_Bool;
    end;
{$endif}
{$endif}

implementation


end.
