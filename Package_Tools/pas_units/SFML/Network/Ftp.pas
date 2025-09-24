unit Ftp;

interface

uses
  fp_sfml, Config, Time, NetWork_Types, IpAddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfFtpTransferMode = ^TsfFtpTransferMode;
  TsfFtpTransferMode = longint;

const
  sfFtpBinary = 0;
  sfFtpAscii = 1;
  sfFtpEbcdic = 2;

type
  PsfFtpStatus = ^TsfFtpStatus;
  TsfFtpStatus = longint;

const
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

procedure sfFtpListingResponse_destroy(ftpListingResponse: PsfFtpListingResponse); cdecl; external libsfml_network;
function sfFtpListingResponse_isOk(ftpListingResponse: PsfFtpListingResponse): TsfBool; cdecl; external libsfml_network;
function sfFtpListingResponse_getStatus(ftpListingResponse: PsfFtpListingResponse): TsfFtpStatus; cdecl; external libsfml_network;
function sfFtpListingResponse_getMessage(ftpListingResponse: PsfFtpListingResponse): pchar; cdecl; external libsfml_network;
function sfFtpListingResponse_getCount(ftpListingResponse: PsfFtpListingResponse): Tsize_t; cdecl; external libsfml_network;
function sfFtpListingResponse_getName(ftpListingResponse: PsfFtpListingResponse; index: Tsize_t): pchar; cdecl; external libsfml_network;
procedure sfFtpDirectoryResponse_destroy(ftpDirectoryResponse: PsfFtpDirectoryResponse); cdecl; external libsfml_network;
function sfFtpDirectoryResponse_isOk(ftpDirectoryResponse: PsfFtpDirectoryResponse): TsfBool; cdecl; external libsfml_network;
function sfFtpDirectoryResponse_getStatus(ftpDirectoryResponse: PsfFtpDirectoryResponse): TsfFtpStatus; cdecl; external libsfml_network;
function sfFtpDirectoryResponse_getMessage(ftpDirectoryResponse: PsfFtpDirectoryResponse): pchar; cdecl; external libsfml_network;
function sfFtpDirectoryResponse_getDirectory(ftpDirectoryResponse: PsfFtpDirectoryResponse): pchar; cdecl; external libsfml_network;
procedure sfFtpResponse_destroy(ftpResponse: PsfFtpResponse); cdecl; external libsfml_network;
function sfFtpResponse_isOk(ftpResponse: PsfFtpResponse): TsfBool; cdecl; external libsfml_network;
function sfFtpResponse_getStatus(ftpResponse: PsfFtpResponse): TsfFtpStatus; cdecl; external libsfml_network;
function sfFtpResponse_getMessage(ftpResponse: PsfFtpResponse): pchar; cdecl; external libsfml_network;
function sfFtp_create: PsfFtp; cdecl; external libsfml_network;
procedure sfFtp_destroy(ftp: PsfFtp); cdecl; external libsfml_network;
function sfFtp_connect(ftp: PsfFtp; server: TsfIpAddress; port: word; timeout: TsfTime): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_loginAnonymous(ftp: PsfFtp): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_login(ftp: PsfFtp; name: pchar; password: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_disconnect(ftp: PsfFtp): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_keepAlive(ftp: PsfFtp): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_getWorkingDirectory(ftp: PsfFtp): PsfFtpDirectoryResponse; cdecl; external libsfml_network;
function sfFtp_getDirectoryListing(ftp: PsfFtp; directory: pchar): PsfFtpListingResponse; cdecl; external libsfml_network;
function sfFtp_changeDirectory(ftp: PsfFtp; directory: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_parentDirectory(ftp: PsfFtp): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_createDirectory(ftp: PsfFtp; name: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_deleteDirectory(ftp: PsfFtp; name: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_renameFile(ftp: PsfFtp; file_: pchar; newName: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_deleteFile(ftp: PsfFtp; name: pchar): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_download(ftp: PsfFtp; remoteFile: pchar; localPath: pchar; mode: TsfFtpTransferMode): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_upload(ftp: PsfFtp; localFile: pchar; remotePath: pchar; mode: TsfFtpTransferMode; append: TsfBool): PsfFtpResponse; cdecl; external libsfml_network;
function sfFtp_sendCommand(ftp: PsfFtp; command: pchar; parameter: pchar): PsfFtpResponse; cdecl; external libsfml_network;

// === Konventiert am: 24-9-25 16:56:49 ===


implementation



end.
