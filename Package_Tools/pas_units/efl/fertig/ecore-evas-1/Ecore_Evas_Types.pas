unit Ecore_Evas_Types;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEcore_X_Window = ^TEcore_X_Window;
  TEcore_X_Window = dword;

  PEcore_X_Pixmap = ^TEcore_X_Pixmap;
  TEcore_X_Pixmap = dword;

  PEcore_X_Atom = ^TEcore_X_Atom;
  TEcore_X_Atom = dword;

  TEcore_X_Icon = record
    width: dword;
    height: dword;
    data: Pdword;
  end;
  PEcore_X_Icon = ^TEcore_X_Icon;

type
  TEcore_DirectFB_Window = record
  end;
  PEcore_DirectFB_Window = ^TEcore_DirectFB_Window;

  TEcore_WinCE_Window=record
      end;
  PEcore_WinCE_Window=^TEcore_WinCE_Window;

  TEcore_Evas_Event_Cb = procedure(ee: PEcore_Evas); cdecl;
  TEcore_Evas_Focus_Device_Event_Cb = procedure(ee: PEcore_Evas; seat: PEo); cdecl;
  TEcore_Evas_Mouse_IO_Cb = procedure(ee: PEcore_Evas; mouse: PEo); cdecl;

  TEcore_Wl_Window = record
  end;
  PEcore_Wl_Window = ^TEcore_Wl_Window;

  TEcore_Getopt=record
      end;
  PEcore_Getopt=^TEcore_Getopt;

  TEcore_Getopt_Desc=record
      end;
  PEcore_Getopt_Desc=^TEcore_Getopt_Desc;

const
  _ECORE_GETOPT_PREDEF = 1;
  _ECORE_GETOPT_DESC_PREDEF = 1;

type
  TEcore_Getopt_Value = record
  end;
  PEcore_Getopt_Value = ^TEcore_Getopt_Value;

const
  _ECORE_GETOPT_VALUE_PREDEF = 1;

type
  PEcore_Window = ^TEcore_Window;
  TEcore_Window = Tuintptr_t;

const
  _ECORE_WINDOW_PREDEF = 1;

  // === Konventiert am: 21-5-25 19:11:55 ===


implementation



end.
