
unit efl_canvas_layout_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_types_eot.h
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
PEfl_Canvas_Layout_Part_Type  = ^Efl_Canvas_Layout_Part_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_TYPES_EOT_H_}
{$define _EFL_CANVAS_LAYOUT_TYPES_EOT_H_}
{$ifndef _EFL_CANVAS_LAYOUT_TYPES_EOT_TYPES}
{$define _EFL_CANVAS_LAYOUT_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Type of a part in an Efl.Canvas.Layout object (edje object).
 *
 * @ingroup Efl_Canvas_Layout_Part_Type
  }
{*< None type value, indicates invalid
                                         * parts.  }
{*< Rectangle type value.  }
{*< Text type value.  }
{*< Image type value.  }
{*< Swallow  type value.  }
{*< Text block type value.  }
{*< Gradient type value.  }
{*< Group type value.  }
{*< Box type value.  }
{*< Table type value.  }
{*< External type value.  }
{*< Proxy type value.  }
{*< Spacer type value
                                            *
                                            * @since 1.7.  }
{*< Snapshot
                                              *
                                              * @since 1.16.  }
{*< Vector
                                            *
                                            * @since 1.18.  }
{*< Last type value.  }
type
  PEfl_Canvas_Layout_Part_Type = ^TEfl_Canvas_Layout_Part_Type;
  TEfl_Canvas_Layout_Part_Type =  Longint;
  Const
    EFL_CANVAS_LAYOUT_PART_TYPE_NONE = 0;
    EFL_CANVAS_LAYOUT_PART_TYPE_RECTANGLE = 1;
    EFL_CANVAS_LAYOUT_PART_TYPE_TEXT = 2;
    EFL_CANVAS_LAYOUT_PART_TYPE_IMAGE = 3;
    EFL_CANVAS_LAYOUT_PART_TYPE_SWALLOW = 4;
    EFL_CANVAS_LAYOUT_PART_TYPE_TEXTBLOCK = 5;
    EFL_CANVAS_LAYOUT_PART_TYPE_GRADIENT = 6;
    EFL_CANVAS_LAYOUT_PART_TYPE_GROUP = 7;
    EFL_CANVAS_LAYOUT_PART_TYPE_BOX = 8;
    EFL_CANVAS_LAYOUT_PART_TYPE_TABLE = 9;
    EFL_CANVAS_LAYOUT_PART_TYPE_EXTERNAL = 10;
    EFL_CANVAS_LAYOUT_PART_TYPE_PROXY = 11;
    EFL_CANVAS_LAYOUT_PART_TYPE_SPACER = 12;
    EFL_CANVAS_LAYOUT_PART_TYPE_SNAPSHOT = 16;
    EFL_CANVAS_LAYOUT_PART_TYPE_VECTOR = 17;
    EFL_CANVAS_LAYOUT_PART_TYPE_LAST = 18;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation


end.
