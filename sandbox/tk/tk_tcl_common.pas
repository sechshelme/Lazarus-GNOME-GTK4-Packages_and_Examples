unit tk_tcl_common;

interface

const
  libtcl8_6='libtcl8.6';
  libtk8_6='libtk8.6';
  libtclstub8_6='libtclstub8.6';
  libtkstub8_6='libtkstub8.6';


type
Pstat=procedure;  // /usr/include/x86_64-linux-gnu/sys/stat.h

Tsize_t=SizeUInt;

Twchar_t=WideChar;
Pwchar_t=^Twchar_t;
PPwchar_t=^Pwchar_t;

PBusy=Pointer;

Tva_list=Pointer;

PTkOption=Pointer; //????????
PTk_ItemType=Pointer;//?????????

implementation

end.

