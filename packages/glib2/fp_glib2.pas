unit fp_glib2;

interface

uses
  {$ifdef linux}
  x, xlib,
  {$endif}
//  Math, // wegen "division_by_zero" in den clibs
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$include ../gnome_lib_const.inc}

  {$DEFINE read_interface}

  {$include glibconfig.inc}

  {$include fp_glib2_includes.inc}
  {$include fp_gobject2_includes.inc}
  {$include fp_gio2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}

{$include glibconfig.inc}

{$include fp_glib2_includes.inc}
{$include fp_gobject2_includes.inc}
{$include fp_gio2_includes.inc}
{$UNDEF read_implementation}

// wegen "division_by_zero" in den clibs
//{$IFDEF Linux}
{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
               Ldmxcsr w2
  end;
end;
//{$ENDIF}
{$ENDIF}

begin
//  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
//{$IFDEF Linux}
{$IF defined(CPUX86) or defined(CPUX64)}
    SetMXCSR;
//{$ENDIF}
{$ENDIF}
end.
