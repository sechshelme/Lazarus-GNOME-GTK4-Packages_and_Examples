unit ecore_con_eet_base_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEcore_Con_Eet_Base = ^TEcore_Con_Eet_Base;
  TEcore_Con_Eet_Base = TEo;

procedure ecore_con_eet(obj: PEcore_Con_Eet_Base; name: pchar; edd: PEet_Data_Descriptor); cdecl; external libecore_con;

// === Konventiert am: 9-6-25 19:22:54 ===


implementation



end.
