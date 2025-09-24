
unit TcpListener;
interface

{
  Automatically converted by H2Pas 1.0.0 from TcpListener.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    TcpListener.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PsfTcpListener  = ^sfTcpListener;
PsfTcpSocket  = ^sfTcpSocket;
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
{$ifndef SFML_TCPLISTENER_H}
{$define SFML_TCPLISTENER_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Network/Export.h>}
{$include <SFML/Network/SocketStatus.h>}
{$include <SFML/Network/IpAddress.h>}
{$include <SFML/Network/Types.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create a new TCP listener }
{/ }
{/ \return A new sfTcpListener object }
{/ }
{////////////////////////////////////////////////////////// }

function sfTcpListener_create:PsfTcpListener;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a TCP listener }
{/ }
{/ \param listener TCP listener to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTcpListener_destroy(listener:PsfTcpListener);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the blocking state of a TCP listener }
{/ }
{/ In blocking mode, calls will not return until they have }
{/ completed their task. For example, a call to }
{/ sfTcpListener_accept in blocking mode won't return until }
{/ a new connection was actually received. }
{/ In non-blocking mode, calls will always return immediately, }
{/ using the return code to signal whether there was data }
{/ available or not. }
{/ By default, all sockets are blocking. }
{/ }
{/ \param listener TCP listener object }
{/ \param blocking sfTrue to set the socket as blocking, sfFalse for non-blocking }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTcpListener_setBlocking(listener:PsfTcpListener; blocking:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether a TCP listener is in blocking or non-blocking mode }
{/ }
{/ \param listener TCP listener object }
{/ }
{/ \return sfTrue if the socket is blocking, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTcpListener_isBlocking(listener:PsfTcpListener):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the port to which a TCP listener is bound locally }
{/ }
{/ If the socket is not listening to a port, this function }
{/ returns 0. }
{/ }
{/ \param listener TCP listener object }
{/ }
{/ \return Port to which the TCP listener is bound }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTcpListener_getLocalPort(listener:PsfTcpListener):word;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Start listening for connections }
{/ }
{/ This functions makes the socket listen to the specified }
{/ port, waiting for new connections. }
{/ If the socket was previously listening to another port, }
{/ it will be stopped first and bound to the new port. }
{/ }
{/ If there is no specific address to listen to, pass sfIpAddress_Any }
{/ }
{/ \param listener TCP listener object }
{/ \param port     Port to listen for new connections }
{/ \param address  Address of the interface to listen on }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfTcpListener_listen(listener:PsfTcpListener; port:word; address:TsfIpAddress):TsfSocketStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Accept a new connection }
{/ }
{/ If the socket is in blocking mode, this function will }
{/ not return until a connection is actually received. }
{/ }
{/ The \a connected argument points to a valid sfTcpSocket pointer }
{/ in case of success (the function returns sfSocketDone), it points }
{/ to a NULL pointer otherwise. }
{/ }
{/ \param listener  TCP listener object }
{/ \param connected Socket that will hold the new connection }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
function sfTcpListener_accept(listener:PsfTcpListener; connected:PPsfTcpSocket):TsfSocketStatus;cdecl;external;
{$endif}
{ SFML_TCPLISTENER_H }

implementation


end.
