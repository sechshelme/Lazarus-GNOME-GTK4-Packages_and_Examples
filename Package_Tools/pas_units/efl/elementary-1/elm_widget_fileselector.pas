unit elm_widget_fileselector;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Fileselector_Data = ^TElm_Fileselector_Data;
  TElm_Fileselector_Data = record
  end;

  Tsel_data = record
    fs: PEvas_Object;
    model: PEfl_Model;
    selected: PEfl_Model;
  end;
  Psel_data = ^Tsel_data;

  PListing_Request = ^TListing_Request;
  TListing_Request = record
  end;

type
  PElm_Fileselector_Item_Data = ^TElm_Fileselector_Item_Data;
  TElm_Fileselector_Item_Data = record
  end;

type
  PElm_Fileselector_Type = ^TElm_Fileselector_Type;
  TElm_Fileselector_Type = longint;

const
  ELM_DIRECTORY = 0;
  ELM_FILE_IMAGE = 1;
  ELM_FILE_UNKNOW = 2;
  ELM_FILE_LAST = 3;

type
  PElm_Fileselector_Filter_Type = ^TElm_Fileselector_Filter_Type;
  TElm_Fileselector_Filter_Type = longint;

const
  ELM_FILESELECTOR_MIME_FILTER = 0;
  ELM_FILESELECTOR_CUSTOM_FILTER = 1;
  ELM_FILESELECTOR_FILTER_LAST = 2;

type
  TElm_Fileselector_Custom_Filter = record
    func: TElm_Fileselector_Filter_Func;
    data: pointer;
  end;
  PElm_Fileselector_Custom_Filter = ^TElm_Fileselector_Custom_Filter;

  TElm_Fileselector_Filter = record
    filter_name: pchar;
    sd: PElm_Fileselector_Data;
    filter: record
      case longint of
        0: (mime_types: ^pchar);
        1: (custom: PElm_Fileselector_Custom_Filter);
      end;
    filter_type: TElm_Fileselector_Filter_Type;
  end;
  PElm_Fileselector_Filter = ^TElm_Fileselector_Filter;


  // === Konventiert am: 28-5-25 19:25:22 ===


implementation


end.
