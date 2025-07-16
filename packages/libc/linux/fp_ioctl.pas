unit fp_ioctl;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/sys/ioctl.h

function ioctl(__fd: longint; __request: dword): longint; cdecl; varargs; external libc;


// /usr/include/asm-generic/ioctls.h

const
  TCGETS = $5401;
  TCSETS = $5402;
  TCSETSW = $5403;
  TCSETSF = $5404;
  TCGETA = $5405;
  TCSETA = $5406;
  TCSETAW = $5407;
  TCSETAF = $5408;
  TCSBRK = $5409;
  TCXONC = $540A;
  TCFLSH = $540B;
  TIOCEXCL = $540C;
  TIOCNXCL = $540D;
  TIOCSCTTY = $540E;
  TIOCGPGRP = $540F;
  TIOCSPGRP = $5410;
  TIOCOUTQ = $5411;
  TIOCSTI = $5412;
  TIOCGWINSZ = $5413;
  TIOCSWINSZ = $5414;
  TIOCMGET = $5415;
  TIOCMBIS = $5416;
  TIOCMBIC = $5417;
  TIOCMSET = $5418;
  TIOCGSOFTCAR = $5419;
  TIOCSSOFTCAR = $541A;
  FIONREAD = $541B;
  TIOCINQ = FIONREAD;
  TIOCLINUX = $541C;
  TIOCCONS = $541D;
  TIOCGSERIAL = $541E;
  TIOCSSERIAL = $541F;
  TIOCPKT = $5420;
  FIONBIO = $5421;
  TIOCNOTTY = $5422;
  TIOCSETD = $5423;
  TIOCGETD = $5424;
  TCSBRKP = $5425;
  TIOCSBRK = $5427;
  TIOCCBRK = $5428;
  TIOCGSID = $5429;
  {#define TCGETS2    _IOR('T', 0x2A, struct termios2) }
  {#define TCSETS2    _IOW('T', 0x2B, struct termios2) }
  {#define TCSETSW2  _IOW('T', 0x2C, struct termios2) }
  {#define TCSETSF2  _IOW('T', 0x2D, struct termios2) }
  TIOCGRS485 = $542E;
  TIOCSRS485 = $542F;
  {#define TIOCGPTN  _IOR('T', 0x30, unsigned int) /* Get Pty Number (of pty-mux device) */ }
  {#define TIOCSPTLCK  _IOW('T', 0x31, int)  /* Lock/unlock Pty */ }
  {#define TIOCGDEV  _IOR('T', 0x32, unsigned int) /* Get primary device node of /dev/console */ }

  TCGETX = $5432;
  TCSETX = $5433;
  TCSETXF = $5434;
  TCSETXW = $5435;
  {#define TIOCSIG    _IOW('T', 0x36, int)  /* pty: generate signal */ }
  TIOCVHANGUP = $5437;
  {#define TIOCGPKT  _IOR('T', 0x38, int) /* Get packet mode state */ }
  {#define TIOCGPTLCK  _IOR('T', 0x39, int) /* Get Pty lock state */ }
  {#define TIOCGEXCL  _IOR('T', 0x40, int) /* Get exclusive mode state */ }
  {#define TIOCGPTPEER  _IO('T', 0x41) /* Safely open the slave */ }
  {#define TIOCGISO7816  _IOR('T', 0x42, struct serial_iso7816) }
  {#define TIOCSISO7816  _IOWR('T', 0x43, struct serial_iso7816) }
  FIONCLEX = $5450;
  FIOCLEX = $5451;
  FIOASYNC = $5452;
  TIOCSERCONFIG = $5453;
  TIOCSERGWILD = $5454;
  TIOCSERSWILD = $5455;
  TIOCGLCKTRMIOS = $5456;
  TIOCSLCKTRMIOS = $5457;
  TIOCSERGSTRUCT = $5458;
  TIOCSERGETLSR = $5459;
  TIOCSERGETMULTI = $545A;
  TIOCSERSETMULTI = $545B;
  TIOCMIWAIT = $545C;
  TIOCGICOUNT = $545D;
  FIOQSIZE = $5460;
  TIOCPKT_DATA = 0;
  TIOCPKT_FLUSHREAD = 1;
  TIOCPKT_FLUSHWRITE = 2;
  TIOCPKT_STOP = 4;
  TIOCPKT_START = 8;
  TIOCPKT_NOSTOP = 16;
  TIOCPKT_DOSTOP = 32;
  TIOCPKT_IOCTL = 64;
  TIOCSER_TEMT = $01;


  //  /usr/include/x86_64-linux-gnu/bits/ioctls.h

const
  SIOCADDRT = $890B;
  SIOCDELRT = $890C;
  SIOCRTMSG = $890D;
  SIOCGIFNAME = $8910;
  SIOCSIFLINK = $8911;
  SIOCGIFCONF = $8912;
  SIOCGIFFLAGS = $8913;
  SIOCSIFFLAGS = $8914;
  SIOCGIFADDR = $8915;
  SIOCSIFADDR = $8916;
  SIOCGIFDSTADDR = $8917;
  SIOCSIFDSTADDR = $8918;
  SIOCGIFBRDADDR = $8919;
  SIOCSIFBRDADDR = $891a;
  SIOCGIFNETMASK = $891b;
  SIOCSIFNETMASK = $891c;
  SIOCGIFMETRIC = $891d;
  SIOCSIFMETRIC = $891e;
  SIOCGIFMEM = $891f;
  SIOCSIFMEM = $8920;
  SIOCGIFMTU = $8921;
  SIOCSIFMTU = $8922;
  SIOCSIFNAME = $8923;
  SIOCSIFHWADDR = $8924;
  SIOCGIFENCAP = $8925;
  SIOCSIFENCAP = $8926;
  SIOCGIFHWADDR = $8927;
  SIOCGIFSLAVE = $8929;
  SIOCSIFSLAVE = $8930;
  SIOCADDMULTI = $8931;
  SIOCDELMULTI = $8932;
  SIOCGIFINDEX = $8933;
  SIOGIFINDEX = SIOCGIFINDEX;
  SIOCSIFPFLAGS = $8934;
  SIOCGIFPFLAGS = $8935;
  SIOCDIFADDR = $8936;
  SIOCSIFHWBROADCAST = $8937;
  SIOCGIFCOUNT = $8938;
  SIOCGIFBR = $8940;
  SIOCSIFBR = $8941;
  SIOCGIFTXQLEN = $8942;
  SIOCSIFTXQLEN = $8943;
  SIOCDARP = $8953;
  SIOCGARP = $8954;
  SIOCSARP = $8955;
  SIOCDRARP = $8960;
  SIOCGRARP = $8961;
  SIOCSRARP = $8962;
  SIOCGIFMAP = $8970;
  SIOCSIFMAP = $8971;
  SIOCADDDLCI = $8980;
  SIOCDELDLCI = $8981;

  SIOCDEVPRIVATE = $89F0;
  SIOCPROTOPRIVATE = $89E0;


  // === Konventiert am: 16-7-25 13:51:50 ===


implementation



end.
