{$IFDEF read_interface}


type
  PElm_Interface_Fileselector = ^TElm_Interface_Fileselector;
  TElm_Interface_Fileselector = TEo;

type
  PElm_Fileselector_Mode = ^TElm_Fileselector_Mode;
  TElm_Fileselector_Mode = longint;

const
  ELM_FILESELECTOR_LIST = 0;
  ELM_FILESELECTOR_GRID = 1;
  ELM_FILESELECTOR_LAST = 2;

type
  PElm_Fileselector_Sort = ^TElm_Fileselector_Sort;
  TElm_Fileselector_Sort = longint;

const
  ELM_FILESELECTOR_SORT_BY_FILENAME_ASC = 0;
  ELM_FILESELECTOR_SORT_BY_FILENAME_DESC = 1;
  ELM_FILESELECTOR_SORT_BY_TYPE_ASC = 2;
  ELM_FILESELECTOR_SORT_BY_TYPE_DESC = 3;
  ELM_FILESELECTOR_SORT_BY_SIZE_ASC = 4;
  ELM_FILESELECTOR_SORT_BY_SIZE_DESC = 5;
  ELM_FILESELECTOR_SORT_BY_MODIFIED_ASC = 6;
  ELM_FILESELECTOR_SORT_BY_MODIFIED_DESC = 7;
  ELM_FILESELECTOR_SORT_LAST = 8;

  // === Konventiert am: 27-5-25 16:58:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
