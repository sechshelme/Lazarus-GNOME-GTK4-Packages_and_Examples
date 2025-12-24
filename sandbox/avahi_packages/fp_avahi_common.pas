unit fp_avahi_common;

interface

const
  {$IFDEF Linux}
  libavahi_common = 'avahi-common';
  libavahi_client='avahi-client;';
  {$ENDIF}

  {$IFDEF Windows}
  libavahi_common = 'avahi-common'; // ????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  Tva_list=Pointer; // ????


type // sys/time.h>
  TTimeVal = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  PTimeVal = ^TTimeVal;

  type // /usr/include/x86_64-linux-gnu/sys/poll.h
    Ppollfd=type Pointer;



const // /usr/include/asm-generic/poll.h
   POLLIN=		$0001;
   POLLPRI=		$0002;
   POLLOUT=		$0004;
   POLLERR=		$0008;
   POLLHUP=		$0010;
   POLLNVAL=	        $0020;


   {$DEFINE read_interface}
   {$include fp_avahi_common_includes.inc}
   {$UNDEF read_interface}

 implementation

 {$DEFINE read_implementation}
 {$include fp_avahi_common_includes.inc}
 {$UNDEF read_implementation}

end.

