unit elm_slideshow_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSlideshowItemGetFunc = ^TSlideshowItemGetFunc;
  TSlideshowItemGetFunc = function(data: pointer; obj: PEvas_Object): PEvas_Object; cdecl;

  TSlideshowItemDelFunc = procedure(data: pointer; obj: PEvas_Object); cdecl;

  TElm_Slideshow_Item_Class = record
    func: record
      get: TSlideshowItemGetFunc;
      del: TSlideshowItemDelFunc;
      end;
  end;
  PElm_Slideshow_Item_Class = ^TElm_Slideshow_Item_Class;

  // === Konventiert am: 27-5-25 17:53:55 ===


implementation



end.
