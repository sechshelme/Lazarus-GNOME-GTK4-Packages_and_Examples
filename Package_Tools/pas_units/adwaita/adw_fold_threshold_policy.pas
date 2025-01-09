unit adw_fold_threshold_policy;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwFoldThresholdPolicy = ^TAdwFoldThresholdPolicy;
  TAdwFoldThresholdPolicy = longint;

const
  ADW_FOLD_THRESHOLD_POLICY_MINIMUM = 0;
  ADW_FOLD_THRESHOLD_POLICY_NATURAL = 1;

  // === Konventiert am: 9-1-25 19:22:12 ===


implementation



end.
