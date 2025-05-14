unit Evas_Eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Vg_Node = ^TEfl_Canvas_Vg_Node;
  TEfl_Canvas_Vg_Node = TEo;

type
  TEfl_Canvas_Animation_Player_Event_Running = record
    progress: double;
  end;
  PEfl_Canvas_Animation_Player_Event_Running = ^TEfl_Canvas_Animation_Player_Event_Running;

  TEfl_Canvas_Object_Animation_Event = record
    event_desc: PEfl_Event_Description;
  end;
  PEfl_Canvas_Object_Animation_Event = ^TEfl_Canvas_Object_Animation_Event;


  // === Konventiert am: 12-5-25 19:12:44 ===


implementation



end.
