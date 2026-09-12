unit pthreads_cross;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
Copyright John Schember <john@nachtimwald.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 }
{$ifndef __CPTHREAD_H__}
{$define __CPTHREAD_H__}
{$ifdef _WIN32}
{$include <stdbool.h>}
{$include <windows.h>}
{$else}
{$include <pthread.h>}
{$include <sched.h>}
{$endif}
{$ifdef _WIN32}
type
  Ppthread_mutex_t = ^Tpthread_mutex_t;
  Tpthread_mutex_t = TCRITICAL_SECTION;

  Ppthread_mutexattr_t = ^Tpthread_mutexattr_t;
  Tpthread_mutexattr_t = pointer;

  Ppthread_attr_t = ^Tpthread_attr_t;
  Tpthread_attr_t = pointer;

  Ppthread_condattr_t = ^Tpthread_condattr_t;
  Tpthread_condattr_t = pointer;

  Ppthread_rwlockattr_t = ^Tpthread_rwlockattr_t;
  Tpthread_rwlockattr_t = pointer;

  Ppthread_t = ^Tpthread_t;
  Tpthread_t = THANDLE;

  Ppthread_cond_t = ^Tpthread_cond_t;
  Tpthread_cond_t = TCONDITION_VARIABLE;
{ C++ extern C conditionnal removed }

function pthread_create(thread:Ppthread_t; attr:Ppthread_attr_t; start_routine:function (para1:pointer):pointer; arg:pointer):longint;cdecl;external libapriltag;
function pthread_join(thread:Tpthread_t; value_ptr:Ppointer):longint;cdecl;external libapriltag;
function pthread_detach(para1:Tpthread_t):longint;cdecl;external libapriltag;
function pthread_mutex_init(mutex:Ppthread_mutex_t; attr:Ppthread_mutexattr_t):longint;cdecl;external libapriltag;
function pthread_mutex_destroy(mutex:Ppthread_mutex_t):longint;cdecl;external libapriltag;
function pthread_mutex_lock(mutex:Ppthread_mutex_t):longint;cdecl;external libapriltag;
function pthread_mutex_unlock(mutex:Ppthread_mutex_t):longint;cdecl;external libapriltag;
function pthread_cond_init(cond:Ppthread_cond_t; attr:Ppthread_condattr_t):longint;cdecl;external libapriltag;
function pthread_cond_destroy(cond:Ppthread_cond_t):longint;cdecl;external libapriltag;
function pthread_cond_wait(cond:Ppthread_cond_t; mutex:Ppthread_mutex_t):longint;cdecl;external libapriltag;
function pthread_cond_timedwait(cond:Ppthread_cond_t; mutex:Ppthread_mutex_t; abstime:Ptimespec):longint;cdecl;external libapriltag;
function pthread_cond_signal(cond:Ppthread_cond_t):longint;cdecl;external libapriltag;
function pthread_cond_broadcast(cond:Ppthread_cond_t):longint;cdecl;external libapriltag;
function sched_yield:longint;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }
{$endif}
{ C++ extern C conditionnal removed }

function pcthread_get_num_procs:dword;cdecl;external libapriltag;
procedure ms_to_timespec(ts:Ptimespec; ms:dword);cdecl;external libapriltag;
function timespec_to_ms(abstime:Ptimespec):dword;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __CPTHREAD_H__  }

// === Konventiert am: 12-9-26 17:22:23 ===


implementation



end.
