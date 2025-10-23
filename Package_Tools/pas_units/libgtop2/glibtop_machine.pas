unit glibtop_machine;

interface

uses
  fp_glib2, fp_libgtop2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Tglibtop_machine = record
      uid : Tuid_t;
      euid : Tuid_t;
      gid : Tgid_t;
      egid : Tgid_t;
    end;
  Pglibtop_machine = ^Tglibtop_machine;


// === Konventiert am: 23-10-25 19:35:51 ===


implementation



end.
