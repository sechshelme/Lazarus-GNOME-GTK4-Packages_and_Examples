unit UdpSocket;

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
{$ifndef SFML_UDPSOCKET_H}
{$define SFML_UDPSOCKET_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Network/Export.h>}
{$include <SFML/Network/IpAddress.h>}
{$include <SFML/Network/SocketStatus.h>}
{$include <SFML/Network/Types.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create a new UDP socket }
{/ }
{/ \return A new sfUdpSocket object }
{/ }
{////////////////////////////////////////////////////////// }

function sfUdpSocket_create:PsfUdpSocket;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a UDP socket }
{/ }
{/ \param socket UDP socket to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfUdpSocket_destroy(socket:PsfUdpSocket);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Set the blocking state of a UDP listener }
{/ }
{/ In blocking mode, calls will not return until they have }
{/ completed their task. For example, a call to }
{/ sfUDPSocket_receive in blocking mode won't return until }
{/ new data was actually received. }
{/ In non-blocking mode, calls will always return immediately, }
{/ using the return code to signal whether there was data }
{/ available or not. }
{/ By default, all sockets are blocking. }
{/ }
{/ \param socket   UDP socket object }
{/ \param blocking sfTrue to set the socket as blocking, sfFalse for non-blocking }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfUdpSocket_setBlocking(socket:PsfUdpSocket; blocking:TsfBool);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether a UDP socket is in blocking or non-blocking mode }
{/ }
{/ \param socket UDP socket object }
{/ }
{/ \return sfTrue if the socket is blocking, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_isBlocking(socket:PsfUdpSocket):TsfBool;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Get the port to which a UDP socket is bound locally }
{/ }
{/ If the socket is not bound to a port, this function }
{/ returns 0. }
{/ }
{/ \param socket UDP socket object }
{/ }
{/ \return Port to which the socket is bound }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_getLocalPort(socket:PsfUdpSocket):word;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Bind a UDP socket to a specific port }
{/ }
{/ Binding the socket to a port is necessary for being }
{/ able to receive data on that port. }
{/ You can use the special value 0 to tell the }
{/ system to automatically pick an available port, and then }
{/ call sfUdpSocket_getLocalPort to retrieve the chosen port. }
{/ }
{/ If there is no specific address to listen to, pass sfIpAddress_Any }
{/ }
{/ \param socket  UDP socket object }
{/ \param port    Port to bind the socket to }
{/ \param address Address of the interface to bind to }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_bind(socket:PsfUdpSocket; port:word; address:TsfIpAddress):TsfSocketStatus;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Unbind a UDP socket from the local port to which it is bound }
{/ }
{/ The port that the socket was previously using is immediately }
{/ available after this function is called. If the }
{/ socket is not bound to a port, this function has no effect. }
{/ }
{/ \param socket UDP socket object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfUdpSocket_unbind(socket:PsfUdpSocket);cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Send raw data to a remote peer with a UDP socket }
{/ }
{/ Make sure that \a size is not greater than }
{/ sfUdpSocket_maxDatagramSize(), otherwise this function will }
{/ fail and no data will be sent. }
{/ }
{/ \param socket        UDP socket object }
{/ \param data          Pointer to the sequence of bytes to send }
{/ \param size          Number of bytes to send }
{/ \param remoteAddress Address of the receiver }
{/ \param remotePort    Port of the receiver to send the data to }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_send(socket:PsfUdpSocket; data:pointer; size:Tsize_t; remoteAddress:TsfIpAddress; remotePort:word):TsfSocketStatus;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Receive raw data from a remote peer with a UDP socket }
{/ }
{/ In blocking mode, this function will wait until some }
{/ bytes are actually received. }
{/ Be careful to use a buffer which is large enough for }
{/ the data that you intend to receive, if it is too small }
{/ then an error will be returned and *all* the data will }
{/ be lost. }
{/ }
{/ \param socket        UDP socket object }
{/ \param data          Pointer to the array to fill with the received bytes }
{/ \param size          Maximum number of bytes that can be received }
{/ \param received      This variable is filled with the actual number of bytes received }
{/ \param remoteAddress Address of the peer that sent the data }
{/ \param remotePort    Port of the peer that sent the data }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_receive(socket:PsfUdpSocket; data:pointer; size:Tsize_t; received:Psize_t; remoteAddress:PsfIpAddress; 
           remotePort:Pword):TsfSocketStatus;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Send a formatted packet of data to a remote peer with a UDP socket }
{/ }
{/ Make sure that the packet size is not greater than }
{/ sfUdpSocket_maxDatagramSize(), otherwise this function will }
{/ fail and no data will be sent. }
{/ }
{/ \param socket        UDP socket object }
{/ \param packet        Packet to send }
{/ \param remoteAddress Address of the receiver }
{/ \param remotePort    Port of the receiver to send the data to }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_sendPacket(socket:PsfUdpSocket; packet:PsfPacket; remoteAddress:TsfIpAddress; remotePort:word):TsfSocketStatus;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Receive a formatted packet of data from a remote peer with a UDP socket }
{/ }
{/ In blocking mode, this function will wait until the whole packet }
{/ has been received. }
{/ }
{/ \param packet        Packet to fill with the received data }
{/ \param remoteAddress Address of the peer that sent the data }
{/ \param remotePort    Port of the peer that sent the data }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_receivePacket(socket:PsfUdpSocket; packet:PsfPacket; remoteAddress:PsfIpAddress; remotePort:Pword):TsfSocketStatus;cdecl;external libsfml_network;
{////////////////////////////////////////////////////////// }
{/ \brief Return the maximum number of bytes that can be }
{/        sent in a single UDP datagram }
{/ }
{/ \return The maximum size of a UDP datagram (message) }
{/ }
{////////////////////////////////////////////////////////// }
function sfUdpSocket_maxDatagramSize:dword;cdecl;external libsfml_network;
{$endif}
{ SFML_UDPSOCKET_H }

// === Konventiert am: 24-9-25 16:56:20 ===


implementation



end.
