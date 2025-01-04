unit JSCVirtualMachine;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {JSC_DECLARE_FINAL_TYPE (JSCVirtualMachine, jsc_virtual_machine, JSC, VIRTUAL_MACHINE, GObject) }
type
  TJSCVirtualMachine = record
  end;
  PJSCVirtualMachine = ^TJSCVirtualMachine;

  TJSCVirtualMachineClass = record
    parent_class: TGObjectClass;
  end;
  PJSCVirtualMachineClass = ^TJSCVirtualMachineClass;

function jsc_virtual_machine_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_virtual_machine_new: PJSCVirtualMachine; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 17:42:16 ===

function JSC_TYPE_VIRTUAL_MACHINE: TGType;
function JSC_VIRTUAL_MACHINE(obj: Pointer): PJSCVirtualMachine;
function JSC_IS_VIRTUAL_MACHINE(obj: Pointer): Tgboolean;

implementation

function JSC_TYPE_VIRTUAL_MACHINE: TGType;
begin
  Result := jsc_virtual_machine_get_type;
end;

function JSC_VIRTUAL_MACHINE(obj: Pointer): PJSCVirtualMachine;
begin
  Result := PJSCVirtualMachine(g_type_check_instance_cast(obj, JSC_TYPE_VIRTUAL_MACHINE));
end;

function JSC_IS_VIRTUAL_MACHINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_VIRTUAL_MACHINE);
end;


end.
