unit stat_bits;

interface

uses
  struct_stat;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  __S_IFMT = 0170000;
  __S_IFDIR = 0040000;
  __S_IFCHR = 0020000;
  __S_IFBLK = 0060000;
  __S_IFREG = 0100000;
  __S_IFIFO = 0010000;
  __S_IFLNK = 0120000;
  __S_IFSOCK = 0140000;

const
  __S_ISUID = 04000;
  __S_ISGID = 02000;
  __S_ISVTX = 01000;
  __S_IREAD = 0400;
  __S_IWRITE = 0200;
  __S_IEXEC = 0100;

  // === Konventiert am: 2-9-25 13:36:03 ===


implementation


end.
