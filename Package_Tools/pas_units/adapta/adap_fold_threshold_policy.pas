unit adap_fold_threshold_policy;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapFoldThresholdPolicy = ^TAdapFoldThresholdPolicy;
  TAdapFoldThresholdPolicy = longint;

const
  ADAP_FOLD_THRESHOLD_POLICY_MINIMUM = 0;
  ADAP_FOLD_THRESHOLD_POLICY_NATURAL = 1;


  // === Konventiert am: 4-12-25 17:08:52 ===


implementation



end.
