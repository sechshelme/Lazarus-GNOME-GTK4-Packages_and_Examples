unit procfs;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Telf_siginfo = record
    si_signo: longint;
    si_code: longint;
    si_errno: longint;
  end;
  Pelf_siginfo = ^Telf_siginfo;

  Telf_prstatus = record
    pr_info: Telf_siginfo;
    pr_cursig: smallint;
    pr_sigpend: dword;
    pr_sighold: dword;
    pr_pid: Tpid_t;
    pr_ppid: Tpid_t;
    pr_pgrp: Tpid_t;
    pr_sid: Tpid_t;
    pr_utime: Ttimeval;
    pr_stime: Ttimeval;
    pr_cutime: Ttimeval;
    pr_cstime: Ttimeval;
    pr_reg: Telf_gregset_t;
    pr_fpvalid: longint;
  end;
  Pelf_prstatus = ^Telf_prstatus;

const
  ELF_PRARGSZ = 80;

type
  Telf_prpsinfo = record
    pr_state: char;
    pr_sname: char;
    pr_zomb: char;
    pr_nice: char;
    pr_flag: dword;
    pr_uid: Tpr_uid_t;
    pr_gid: Tpr_gid_t;
    pr_pid: longint;
    pr_ppid: longint;
    pr_pgrp: longint;
    pr_sid: longint;
    pr_fname: array[0..15] of char;
    pr_psargs: array[0..(ELF_PRARGSZ) - 1] of char;
  end;
  Pelf_prpsinfo = ^Telf_prpsinfo;

  Ppsaddr_t = ^Tpsaddr_t;
  Tpsaddr_t = pointer;

type
  Pprgregset_t = ^Tprgregset_t;
  Tprgregset_t = Pointer;

  Pprfpregset_t = ^Tprfpregset_t;
  Tprfpregset_t = Pointer;

  Plwpid_t = ^Tlwpid_t;
  Tlwpid_t = Tpid_t;


  // === Konventiert am: 8-8-25 17:25:50 ===


implementation



end.
