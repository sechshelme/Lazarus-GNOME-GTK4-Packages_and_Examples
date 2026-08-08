unit nma_mobile_wizard;

interface

uses
  fp_glib2, fp_GTK4, fp_nm, fp_nma;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PNMAMobileWizard = type Pointer;
  PNMAMobileWizardClass = type Pointer;

  PNMAMobileWizardAccessMethod = ^TNMAMobileWizardAccessMethod;

  TNMAMobileWizardAccessMethod = record
    provider_name: pchar;
    plan_name: pchar;
    devtype: TNMDeviceModemCapabilities;
    username: pchar;
    password: pchar;
    gsm_apn: pchar;
  end;

  TNMAMobileWizardCallback = procedure(self: PNMAMobileWizard; canceled: Tgboolean; method: PNMAMobileWizardAccessMethod; user_data: Tgpointer); cdecl;

function nma_mobile_wizard_get_type: TGType; cdecl; external libnma;
function nma_mobile_wizard_new(parent: PGtkWindow; window_group: PGtkWindowGroup; modem_caps: TNMDeviceModemCapabilities; will_connect_after: Tgboolean; cb: TNMAMobileWizardCallback;
  user_data: Tgpointer): PNMAMobileWizard; cdecl; external libnma;
procedure nma_mobile_wizard_present(wizard: PNMAMobileWizard); cdecl; external libnma;
procedure nma_mobile_wizard_destroy(self: PNMAMobileWizard); cdecl; external libnma;

// === Konventiert am: 8-8-26 13:25:30 ===

function NMA_TYPE_MOBILE_WIZARD: TGType;
function NMA_MOBILE_WIZARD(obj: Pointer): PNMAMobileWizard;
function NMA_MOBILE_WIZARD_CLASS(klass: Pointer): PNMAMobileWizardClass;
function NMA_IS_MOBILE_WIZARD(obj: Pointer): Tgboolean;
function NMA_IS_MOBILE_WIZARD_CLASS(klass: Pointer): Tgboolean;
function NMA_MOBILE_WIZARD_GET_CLASS(obj: Pointer): PNMAMobileWizardClass;

implementation

function NMA_TYPE_MOBILE_WIZARD: TGType;
begin
  NMA_TYPE_MOBILE_WIZARD := nma_mobile_wizard_get_type;
end;

function NMA_MOBILE_WIZARD(obj: Pointer): PNMAMobileWizard;
begin
  Result := PNMAMobileWizard(g_type_check_instance_cast(obj, NMA_TYPE_MOBILE_WIZARD));
end;

function NMA_MOBILE_WIZARD_CLASS(klass: Pointer): PNMAMobileWizardClass;
begin
  Result := PNMAMobileWizardClass(g_type_check_class_cast(klass, NMA_TYPE_MOBILE_WIZARD));
end;

function NMA_IS_MOBILE_WIZARD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NMA_TYPE_MOBILE_WIZARD);
end;

function NMA_IS_MOBILE_WIZARD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NMA_TYPE_MOBILE_WIZARD);
end;

function NMA_MOBILE_WIZARD_GET_CLASS(obj: Pointer): PNMAMobileWizardClass;
begin
  Result := PNMAMobileWizardClass(PGTypeInstance(obj)^.g_class);
end;



end.
