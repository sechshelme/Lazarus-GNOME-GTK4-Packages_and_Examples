unit SocketStatus;

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
{$ifndef SFML_SOCKETSTATUS_H}
{$define SFML_SOCKETSTATUS_H}
{////////////////////////////////////////////////////////// }
{/ \brief Define the status that can be returned by the socket functions }
{/ }
{////////////////////////////////////////////////////////// }
{/< The socket has sent / received the data }
{/< The socket is not ready to send / receive data yet }
{/< The socket sent a part of the data }
{/< The TCP socket has been disconnected }
{/< An unexpected error happened }
type
  PsfSocketStatus = ^TsfSocketStatus;
  TsfSocketStatus =  Longint;
  Const
    sfSocketDone = 0;
    sfSocketNotReady = 1;
    sfSocketPartial = 2;
    sfSocketDisconnected = 3;
    sfSocketError = 4;
;
{$endif}
{ SFML_SOCKETSTATUS_H }

// === Konventiert am: 24-9-25 16:56:32 ===


implementation



end.
