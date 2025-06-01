
unit elm_interface_fileselector_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_interface_fileselector_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_interface_fileselector_eo_legacy.h
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
PElm_Fileselector_Mode  = ^Elm_Fileselector_Mode;
PElm_Fileselector_Sort  = ^Elm_Fileselector_Sort;
PElm_Interface_Fileselector  = ^Elm_Interface_Fileselector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_INTERFACE_FILESELECTOR_EO_LEGACY_H_}
{$define _ELM_INTERFACE_FILESELECTOR_EO_LEGACY_H_}
{$ifndef _ELM_INTERFACE_FILESELECTOR_EO_CLASS_TYPE}
{$define _ELM_INTERFACE_FILESELECTOR_EO_CLASS_TYPE}
type
  PElm_Interface_Fileselector = ^TElm_Interface_Fileselector;
  TElm_Interface_Fileselector = TEo;
{$endif}
{$ifndef _ELM_INTERFACE_FILESELECTOR_EO_TYPES}
{$define _ELM_INTERFACE_FILESELECTOR_EO_TYPES}
{* Defines how a file selector widget is to layout its contents (file system
 * entries).
 *
 * @ingroup Elm_Fileselector
  }
{*< Layout as a list.  }
{*< Layout as a grid.  }
{*< Sentinel value to indicate last enum field during
                         * iteration  }
type
  PElm_Fileselector_Mode = ^TElm_Fileselector_Mode;
  TElm_Fileselector_Mode =  Longint;
  Const
    ELM_FILESELECTOR_LIST = 0;
    ELM_FILESELECTOR_GRID = 1;
    ELM_FILESELECTOR_LAST = 2;
;
{* Fileselector sorting modes
 *
 * @ingroup Elm_Fileselector
  }
{*< Alphabetical sort by ascending
                                              * filename, default  }
{*< Alphabetical sorting by
                                           * descending filename  }
{*< Sort by file type  }
{*< Sort by file type description  }
{*< Sort by ascending file size  }
{*< Sort by descending file size  }
{*< Sort by ascending modified date  }
{*< Sort by descending modified date
                                            }
{*< Sentinel value to indicate last enum field
                              * during iteration  }
type
  PElm_Fileselector_Sort = ^TElm_Fileselector_Sort;
  TElm_Fileselector_Sort =  Longint;
  Const
    ELM_FILESELECTOR_SORT_BY_FILENAME_ASC = 0;
    ELM_FILESELECTOR_SORT_BY_FILENAME_DESC = 1;
    ELM_FILESELECTOR_SORT_BY_TYPE_ASC = 2;
    ELM_FILESELECTOR_SORT_BY_TYPE_DESC = 3;
    ELM_FILESELECTOR_SORT_BY_SIZE_ASC = 4;
    ELM_FILESELECTOR_SORT_BY_SIZE_DESC = 5;
    ELM_FILESELECTOR_SORT_BY_MODIFIED_ASC = 6;
    ELM_FILESELECTOR_SORT_BY_MODIFIED_DESC = 7;
    ELM_FILESELECTOR_SORT_LAST = 8;
;
{$endif}
{$endif}

implementation


end.
