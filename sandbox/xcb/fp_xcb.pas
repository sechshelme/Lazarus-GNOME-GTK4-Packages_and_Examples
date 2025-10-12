unit fp_xcb;

interface


(*
/usr/lib/x86_64-linux-gnu/libxcb-xinerama.so
/usr/lib/x86_64-linux-gnu/libxcb-res.so
/usr/lib/x86_64-linux-gnu/libxcb-record.so
/usr/lib/x86_64-linux-gnu/libxcb-imdkit.so
/usr/lib/x86_64-linux-gnu/libxcb-screensaver.so
/usr/lib/x86_64-linux-gnu/libxcb-util.so
/usr/lib/x86_64-linux-gnu/libxcb-xvmc.so
/usr/lib/x86_64-linux-gnu/libxcb-xtest.so
/usr/lib/x86_64-linux-gnu/libxcb-xf86dri.so
/usr/lib/x86_64-linux-gnu/libxcb-present.so
/usr/lib/x86_64-linux-gnu/libxcb-icccm.so
/usr/lib/x86_64-linux-gnu/libxcb-cursor.so
/usr/lib/x86_64-linux-gnu/libxcb-xrm.so
/usr/lib/x86_64-linux-gnu/libxcb-dri3.so
/usr/lib/x86_64-linux-gnu/libxcb-dri2.so
/usr/lib/x86_64-linux-gnu/libxcb-dpms.so
/usr/lib/x86_64-linux-gnu/libxcb-damage.so
/usr/lib/x86_64-linux-gnu/libxcb-composite.so
/usr/lib/x86_64-linux-gnu/libxcb-render-util.so
/usr/lib/x86_64-linux-gnu/libxcb-xkb.so
/usr/lib/x86_64-linux-gnu/libxcb-ewmh.so
*)

const
  {$IFDEF Linux}
  libxcb = 'libxcb';
  libxcb_keysyms = 'libxcb-keysyms';

  libxcb_shape='libxcb-shape';
  libxcb_render='libxcb-render';
  libxcb_randr='libxcb-randr';

  libxcb_ewmh = 'libxcb-ewmh';

  libxcb_shm='libxcb-shm';
  libxcb_image='libxcb-image';


  libxcb_xfixes='libxcb-xfixes';
  libxcb_xinput='libxcb-xinput';
  libxcb_xkb='libxcb-xkb';

    libxcb_util='libxcb-util';

    libxcb_xv='libxcb-xv';
    libxcb_sync    ='libxcb-sync';




  libxcb_glx='libxcb-glx';

  {$ENDIF}

  {$IFDEF Windows}
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

procedure free(__ptr: pointer); cdecl; external 'c';


type // /usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h
      Piovec=Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // von xproto.h wegen Kreuzverbindung
  Pxcb_query_extension_reply_t=Pointer;
  Pxcb_setup_t=Pointer;

  {$DEFINE read_interface}
//  {$include gsound/gsound_context.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include gsound/gsound_attr.inc}
{$UNDEF read_implementation}

end.
