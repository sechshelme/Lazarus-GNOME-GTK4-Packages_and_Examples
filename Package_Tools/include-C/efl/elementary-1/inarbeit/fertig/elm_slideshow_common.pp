
unit elm_slideshow_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_slideshow_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_slideshow_common.h
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
PElm_Slideshow_Item_Class  = ^Elm_Slideshow_Item_Class;
PEvas_Object  = ^Evas_Object;
PSlideshowItemGetFunc  = ^SlideshowItemGetFunc;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Slideshow
 *
 * @
  }
type
  PSlideshowItemGetFunc = ^TSlideshowItemGetFunc;
  TSlideshowItemGetFunc = function (data:pointer; obj:PEvas_Object):PEvas_Object;cdecl;
{*< Image fetching class function for slideshow item classes.  }

  TSlideshowItemDelFunc = procedure (data:pointer; obj:PEvas_Object);cdecl;
{*< Deletion class function for slideshow item classes.  }
{*
 * Slideshow item class definition struct
  }
{*
 * Class functions for slideshow item classes.
  }
{*
 * @struct _Elm_Slideshow_Item_Class
 *
 * Slideshow item class definition. See @ref Slideshow_Items for
 * field details.
  }
  PElm_Slideshow_Item_Class = ^TElm_Slideshow_Item_Class;
  TElm_Slideshow_Item_Class = record
      func : record
          get : TSlideshowItemGetFunc;cdecl;
          del : TSlideshowItemDelFunc;
        end;
    end;

{*< member definitions of #Elm_Slideshow_Item_Class  }
{*
 * @
  }

implementation


end.
