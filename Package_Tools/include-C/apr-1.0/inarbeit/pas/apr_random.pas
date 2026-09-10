unit apr_random;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_RANDOM_H}
{$define APR_RANDOM_H}
{*
 * @file apr_random.h
 * @brief APR PRNG routines
  }
{$include "apr_pools.h"}
{$include "apr_thread_proc.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_random PRNG Routines
 * @ingroup APR
 * @
  }
type
{xxxxxxx }

  Tapr_crypto_hash_init_t = procedure (hash:Papr_crypto_hash_t);cdecl;

  Tapr_crypto_hash_add_t = procedure (hash:Papr_crypto_hash_t; data:pointer; bytes:Tapr_size_t);cdecl;

  Tapr_crypto_hash_finish_t = procedure (hash:Papr_crypto_hash_t; result:Pbyte);cdecl;
{ FIXME: make this opaque  }
  Papr_crypto_hash_t = ^Tapr_crypto_hash_t;
  Tapr_crypto_hash_t = record
      init : Papr_crypto_hash_init_t;cdecl;
      add : Papr_crypto_hash_add_t;
      finish : Papr_crypto_hash_finish_t;
      size : Tapr_size_t;
      data : pointer;
    end;

{*
 * Allocate and initialize the SHA-256 context
 * @param p The pool to allocate from
  }

function apr_crypto_sha256_new(p:Papr_pool_t):Papr_crypto_hash_t;cdecl;external libapr;
{* Opaque PRNG structure.  }
type
{*
 * Initialize a PRNG state
 * @param g The PRNG state
 * @param p The pool to allocate from
 * @param pool_hash Pool hash functions
 * @param key_hash Key hash functions
 * @param prng_hash PRNG hash functions
  }

procedure apr_random_init(g:Papr_random_t; p:Papr_pool_t; pool_hash:Papr_crypto_hash_t; key_hash:Papr_crypto_hash_t; prng_hash:Papr_crypto_hash_t);cdecl;external libapr;
{*
 * Allocate and initialize (apr_crypto_sha256_new) a new PRNG state.
 * @param p The pool to allocate from
  }
function apr_random_standard_new(p:Papr_pool_t):Papr_random_t;cdecl;external libapr;
{*
 * Mix the randomness pools.
 * @param g The PRNG state
 * @param entropy_ Entropy buffer
 * @param bytes Length of entropy_ in bytes
  }
procedure apr_random_add_entropy(g:Papr_random_t; entropy_:pointer; bytes:Tapr_size_t);cdecl;external libapr;
{*
 * Generate cryptographically insecure random bytes.
 * @param g The RNG state
 * @param random Buffer to fill with random bytes
 * @param bytes Length of buffer in bytes
  }
function apr_random_insecure_bytes(g:Papr_random_t; random:pointer; bytes:Tapr_size_t):Tapr_status_t;cdecl;external libapr;
{*
 * Generate cryptographically secure random bytes.
 * @param g The RNG state
 * @param random Buffer to fill with random bytes
 * @param bytes Length of buffer in bytes
  }
function apr_random_secure_bytes(g:Papr_random_t; random:pointer; bytes:Tapr_size_t):Tapr_status_t;cdecl;external libapr;
{*
 * Ensures that E bits of conditional entropy are mixed into the PRNG
 * before any further randomness is extracted.
 * @param g The RNG state
  }
procedure apr_random_barrier(g:Papr_random_t);cdecl;external libapr;
{*
 * Return APR_SUCCESS if the cryptographic PRNG has been seeded with
 * enough data, APR_ENOTENOUGHENTROPY otherwise.
 * @param r The RNG state
  }
function apr_random_secure_ready(r:Papr_random_t):Tapr_status_t;cdecl;external libapr;
{*
 * Return APR_SUCCESS if the PRNG has been seeded with enough data,
 * APR_ENOTENOUGHENTROPY otherwise.
 * @param r The PRNG state
  }
function apr_random_insecure_ready(r:Papr_random_t):Tapr_status_t;cdecl;external libapr;
{*
 * Mix the randomness pools after forking.
 * @param proc The resulting process handle from apr_proc_fork()
 * @remark Call this in the child after forking to mix the randomness
 * pools. Note that its generally a bad idea to fork a process with a
 * real PRNG in it - better to have the PRNG externally and get the
 * randomness from there. However, if you really must do it, then you
 * should supply all your entropy to all the PRNGs - don't worry, they
 * won't produce the same output.
 * @remark Note that apr_proc_fork() calls this for you, so only weird
 * applications need ever call it themselves.
 * @internal
  }
procedure apr_random_after_fork(proc:Papr_proc_t);cdecl;external libapr;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !APR_RANDOM_H  }

// === Konventiert am: 10-9-26 16:50:17 ===


implementation



end.
