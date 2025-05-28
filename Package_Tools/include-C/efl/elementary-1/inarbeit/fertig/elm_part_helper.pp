
unit elm_part_helper;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_part_helper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_part_helper.h
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
PEina_Tmpstr  = ^Eina_Tmpstr;
PElm_Part_Data  = ^Elm_Part_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_PART_HELPER_H}
{$define _ELM_PART_HELPER_H}
{$include "Elementary.h"}
{$include "elm_priv.h"}
{$include "efl_ui_layout_part_legacy.eo.h"}
{#define ELM_PART_HOOK do  ERR("%s@%p:%s [%d]", efl_class_name_get(pd->obj), pd->obj, pd->part, (int) pd->temp);  while(0) }
type
  PElm_Part_Data = ^TElm_Part_Data;
  TElm_Part_Data = record
      obj : PEo;
      part : PEina_Tmpstr;
    end;

{ Note: this generic implementation can be improved to support part object }
{ caching or something... }
{$endif}

implementation


end.
