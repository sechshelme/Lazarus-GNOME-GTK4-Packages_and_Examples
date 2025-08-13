unit ftp;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 1983, 1989, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)ftp.h	8.1 (Berkeley) 6/2/93
  }
{$ifndef _ARPA_FTP_H}

const
  _ARPA_FTP_H = 1;  
{ Definitions for FTP; see RFC-765.  }
{
 * Reply codes.
  }
{ positive preliminary  }
  PRELIM = 1;  
{ positive completion  }
  COMPLETE = 2;  
{ positive intermediate  }
  CONTINUE = 3;  
{ transient negative completion  }
  TRANSIENT = 4;  
{ permanent negative completion  }
  ERROR = 5;  
{
 * Type codes
  }
{ ASCII  }
  TYPE_A = 1;  
{ EBCDIC  }
  TYPE_E = 2;  
{ image  }
  TYPE_I = 3;  
{ local byte size  }
  TYPE_L = 4;  
{$ifdef FTP_NAMES}
{ xxxxxxxxxxx char *typenames[] =  "0", "ASCII", "EBCDIC", "Image", "Local" ; }
{$endif}
{
 * Form codes
  }
{ non-print  }

const
  FORM_N = 1;  
{ telnet format effectors  }
  FORM_T = 2;  
{ carriage control (ASA)  }
  FORM_C = 3;  
{$ifdef FTP_NAMES}
{ xxxxxxxxxxx char *formnames[] =  "0", "Nonprint", "Telnet", "Carriage-control" ; }
{$endif}
{
 * Structure codes
  }
{ file (no record structure)  }

const
  STRU_F = 1;  
{ record structure  }
  STRU_R = 2;  
{ page structure  }
  STRU_P = 3;  
{$ifdef FTP_NAMES}
{ xxxxxxxxxxx char *strunames[] =  "0", "File", "Record", "Page" ; }
{$endif}
{
 * Mode types
  }
{ stream  }

const
  MODE_S = 1;  
{ block  }
  MODE_B = 2;  
{ compressed  }
  MODE_C = 3;  
{$ifdef FTP_NAMES}
{ xxxxxxxxxxx char *modenames[] =  "0", "Stream", "Block", "Compressed" ; }
{$endif}
{
 * Record Tokens
  }
{ Record-mode Escape  }

const
  REC_ESC = '\377';  
{ Record-mode End-of-Record  }
  REC_EOR = '\001';  
{ Record-mode End-of-File  }
  REC_EOF = '\002';  
{
 * Block Header
  }
{ Block is End-of-Record  }
  BLK_EOR = $80;  
{ Block is End-of-File  }
  BLK_EOF = $40;  
{ Block is suspected of containing errors  }
  BLK_ERRORS = $20;  
{ Block is Restart Marker  }
  BLK_RESTART = $10;  
{ Bytes in this block  }
  BLK_BYTECOUNT = 2;  
{$endif}
{ arpa/ftp.h  }

// === Konventiert am: 13-8-25 19:42:47 ===


implementation



end.
