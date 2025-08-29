unit filechooser;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpOpenFileFlags = ^TXdpOpenFileFlags;
  TXdpOpenFileFlags = longint;

const
  XDP_OPEN_FILE_FLAG_NONE = 0;
  XDP_OPEN_FILE_FLAG_MULTIPLE = 1 shl 0;

procedure xdp_portal_open_file(portal: PXdpPortal; parent: PXdpParent; title: pchar; filters: PGVariant; current_filter: PGVariant;
  choices: PGVariant; flags: TXdpOpenFileFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_open_file_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;

type
  PXdpSaveFileFlags = ^TXdpSaveFileFlags;
  TXdpSaveFileFlags = longint;

const
  XDP_SAVE_FILE_FLAG_NONE = 0;

procedure xdp_portal_save_file(portal: PXdpPortal; parent: PXdpParent; title: pchar; current_name: pchar; current_folder: pchar;
  current_file: pchar; filters: PGVariant; current_filter: PGVariant; choices: PGVariant; flags: TXdpSaveFileFlags;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_save_file_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;
procedure xdp_portal_save_files(portal: PXdpPortal; parent: PXdpParent; title: pchar; current_name: pchar; current_folder: pchar;
  files: PGVariant; choices: PGVariant; flags: TXdpSaveFileFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_save_files_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:44 ===


implementation



end.
