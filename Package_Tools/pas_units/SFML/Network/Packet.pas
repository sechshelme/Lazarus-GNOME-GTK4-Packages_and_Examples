unit Packet;

interface

uses
  fp_sfml;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_PACKET_H}
{$define SFML_PACKET_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Network/Export.h>}
{$include <SFML/Network/Types.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create a new packet }
{/ }
{/ \return A new sfPacket object }
{/ }
{////////////////////////////////////////////////////////// }

function sfPacket_create:PsfPacket;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new packet by copying an existing one }
{/ }
{/ \param packet Packet to copy }
{/ }
{/ \return A new sfPacket object which is a copy of \a packet }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_copy(packet:PsfPacket):PsfPacket;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a packet }
{/ }
{/ \param packet Packet to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfPacket_destroy(packet:PsfPacket);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Append data to the end of a packet }
{/ }
{/ \param packet      Packet object }
{/ \param data        Pointer to the sequence of bytes to append }
{/ \param sizeInBytes Number of bytes to append }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfPacket_append(packet:PsfPacket; data:pointer; sizeInBytes:Tsize_t);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current reading position in the packet }
{/ }
{/ The next read operation will read data from this position }
{/ }
{/ \return The byte offset of the current read position }
{/ }
{/ \see append }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_getReadPosition(packet:PsfPacket):Tsize_t;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Clear a packet }
{/ }
{/ After calling Clear, the packet is empty. }
{/ }
{/ \param packet Packet object }
{/ }
{///////////////////////////////////////////////////////// }
procedure sfPacket_clear(packet:PsfPacket);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Get a pointer to the data contained in a packet }
{/ }
{/ Warning: the returned pointer may become invalid after }
{/ you append data to the packet, therefore it should never }
{/ be stored. }
{/ The return pointer is NULL if the packet is empty. }
{/ }
{/ \param packet Packet object }
{/ }
{/ \return Pointer to the data }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_getData(packet:PsfPacket):pointer;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Get the size of the data contained in a packet }
{/ }
{/ This function returns the number of bytes pointed to by }
{/ what sfPacket_getData returns. }
{/ }
{/ \param packet Packet object }
{/ }
{/ \return Data size, in bytes }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_getDataSize(packet:PsfPacket):Tsize_t;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Tell if the reading position has reached the }
{/        end of a packet }
{/ }
{/ This function is useful to know if there is some data }
{/ left to be read, without actually reading it. }
{/ }
{/ \param packet Packet object }
{/ }
{/ \return sfTrue if all data was read, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_endOfPacket(packet:PsfPacket):TsfBool;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Test the validity of a packet, for reading }
{/ }
{/ This function allows to test the packet, to check if }
{/ a reading operation was successful. }
{/ }
{/ A packet will be in an invalid state if it has no more }
{/ data to read. }
{/ }
{/ \param packet Packet object }
{/ }
{/ \return sfTrue if last data extraction from packet was successful }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_canRead(packet:PsfPacket):TsfBool;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Functions to extract data from a packet }
{/ }
{/ \param packet Packet object }
{/ }
{////////////////////////////////////////////////////////// }
function sfPacket_readBool(packet:PsfPacket):TsfBool;cdecl;external libsfml_network;
function sfPacket_readInt8(packet:PsfPacket):TsfInt8;cdecl;external libsfml_network;
function sfPacket_readUint8(packet:PsfPacket):TsfUint8;cdecl;external libsfml_network;
function sfPacket_readInt16(packet:PsfPacket):TsfInt16;cdecl;external libsfml_network;
function sfPacket_readUint16(packet:PsfPacket):TsfUint16;cdecl;external libsfml_network;
function sfPacket_readInt32(packet:PsfPacket):TsfInt32;cdecl;external libsfml_network;
function sfPacket_readUint32(packet:PsfPacket):TsfUint32;cdecl;external libsfml_network;
function sfPacket_readFloat(packet:PsfPacket):single;cdecl;external libsfml_network;
function sfPacket_readDouble(packet:PsfPacket):Tdouble;cdecl;external libsfml_network;
procedure sfPacket_readString(packet:PsfPacket; _string:Pchar);cdecl;external libsfml_network;
procedure sfPacket_readWideString(packet:PsfPacket; _string:Pwchar_t);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Functions to insert data into a packet }
{/ }
{/ \param packet Packet object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfPacket_writeBool(packet:PsfPacket; para2:TsfBool);cdecl;external libsfml_network;
procedure sfPacket_writeInt8(packet:PsfPacket; para2:TsfInt8);cdecl;external libsfml_network;
procedure sfPacket_writeUint8(packet:PsfPacket; para2:TsfUint8);cdecl;external libsfml_network;
procedure sfPacket_writeInt16(packet:PsfPacket; para2:TsfInt16);cdecl;external libsfml_network;
procedure sfPacket_writeUint16(packet:PsfPacket; para2:TsfUint16);cdecl;external libsfml_network;
procedure sfPacket_writeInt32(packet:PsfPacket; para2:TsfInt32);cdecl;external libsfml_network;
procedure sfPacket_writeUint32(packet:PsfPacket; para2:TsfUint32);cdecl;external libsfml_network;
procedure sfPacket_writeFloat(packet:PsfPacket; para2:single);cdecl;external libsfml_network;
procedure sfPacket_writeDouble(packet:PsfPacket; para2:Tdouble);cdecl;external libsfml_network;
procedure sfPacket_writeString(packet:PsfPacket; _string:Pchar);cdecl;external libsfml_network;
procedure sfPacket_writeWideString(packet:PsfPacket; _string:Pwchar_t);cdecl;external libsfml_network;
{$endif}
{ SFML_PACKET_H }

// === Konventiert am: 24-9-25 16:56:37 ===


implementation



end.
