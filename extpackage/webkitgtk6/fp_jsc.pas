unit fp_JSC;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libjavascriptcoregtk = 'javascriptcoregtk-6.0 ';
  {$ENDIF}

  {$IFDEF Windows}
  libjavascriptcoregtk = 'javascriptcoregtk-6.0.0.dll';  // ????????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TJSCContext = record
  end;
  PJSCContext = ^TJSCContext;

  TJSCValue = record
  end;
  PJSCValue = ^TJSCValue;
  PPJSCValue = ^PJSCValue;


  {$DEFINE read_interface}
  {$include jsc/JSCVirtualMachine.inc}
  {$include jsc/JSCException.inc}
  {$include jsc/JSCClass.inc}
  {$include jsc/JSCValue.inc}
  {$include jsc/JSCContext.inc}
  {$include jsc/JSCOptions.inc}
  {$include jsc/JSCVersion.inc}
  {$include jsc/JSCWeakValue.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include jsc/JSCVirtualMachine.inc}
{$include jsc/JSCException.inc}
{$include jsc/JSCClass.inc}
{$include jsc/JSCValue.inc}
{$include jsc/JSCContext.inc}
{$include jsc/JSCOptions.inc}
{$include jsc/JSCVersion.inc}
{$include jsc/JSCWeakValue.inc}
{$UNDEF read_implementation}

end.
