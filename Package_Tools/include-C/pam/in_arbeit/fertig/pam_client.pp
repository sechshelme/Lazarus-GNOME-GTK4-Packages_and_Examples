
unit pam_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_client.h
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
Ppamc_bp_t  = ^pamc_bp_t;
Ppamc_handle_s  = ^pamc_handle_s;
Ppamc_handle_t  = ^pamc_handle_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id$
 *
 * Copyright (c) 1999 Andrew G. Morgan <morgan@linux.kernel.org>
 *
 * This header file provides the prototypes for the PAM client API
  }
{$ifndef PAM_CLIENT_H}
{$define PAM_CLIENT_H}
{ C++ extern C conditionnal removed }
{ def __cplusplus  }
{$include <unistd.h>}
{$include <string.h>}
{$include <stdio.h>}
{$include <stdint.h>}
{$include <sys/types.h>}
{ opaque agent handling structure  }
type
  Ppamc_handle_t = ^Tpamc_handle_t;
  Tpamc_handle_t = Ppamc_handle_s;
{ binary prompt structure pointer  }

  Ppamc_bp_t = ^Tpamc_bp_t;
  Tpamc_bp_t = ^record
      length : Tuint32_t;
      control : Tuint8_t;
    end;
{
 * functions provided by libpamc
  }
{
 * Initialize the agent abstraction library
  }

function pamc_start:Tpamc_handle_t;cdecl;external;
{
 * Terminate the authentication process
  }
function pamc_end(pch:Ppamc_handle_t):longint;cdecl;external;
{
 * force the loading of a specified agent
  }
(* Const before type ignored *)
function pamc_load(pch:Tpamc_handle_t; agent_id:Pchar):longint;cdecl;external;
{
 * Single conversation interface for binary prompts
  }
function pamc_converse(pch:Tpamc_handle_t; prompt_p:Ppamc_bp_t):longint;cdecl;external;
{
 * disable an agent
  }
(* Const before type ignored *)
function pamc_disable(pch:Tpamc_handle_t; agent_id:Pchar):longint;cdecl;external;
{
 * obtain a list of available agents
  }
function pamc_list_agents(pch:Tpamc_handle_t):^Pchar;cdecl;external;
{
 * PAM_BP_ MACROS for creating, destroying and manipulating binary prompts
  }
{$include <stdlib.h>}
{$include <stdio.h>}
{$include <unistd.h>}
{ Control types  }

const
  PAM_BPC_FALSE = 0;  
  PAM_BPC_TRUE = 1;  
{ continuation packet    }
  PAM_BPC_OK = $01;  
{ initialization packet  }
  PAM_BPC_SELECT = $02;  
{ termination packet     }
  PAM_BPC_DONE = $03;  
{ unable to execute      }
  PAM_BPC_FAIL = $04;  
{ The following control characters are only legal for echanges
   between an agent and a client (it is the responsibility of the
   client to enforce this rule in the face of a rogue server):  }
{ obtain client env.var  }
  PAM_BPC_GETENV = $41;  
{ set client env.var     }
  PAM_BPC_PUTENV = $42;  
{ display message        }
  PAM_BPC_TEXT = $43;  
{ display error message  }
  PAM_BPC_ERROR = $44;  
{ echo'd text prompt     }
  PAM_BPC_PROMPT = $45;  
{ non-echo'd text prompt }
  PAM_BPC_PASS = $46;  
{ quick check for prompts that are legal for the client (by
   implication the server too) to send to libpamc  }
{$endif}
{ def __cplusplus  }
{$endif}
{ PAM_CLIENT_H  }

implementation


end.
