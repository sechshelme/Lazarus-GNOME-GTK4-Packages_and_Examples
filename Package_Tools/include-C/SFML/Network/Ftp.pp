
unit Ftp;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ftp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ftp.h
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
Pchar  = ^char;
PsfFtp  = ^sfFtp;
PsfFtpDirectoryResponse  = ^sfFtpDirectoryResponse;
PsfFtpListingResponse  = ^sfFtpListingResponse;
PsfFtpResponse  = ^sfFtpResponse;
PsfFtpStatus  = ^sfFtpStatus;
PsfFtpTransferMode  = ^sfFtpTransferMode;
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
{$ifndef SFML_FTP_H}
{$define SFML_FTP_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Network/Export.h>}
{$include <SFML/Network/IpAddress.h>}
{$include <SFML/Network/Types.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of transfer modes }
{/ }
{////////////////////////////////////////////////////////// }
{/< Binary mode (file is transfered as a sequence of bytes) }
{/< Text mode using ASCII encoding }
{/< Text mode using EBCDIC encoding }
type
  PsfFtpTransferMode = ^TsfFtpTransferMode;
  TsfFtpTransferMode =  Longint;
  Const
    sfFtpBinary = 0;
    sfFtpAscii = 1;
    sfFtpEbcdic = 2;
;
{////////////////////////////////////////////////////////// }
{/ \brief Status codes possibly returned by a FTP response }
{/ }
{////////////////////////////////////////////////////////// }
{ 1xx: the requested action is being initiated, }
{ expect another reply before proceeding with a new command }
{/< Restart marker reply }
{/< Service ready in N minutes }
{/< Data connection already opened, transfer starting }
{/< File status ok, about to open data connection }
{ 2xx: the requested action has been successfully completed }
{/< Command ok }
{/< Command not implemented }
{/< System status, or system help reply }
{/< Directory status }
{/< File status }
{/< Help message }
{/< NAME system type, where NAME is an official system name from the list in the Assigned Numbers document }
{/< Service ready for new user }
{/< Service closing control connection }
{/< Data connection open, no transfer in progress }
{/< Closing data connection, requested file action successful }
{/< Entering passive mode }
{/< User logged in, proceed. Logged out if appropriate }
{/< Requested file action ok }
{/< PATHNAME created }
{ 3xx: the command has been accepted, but the requested action }
{ is dormant, pending receipt of further information }
{/< User name ok, need password }
{/< Need account for login }
{/< Requested file action pending further information }
{ 4xx: the command was not accepted and the requested action did not take place, }
{ but the error condition is temporary and the action may be requested again }
{/< Service not available, closing control connection }
{/< Can't open data connection }
{/< Connection closed, transfer aborted }
{/< Requested file action not taken }
{/< Requested action aborted, local error in processing }
{/< Requested action not taken; insufficient storage space in system, file unavailable }
{ 5xx: the command was not accepted and }
{ the requested action did not take place }
{/< Syntax error, command unrecognized }
{/< Syntax error in parameters or arguments }
{/< Command not implemented }
{/< Bad sequence of commands }
{/< Command not implemented for that parameter }
{/< Not logged in }
{/< Need account for storing files }
{/< Requested action not taken, file unavailable }
{/< Requested action aborted, page type unknown }
{/< Requested file action aborted, exceeded storage allocation }
{/< Requested action not taken, file name not allowed }
{ 10xx: SFML custom codes }
{/< Response is not a valid FTP one }
{/< Connection with server failed }
{/< Connection with server closed }
{/< Invalid file to upload / download }
type
  PsfFtpStatus = ^TsfFtpStatus;
  TsfFtpStatus =  Longint;
  Const
    sfFtpRestartMarkerReply = 110;
    sfFtpServiceReadySoon = 120;
    sfFtpDataConnectionAlreadyOpened = 125;
    sfFtpOpeningDataConnection = 150;
    sfFtpOk = 200;
    sfFtpPointlessCommand = 202;
    sfFtpSystemStatus = 211;
    sfFtpDirectoryStatus = 212;
    sfFtpFileStatus = 213;
    sfFtpHelpMessage = 214;
    sfFtpSystemType = 215;
    sfFtpServiceReady = 220;
    sfFtpClosingConnection = 221;
    sfFtpDataConnectionOpened = 225;
    sfFtpClosingDataConnection = 226;
    sfFtpEnteringPassiveMode = 227;
    sfFtpLoggedIn = 230;
    sfFtpFileActionOk = 250;
    sfFtpDirectoryOk = 257;
    sfFtpNeedPassword = 331;
    sfFtpNeedAccountToLogIn = 332;
    sfFtpNeedInformation = 350;
    sfFtpServiceUnavailable = 421;
    sfFtpDataConnectionUnavailable = 425;
    sfFtpTransferAborted = 426;
    sfFtpFileActionAborted = 450;
    sfFtpLocalError = 451;
    sfFtpInsufficientStorageSpace = 452;
    sfFtpCommandUnknown = 500;
    sfFtpParametersUnknown = 501;
    sfFtpCommandNotImplemented = 502;
    sfFtpBadCommandSequence = 503;
    sfFtpParameterNotImplemented = 504;
    sfFtpNotLoggedIn = 530;
    sfFtpNeedAccountToStore = 532;
    sfFtpFileUnavailable = 550;
    sfFtpPageTypeUnknown = 551;
    sfFtpNotEnoughMemory = 552;
    sfFtpFilenameNotAllowed = 553;
    sfFtpInvalidResponse = 1000;
    sfFtpConnectionFailed = 1001;
    sfFtpConnectionClosed = 1002;
    sfFtpInvalidFile = 1003;
;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a FTP listing response }
{/ }
{/ \param ftpListingResponse Ftp listing response to destroy }
{/ }
{////////////////////////////////////////////////////////// }

procedure sfFtpListingResponse_destroy(ftpListingResponse:PsfFtpListingResponse);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a FTP listing response status code means a success }
{/ }
{/ This function is defined for convenience, it is }
{/ equivalent to testing if the status code is < 400. }
{/ }
{/ \param ftpListingResponse Ftp listing response }
{/ }
{/ \return sfTrue if the status is a success, sfFalse if it is a failure }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpListingResponse_isOk(ftpListingResponse:PsfFtpListingResponse):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the status code of a FTP listing response }
{/ }
{/ \param ftpListingResponse Ftp listing response }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpListingResponse_getStatus(ftpListingResponse:PsfFtpListingResponse):TsfFtpStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the full message contained in a FTP listing response }
{/ }
{/ \param ftpListingResponse Ftp listing response }
{/ }
{/ \return The response message }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtpListingResponse_getMessage(ftpListingResponse:PsfFtpListingResponse):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return the number of directory/file names contained in a FTP listing response }
{/ }
{/ \param ftpListingResponse Ftp listing response }
{/ }
{/ \return Total number of names available }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpListingResponse_getCount(ftpListingResponse:PsfFtpListingResponse):Tsize_t;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return a directory/file name contained in a FTP listing response }
{/ }
{/ \param ftpListingResponse Ftp listing response }
{/ \param index              Index of the name to get (in range [0 .. getCount]) }
{/ }
{/ \return The requested name }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtpListingResponse_getName(ftpListingResponse:PsfFtpListingResponse; index:Tsize_t):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a FTP directory response }
{/ }
{/ \param ftpDirectoryResponse Ftp directory response to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfFtpDirectoryResponse_destroy(ftpDirectoryResponse:PsfFtpDirectoryResponse);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a FTP directory response status code means a success }
{/ }
{/ This function is defined for convenience, it is }
{/ equivalent to testing if the status code is < 400. }
{/ }
{/ \param ftpDirectoryResponse Ftp directory response }
{/ }
{/ \return sfTrue if the status is a success, sfFalse if it is a failure }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpDirectoryResponse_isOk(ftpDirectoryResponse:PsfFtpDirectoryResponse):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the status code of a FTP directory response }
{/ }
{/ \param ftpDirectoryResponse Ftp directory response }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpDirectoryResponse_getStatus(ftpDirectoryResponse:PsfFtpDirectoryResponse):TsfFtpStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the full message contained in a FTP directory response }
{/ }
{/ \param ftpDirectoryResponse Ftp directory response }
{/ }
{/ \return The response message }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtpDirectoryResponse_getMessage(ftpDirectoryResponse:PsfFtpDirectoryResponse):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the directory returned in a FTP directory response }
{/ }
{/ \param ftpDirectoryResponse Ftp directory response }
{/ }
{/ \return Directory name }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtpDirectoryResponse_getDirectory(ftpDirectoryResponse:PsfFtpDirectoryResponse):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a FTP response }
{/ }
{/ \param ftpResponse Ftp response to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfFtpResponse_destroy(ftpResponse:PsfFtpResponse);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a FTP response status code means a success }
{/ }
{/ This function is defined for convenience, it is }
{/ equivalent to testing if the status code is < 400. }
{/ }
{/ \param ftpResponse Ftp response object }
{/ }
{/ \return sfTrue if the status is a success, sfFalse if it is a failure }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpResponse_isOk(ftpResponse:PsfFtpResponse):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the status code of a FTP response }
{/ }
{/ \param ftpResponse Ftp response object }
{/ }
{/ \return Status code }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtpResponse_getStatus(ftpResponse:PsfFtpResponse):TsfFtpStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the full message contained in a FTP response }
{/ }
{/ \param ftpResponse Ftp response object }
{/ }
{/ \return The response message }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtpResponse_getMessage(ftpResponse:PsfFtpResponse):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new Ftp object }
{/ }
{/ \return A new sfFtp object }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_create:PsfFtp;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a Ftp object }
{/ }
{/ \param ftp Ftp object to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfFtp_destroy(ftp:PsfFtp);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Connect to the specified FTP server }
{/ }
{/ The port should be 21, which is the standard }
{/ port used by the FTP protocol. You shouldn't use a different }
{/ value, unless you really know what you do. }
{/ This function tries to connect to the server so it may take }
{/ a while to complete, especially if the server is not }
{/ reachable. To avoid blocking your application for too long, }
{/ you can use a timeout. Using 0 means that the }
{/ system timeout will be used (which is usually pretty long). }
{/ }
{/ \param ftp     Ftp object }
{/ \param server  Name or address of the FTP server to connect to }
{/ \param port    Port used for the connection }
{/ \param timeout Maximum time to wait }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_connect(ftp:PsfFtp; server:TsfIpAddress; port:word; timeout:TsfTime):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Log in using an anonymous account }
{/ }
{/ Logging in is mandatory after connecting to the server. }
{/ Users that are not logged in cannot perform any operation. }
{/ }
{/ \param ftp Ftp object }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_loginAnonymous(ftp:PsfFtp):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Log in using a username and a password }
{/ }
{/ Logging in is mandatory after connecting to the server. }
{/ Users that are not logged in cannot perform any operation. }
{/ }
{/ \param ftp      Ftp object }
{/ \param name     User name }
{/ \param password Password }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtp_login(ftp:PsfFtp; name:Pchar; password:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Close the connection with the server }
{/ }
{/ \param ftp Ftp object }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_disconnect(ftp:PsfFtp):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Send a null command to keep the connection alive }
{/ }
{/ This command is useful because the server may close the }
{/ connection automatically if no command is sent. }
{/ }
{/ \param ftp Ftp object }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_keepAlive(ftp:PsfFtp):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current working directory }
{/ }
{/ The working directory is the root path for subsequent }
{/ operations involving directories and/or filenames. }
{/ }
{/ \param ftp Ftp object }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_getWorkingDirectory(ftp:PsfFtp):PsfFtpDirectoryResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the contents of the given directory }
{/ }
{/ This function retrieves the sub-directories and files }
{/ contained in the given directory. It is not recursive. }
{/ The \a directory parameter is relative to the current }
{/ working directory. }
{/ }
{/ \param ftp       Ftp object }
{/ \param directory Directory to list }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtp_getDirectoryListing(ftp:PsfFtp; directory:Pchar):PsfFtpListingResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the current working directory }
{/ }
{/ The new directory must be relative to the current one. }
{/ }
{/ \param ftp       Ftp object }
{/ \param directory New working directory }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtp_changeDirectory(ftp:PsfFtp; directory:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Go to the parent directory of the current one }
{/ }
{/ \param ftp Ftp object }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
function sfFtp_parentDirectory(ftp:PsfFtp):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new directory }
{/ }
{/ The new directory is created as a child of the current }
{/ working directory. }
{/ }
{/ \param ftp  Ftp object }
{/ \param name Name of the directory to create }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtp_createDirectory(ftp:PsfFtp; name:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Remove an existing directory }
{/ }
{/ The directory to remove must be relative to the }
{/ current working directory. }
{/ Use this function with caution, the directory will }
{/ be removed permanently! }
{/ }
{/ \param ftp  Ftp object }
{/ \param name Name of the directory to remove }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtp_deleteDirectory(ftp:PsfFtp; name:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Rename an existing file }
{/ }
{/ The filenames must be relative to the current working }
{/ directory. }
{/ }
{/ \param ftp     Ftp object }
{/ \param file    File to rename }
{/ \param newName New name of the file }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtp_renameFile(ftp:PsfFtp; file:Pchar; newName:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Remove an existing file }
{/ }
{/ The file name must be relative to the current working }
{/ directory. }
{/ Use this function with caution, the file will be }
{/ removed permanently! }
{/ }
{/ \param ftp  Ftp object }
{/ \param name File to remove }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfFtp_deleteFile(ftp:PsfFtp; name:Pchar):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Download a file from a FTP server }
{/ }
{/ The filename of the distant file is relative to the }
{/ current working directory of the server, and the local }
{/ destination path is relative to the current directory }
{/ of your application. }
{/ }
{/ \param ftp        Ftp object }
{/ \param remoteFile Filename of the distant file to download }
{/ \param localPath  Where to put to file on the local computer }
{/ \param mode       Transfer mode }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtp_download(ftp:PsfFtp; remoteFile:Pchar; localPath:Pchar; mode:TsfFtpTransferMode):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Upload a file to a FTP server }
{/ }
{/ The name of the local file is relative to the current }
{/ working directory of your application, and the }
{/ remote path is relative to the current directory of the }
{/ FTP server. }
{/ }
{/ \param ftp        Ftp object }
{/ \param localFile  Path of the local file to upload }
{/ \param remotePath Where to put to file on the server }
{/ \param mode       Transfer mode }
{/ \param append     Pass sfTrue to append to or sfFalse to overwrite the remote file if it already exists }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtp_upload(ftp:PsfFtp; localFile:Pchar; remotePath:Pchar; mode:TsfFtpTransferMode; append:TsfBool):PsfFtpResponse;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Send a command to the FTP server }
{/ }
{/ While the most often used commands are provided as }
{/ specific functions, this function can be used to send }
{/ any FTP command to the server. If the command requires }
{/ one or more parameters, they can be specified in }
{/ \a parameter. Otherwise you should pass NULL. }
{/ If the server returns information, you can extract it }
{/ from the response using sfResponse_getMessage(). }
{/ }
{/ \param ftp       Ftp object }
{/ \param command   Command to send }
{/ \param parameter Command parameter }
{/ }
{/ \return Server response to the request }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfFtp_sendCommand(ftp:PsfFtp; command:Pchar; parameter:Pchar):PsfFtpResponse;cdecl;external;
{$endif}
{ SFML_FTP_H }

implementation


end.
