unit struct_stat;

interface

uses
  clib, ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  //  // /usr/include/x86_64-linux-gnu/bits/struct_stat.h

  // ??????????????????
  type
    __dev_t = UInt64;
    __ino_t = UInt64;
    __mode_t = UInt32;
    __nlink_t = UInt64;
    __uid_t = UInt32;
    __gid_t = UInt32;
    __off_t = Int64;
    __blksize_t = Int64;
    __blkcnt_t = Int64;
    __time_t = Int64;
    __syscall_ulong_t = UInt64;
    __syscall_slong_t = Int64;

    timespec = record
      tv_sec: __time_t;      // Sekunden
      tv_nsec: longint;      // Nanosekunden
    end;

    Tteststat =  record
      st_dev: __dev_t;                  // 8 Bytes
      st_ino: __ino_t;                  // 8 Bytes
      st_nlink: __nlink_t;              // 8 Bytes
      st_mode: __mode_t;                // 4 Bytes
      st_uid: __uid_t;                  // 4 Bytes
      st_gid: __gid_t;                  // 4 Bytes
      __pad0: Int32;                    // 4 Bytes Padding
      st_rdev: __dev_t;                 // 8 Bytes
  //    __pad2: array[0..3] of Byte;      // Padding, 4 Bytes
      st_size: __off_t;                 // 8 Bytes
      st_blksize: __blksize_t;          // 8 Bytes
      st_blocks: __blkcnt_t;            // 8 Bytes
      st_atim: timespec;                // 16 Bytes
      st_mtim: timespec;                // 16 Bytes
      st_ctim: timespec;                // 16 Bytes
      __glibc_reserved: array[0..2] of __syscall_slong_t; // 24 Bytes
    end;
//    Pstat=^Tstat;

type
  Tstat = record
    st_dev: Tdev_t;
    st_ino: Tino_t;
    st_nlink: Tnlink_t;
    st_mode: Tmode_t;
    st_uid: Tuid_t;
    st_gid: Tgid_t;
    __pad0: longint;
    st_rdev: Tdev_t;
    st_size: Toff_t;
    st_blksize: Tblksize_t;
    st_blocks: Tblkcnt_t;
    st_atim: Ttimespec;
    st_mtim: Ttimespec;
    st_ctim: Ttimespec;
    __glibc_reserved: array[0..2] of Tsyscall_slong_t;
  end;
  Pstat = ^Tstat;




  // === Konventiert am: 2-9-25 13:36:06 ===


implementation



end.
