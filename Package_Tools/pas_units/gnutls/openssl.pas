unit openssl;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2004-2012 Free Software Foundation, Inc.
 * Copyright (c) 2002 Andrew McDonald <andrew@mcdonald.org.uk>
 *
 * This file is part of GnuTLS-EXTRA.
 *
 * GnuTLS-extra is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 3 of the
 * License, or (at your option) any later version.
 *
 * GnuTLS-extra is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GnuTLS-EXTRA.  If not, see <https://www.gnu.org/licenses/>.
  }
{ WARNING: Error functions aren't currently thread-safe  }
{ This file contains prototypes about the OpenSSL compatibility layer
 * in GnuTLS.  GnuTLS is not a complete replacement of OPENSSL so this
 * compatibility layer only supports limited OpenSSL functionality.
 *
 * New programs should avoid using this compatibility layer, and use
 * the native GnuTLS API directly.
  }
{$ifndef GNUTLS_OPENSSL_H}
{$define GNUTLS_OPENSSL_H}
{ C++ extern C conditionnal removed }
{$include <gnutls/gnutls.h>}
{ Extra definitions that no longer exist in gnutls.
  }

const
  GNUTLS_X509_CN_SIZE = 256;  
  GNUTLS_X509_C_SIZE = 3;  
  GNUTLS_X509_O_SIZE = 256;  
  GNUTLS_X509_OU_SIZE = 256;  
  GNUTLS_X509_L_SIZE = 256;  
  GNUTLS_X509_S_SIZE = 256;  
  GNUTLS_X509_EMAIL_SIZE = 256;  
type
  Pgnutls_x509_dn = ^Tgnutls_x509_dn;
  Tgnutls_x509_dn = record
      common_name : array[0..(GNUTLS_X509_CN_SIZE)-1] of char;
      country : array[0..(GNUTLS_X509_C_SIZE)-1] of char;
      organization : array[0..(GNUTLS_X509_O_SIZE)-1] of char;
      organizational_unit_name : array[0..(GNUTLS_X509_OU_SIZE)-1] of char;
      locality_name : array[0..(GNUTLS_X509_L_SIZE)-1] of char;
      state_or_province_name : array[0..(GNUTLS_X509_S_SIZE)-1] of char;
      email : array[0..(GNUTLS_X509_EMAIL_SIZE)-1] of char;
    end;

const
  OPENSSL_VERSION_NUMBER = $0090604F;  
  SSLEAY_VERSION_NUMBER = OPENSSL_VERSION_NUMBER;  
  SSL_ERROR_NONE = 0;  
  SSL_ERROR_SSL = 1;  
  SSL_ERROR_WANT_READ = 2;  
  SSL_ERROR_WANT_WRITE = 3;  
  SSL_ERROR_SYSCALL = 5;  
  SSL_ERROR_ZERO_RETURN = 6;  
  SSL_FILETYPE_PEM = GNUTLS_X509_FMT_PEM;  
  SSL_VERIFY_NONE = 0;  
  SSL_ST_OK = 1;  
  X509_V_ERR_CERT_NOT_YET_VALID = 1;  
  X509_V_ERR_CERT_HAS_EXPIRED = 2;  
  X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT = 3;  
  SSL_OP_ALL = $000FFFFF;  
  SSL_OP_NO_TLSv1 = $0400000;  
  SSL_MODE_ENABLE_PARTIAL_WRITE = $1;  
  SSL_MODE_ACCEPT_MOVING_WRITE_BUFFER = $2;  
  SSL_MODE_AUTO_RETRY = $4;  
{$undef X509_NAME}
{$undef X509}
type
  PX509_NAME = ^TX509_NAME;
  TX509_NAME = Tgnutls_x509_dn;

  PX509 = ^TX509;
  TX509 = Tgnutls_datum_t;

  PSSL_METHOD = ^TSSL_METHOD;
  TSSL_METHOD = record
      priority_string : array[0..255] of char;
      connend : dword;
    end;

  PSSL_CIPHER = ^TSSL_CIPHER;
  TSSL_CIPHER = record
      version : Tgnutls_protocol_t;
      cipher : Tgnutls_cipher_algorithm_t;
      kx : Tgnutls_kx_algorithm_t;
      mac : Tgnutls_mac_algorithm_t;
      compression : Tgnutls_compression_method_t;
      cert : Tgnutls_certificate_type_t;
    end;

  PBIO = ^TBIO;
  TBIO = record
      fd : Tgnutls_transport_ptr_t;
    end;

  PX509_STORE_CTX = ^TX509_STORE_CTX;
  TX509_STORE_CTX = record
      ssl : PSSL;
      error : longint;
      cert_list : Pgnutls_datum_t;
    end;

const
  current_cert = cert_list;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function X509_STORE_CTX_get_current_cert(ctx : longint) : longint;

type
  PSSL_CTX = ^TSSL_CTX;
  TSSL_CTX = record
      method : PSSL_METHOD;
      certfile : Pchar;
      certfile_type : longint;
      keyfile : Pchar;
      keyfile_type : longint;
      options : dword;
      verify_callback : function (para1:longint; para2:PX509_STORE_CTX):longint;cdecl;
      verify_mode : longint;
    end;
  PSSL = ^TSSL;
  TSSL = record
      gnutls_state : Tgnutls_session_t;
      gnutls_cred : Tgnutls_certificate_client_credentials;
      ctx : PSSL_CTX;
      ciphersuite : TSSL_CIPHER;
      last_error : longint;
      shutdown : longint;
      state : longint;
      options : dword;
      verify_callback : function (para1:longint; para2:PX509_STORE_CTX):longint;cdecl;
      verify_mode : longint;
      rfd : Tgnutls_transport_ptr_t;
      wfd : Tgnutls_transport_ptr_t;
    end;


const
  rbio = gnutls_state;  
type
  PMD_CTX = ^TMD_CTX;
  TMD_CTX = record
      handle : pointer;
    end;
  Prsa_st = ^Trsa_st;
  Trsa_st = record
      {undefined structure}
    end;

  Trsa_st = TRSA;

const
  MD5_CTX = MD_CTX;  
  RIPEMD160_CTX = MD_CTX;  
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function OpenSSL_add_ssl_algorithms : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function SSLeay_add_ssl_algorithms : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function SSLeay_add_all_algorithms : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_name(ssl : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher(ssl : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_bits(ssl,bp : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_version(ssl : longint) : longint;

{ Library initialisation functions  }
function SSL_library_init:longint;cdecl;external libgnutls;
procedure OpenSSL_add_all_algorithms;cdecl;external libgnutls;
{ SSL_CTX structure handling  }
function SSL_CTX_new(method:PSSL_METHOD):PSSL_CTX;cdecl;external libgnutls;
procedure SSL_CTX_free(ctx:PSSL_CTX);cdecl;external libgnutls;
function SSL_CTX_set_default_verify_paths(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_use_certificate_file(ctx:PSSL_CTX; certfile:Pchar; _type:longint):longint;cdecl;external libgnutls;
function SSL_CTX_use_PrivateKey_file(ctx:PSSL_CTX; keyfile:Pchar; _type:longint):longint;cdecl;external libgnutls;
procedure SSL_CTX_set_verify(ctx:PSSL_CTX; verify_mode:longint; verify_callback:function (para1:longint; para2:PX509_STORE_CTX):longint);cdecl;external libgnutls;
function SSL_CTX_set_options(ctx:PSSL_CTX; options:dword):dword;cdecl;external libgnutls;
function SSL_CTX_set_mode(ctx:PSSL_CTX; mode:longint):longint;cdecl;external libgnutls;
function SSL_CTX_set_cipher_list(ctx:PSSL_CTX; list:Pchar):longint;cdecl;external libgnutls;
{ SSL_CTX statistics  }
function SSL_CTX_sess_number(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_connect(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_connect_good(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_connect_renegotiate(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_accept(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_accept_good(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_accept_renegotiate(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_hits(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_misses(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
function SSL_CTX_sess_timeouts(ctx:PSSL_CTX):longint;cdecl;external libgnutls;
{ SSL structure handling  }
function SSL_new(ctx:PSSL_CTX):PSSL;cdecl;external libgnutls;
procedure SSL_free(ssl:PSSL);cdecl;external libgnutls;
procedure SSL_load_error_strings;cdecl;external libgnutls;
function SSL_get_error(ssl:PSSL; ret:longint):longint;cdecl;external libgnutls;
function SSL_set_fd(ssl:PSSL; fd:longint):longint;cdecl;external libgnutls;
function SSL_set_rfd(ssl:PSSL; fd:longint):longint;cdecl;external libgnutls;
function SSL_set_wfd(ssl:PSSL; fd:longint):longint;cdecl;external libgnutls;
procedure SSL_set_bio(ssl:PSSL; rbio:PBIO; wbio:PBIO);cdecl;external libgnutls;
procedure SSL_set_connect_state(ssl:PSSL);cdecl;external libgnutls;
function SSL_pending(ssl:PSSL):longint;cdecl;external libgnutls;
procedure SSL_set_verify(ssl:PSSL; verify_mode:longint; verify_callback:function (para1:longint; para2:PX509_STORE_CTX):longint);cdecl;external libgnutls;
function SSL_get_peer_certificate(ssl:PSSL):PX509;cdecl;external libgnutls;
{ SSL connection open/close/read/write functions  }
function SSL_connect(ssl:PSSL):longint;cdecl;external libgnutls;
function SSL_accept(ssl:PSSL):longint;cdecl;external libgnutls;
function SSL_shutdown(ssl:PSSL):longint;cdecl;external libgnutls;
function SSL_read(ssl:PSSL; buf:pointer; len:longint):longint;cdecl;external libgnutls;
function SSL_write(ssl:PSSL; buf:pointer; len:longint):longint;cdecl;external libgnutls;
function SSL_want(ssl:PSSL):longint;cdecl;external libgnutls;
const
  SSL_NOTHING = 1;  
  SSL_WRITING = 2;  
  SSL_READING = 3;  
  SSL_X509_LOOKUP = 4;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SSL_want_nothing(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_read(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_write(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_x509_lookup(s : longint) : longint;

{ SSL_METHOD functions  }
function SSLv23_client_method:PSSL_METHOD;cdecl;external libgnutls;
function SSLv23_server_method:PSSL_METHOD;cdecl;external libgnutls;
function SSLv3_client_method:PSSL_METHOD;cdecl;external libgnutls;
function SSLv3_server_method:PSSL_METHOD;cdecl;external libgnutls;
function TLSv1_client_method:PSSL_METHOD;cdecl;external libgnutls;
function TLSv1_server_method:PSSL_METHOD;cdecl;external libgnutls;
{ SSL_CIPHER functions  }
function SSL_get_current_cipher(ssl:PSSL):PSSL_CIPHER;cdecl;external libgnutls;
function SSL_CIPHER_get_name(cipher:PSSL_CIPHER):Pchar;cdecl;external libgnutls;
function SSL_CIPHER_get_bits(cipher:PSSL_CIPHER; bits:Plongint):longint;cdecl;external libgnutls;
function SSL_CIPHER_get_version(cipher:PSSL_CIPHER):Pchar;cdecl;external libgnutls;
function SSL_CIPHER_description(cipher:PSSL_CIPHER; buf:Pchar; size:longint):Pchar;cdecl;external libgnutls;
{ X509 functions  }
function X509_get_subject_name(cert:PX509):PX509_NAME;cdecl;external libgnutls;
function X509_get_issuer_name(cert:PX509):PX509_NAME;cdecl;external libgnutls;
function X509_NAME_oneline(name:Pgnutls_x509_dn; buf:Pchar; len:longint):Pchar;cdecl;external libgnutls;
procedure X509_free(cert:PX509);cdecl;external libgnutls;
{ BIO functions  }
procedure BIO_get_fd(gnutls_state:Tgnutls_session_t; fd:Plongint);cdecl;external libgnutls;
function BIO_new_socket(sock:longint; close_flag:longint):PBIO;cdecl;external libgnutls;
{ error handling  }
function ERR_get_error:dword;cdecl;external libgnutls;
function ERR_error_string(e:dword; buf:Pchar):Pchar;cdecl;external libgnutls;
{ RAND functions  }
function RAND_status:longint;cdecl;external libgnutls;
procedure RAND_seed(buf:pointer; num:longint);cdecl;external libgnutls;
function RAND_bytes(buf:Pbyte; num:longint):longint;cdecl;external libgnutls;
function RAND_pseudo_bytes(buf:Pbyte; num:longint):longint;cdecl;external libgnutls;
function RAND_file_name(buf:Pchar; len:Tsize_t):Pchar;cdecl;external libgnutls;
function RAND_load_file(name:Pchar; maxbytes:longint):longint;cdecl;external libgnutls;
function RAND_write_file(name:Pchar):longint;cdecl;external libgnutls;
function RAND_egd_bytes(path:Pchar; bytes:longint):longint;cdecl;external libgnutls;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RAND_egd(p : longint) : longint;

{ message digest functions  }
const
  MD5_DIGEST_LENGTH = 16;  

procedure MD5_Init(ctx:PMD5_CTX);cdecl;external libgnutls;
procedure MD5_Update(ctx:PMD5_CTX; buf:pointer; len:longint);cdecl;external libgnutls;
procedure MD5_Final(md:Pbyte; ctx:PMD5_CTX);cdecl;external libgnutls;
function MD5(buf:Pbyte; len:dword; md:Pbyte):Pbyte;cdecl;external libgnutls;
procedure RIPEMD160_Init(ctx:PRIPEMD160_CTX);cdecl;external libgnutls;
procedure RIPEMD160_Update(ctx:PRIPEMD160_CTX; buf:pointer; len:longint);cdecl;external libgnutls;
procedure RIPEMD160_Final(md:Pbyte; ctx:PRIPEMD160_CTX);cdecl;external libgnutls;
function RIPEMD160(buf:Pbyte; len:dword; md:Pbyte):Pbyte;cdecl;external libgnutls;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 9-7-25 13:39:42 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function X509_STORE_CTX_get_current_cert(ctx : longint) : longint;
begin
  X509_STORE_CTX_get_current_cert:=ctx^.current_cert;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function OpenSSL_add_ssl_algorithms : longint;
begin
  OpenSSL_add_ssl_algorithms:=SSL_library_init;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function SSLeay_add_ssl_algorithms : longint;
begin
  SSLeay_add_ssl_algorithms:=SSL_library_init;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function SSLeay_add_all_algorithms : longint;
begin
  SSLeay_add_all_algorithms:=OpenSSL_add_all_algorithms;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_name(ssl : longint) : longint;
begin
  SSL_get_cipher_name:=SSL_CIPHER_get_name(SSL_get_current_cipher(ssl));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher(ssl : longint) : longint;
begin
  SSL_get_cipher:=SSL_get_cipher_name(ssl);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_bits(ssl,bp : longint) : longint;
begin
  SSL_get_cipher_bits:=SSL_CIPHER_get_bits(SSL_get_current_cipher(ssl),bp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_get_cipher_version(ssl : longint) : longint;
begin
  SSL_get_cipher_version:=SSL_CIPHER_get_version(SSL_get_current_cipher(ssl));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_nothing(s : longint) : longint;
begin
  SSL_want_nothing:=(SSL_want(s))=SSL_NOTHING;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_read(s : longint) : longint;
begin
  SSL_want_read:=(SSL_want(s))=SSL_READING;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_write(s : longint) : longint;
begin
  SSL_want_write:=(SSL_want(s))=SSL_WRITING;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SSL_want_x509_lookup(s : longint) : longint;
begin
  SSL_want_x509_lookup:=(SSL_want(s))=SSL_X509_LOOKUP;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RAND_egd(p : longint) : longint;
begin
  RAND_egd:=RAND_egd_bytes(p,255);
end;


end.
