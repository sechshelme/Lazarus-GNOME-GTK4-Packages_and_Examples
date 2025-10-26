unit union;

interface

uses
  fp_glib2, fp_libgtop2, cpu, disk, mem, swap, uptime, loadavg, shm_limits, msg_limits, sem_limits, proclist, procstate, procuid, procmem,
  proctime, procsignal, prockernel, procsegment, procargs, procmap ,mountlist, fsusage, netlist, netload, ppp, procopenfiles, procwd,
  procaffinity, procio;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tglibtop_union = record
    case longint of
      0: (cpu: Tglibtop_cpu);
      1: (disk: Tglibtop_disk);
      2: (mem: Tglibtop_mem);
      3: (swap: Tglibtop_swap);
      4: (uptime: Tglibtop_uptime);
      5: (loadavg: Tglibtop_loadavg);
      6: (shm_limits: Tglibtop_shm_limits);
      7: (msg_limits: Tglibtop_msg_limits);
      8: (sem_limits: Tglibtop_sem_limits);
      9: (proclist: Tglibtop_proclist);
      10: (proc_state: Tglibtop_proc_state);
      11: (proc_uid: Tglibtop_proc_uid);
      12: (proc_mem: Tglibtop_proc_mem);
      13: (proc_time: Tglibtop_proc_time);
      14: (proc_signal: Tglibtop_proc_signal);
      15: (proc_kernel: Tglibtop_proc_kernel);
      16: (proc_segment: Tglibtop_proc_segment);
      17: (proc_args: Tglibtop_proc_args);
      18: (proc_map: Tglibtop_proc_map);
      19: (mountlist: Tglibtop_mountlist);
      20: (fsusage: Tglibtop_fsusage);
      21: (netlist: Tglibtop_netlist);
      22: (netload: Tglibtop_netload);
      23: (ppp: Tglibtop_ppp);
      24: (proc_open_files: Tglibtop_proc_open_files);
      25: (proc_wd: Tglibtop_proc_wd);
      26: (proc_affinity: Tglibtop_proc_affinity);
      27: (proc_io: Tglibtop_proc_io);
  end;
  Pglibtop_union = ^Tglibtop_union;

  // === Konventiert am: 26-10-25 12:03:49 ===


implementation



end.
