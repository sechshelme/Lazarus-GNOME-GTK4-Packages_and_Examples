unit mem_r;

interface

uses
  fp_qhull_r;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-mem_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   mem_r.h
     prototypes for memory management functions

   see qh-mem_r.htm, mem_r.c and qset_r.h

   for error handling, writes message and calls
     qh_errexit(qhT *qh, qhmem_ERRmem, NULL, NULL) if insufficient memory
       and
     qh_errexit(qhT *qh, qhmem_ERRqhull, NULL, NULL) otherwise

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/mem_r.h#6 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFmem}

const
  qhDEFmem = 1;  
{$include <stdio.h>}
{$ifndef DEFsetT}

const
  DEFsetT = 1;  
type
{ defined in qset_r.h  }
{$endif}
{$ifndef DEFqhT}

const
  DEFqhT = 1;  
type
{ defined in libqhull_r.h  }
{$endif}
{-<a                             href="qh-mem_r.htm#TOC"
  >-------------------------------</a><a name="NOmem">-</a>

  qh_NOmem
    turn off quick-fit memory allocation

  notes:
    mem_r.c implements Quickfit memory allocation for about 20% time
    savings.  If it fails on your machine, try to locate the
    problem, and send the answer to qhull@qhull.org.  If this can
    not be done, define qh_NOmem to use malloc/free instead.

    #define qh_NOmem
 }
{-<a                             href="qh-mem_r.htm#TOC"
>-------------------------------</a><a name="TRACEshort">-</a>

qh_TRACEshort
Trace short and quick memory allocations at T5

 }
{$define qh_TRACEshort}
{-------------------------------------------
    to avoid bus errors, memory allocation must consider alignment requirements.
    malloc() automatically takes care of alignment.   Since mem_r.c manages
    its own memory, we need to explicitly specify alignment in
    qh_meminitbuffers().

    A safe choice is sizeof(double).  sizeof(float) may be used if doubles
    do not occur in data structures and pointers are the same size.  Be careful
    of machines (e.g., DEC Alpha) with large pointers.  If gcc is available,
    use __alignof__(double) or fmax_(__alignof__(float), __alignof__(void *)).

   see <a href="user_r.h#MEMalign">qh_MEMalign</a> in user_r.h for qhull's alignment
 }
{ matches qh_ERRmem in libqhull_r.h  }

const
  qhmem_ERRmem = 4;  
{ matches qh_ERRqhull in libqhull_r.h  }
  qhmem_ERRqhull = 5;  
{-<a                             href="qh-mem_r.htm#TOC"
  >--------------------------------</a><a name="ptr_intT">-</a>

  ptr_intT
    for casting a void * to an integer-type that holds a pointer
    Used for integer expressions (e.g., computing qh_gethash() in poly_r.c)

  notes:
    WARN64 -- these notes indicate 64-bit issues
    On 64-bit machines, a pointer may be larger than an 'int'.
    qh_meminit()/mem_r.c checks that 'ptr_intT' holds a 'void*'
    ptr_intT is typically a signed value, but not necessarily so
    size_t is typically unsigned, but should match the parameter type
    Qhull uses int instead of size_t except for system calls such as malloc, qsort, qh_malloc, etc.
    This matches Qt convention and is easier to work with.
 }
type
  Pptr_intT = ^Tptr_intT;
  Tptr_intT = int64;
{-<a                             href="qh-mem_r.htm#TOC"
  >--------------------------------</a><a name="qhmemT">-</a>

  qhmemT
    global memory structure for mem_r.c

 notes:
   users should ignore qhmem except for writing extensions
   qhmem is allocated in mem_r.c

   qhmem could be swapable like qh and qhstat, but then
   multiple qh's and qhmem's would need to keep in synch.
   A swapable qhmem would also waste memory buffers.  As long
   as memory operations are atomic, there is no problem with
   multiple qh structures being active at the same time.
   If you need separate address spaces, you can swap the
   contents of qh->qhmem.
 }
{ global memory management variables  }
{ size of memory allocation buffer  }
{ initial size of memory allocation buffer  }
{ actual number of sizes in free list table  }
{ maximum number of sizes in free list table  }
{ last size in free list table  }
{ worst-case alignment, must be 2^n-1  }
{ free list table, linked by offset 0  }
{ size of each freelist  }
{ size->index table  }
{ current buffer, linked by offset 0  }
{   free memory in curbuffer  }
{   size of freemem in bytes  }
{ stack of temporary memory, managed by users  }
{ file for reporting errors when 'qh' may be undefined  }
{ =5 if tracing memory allocations  }
{ count of quick allocations  }
{ Note: removing statistics doesn't effect speed  }
{ count of short allocations  }
{ count of long allocations  }
{ count of short memfrees  }
{ count of long memfrees  }
{ total short memory buffers minus buffer links  }
{ total dropped memory at end of short memory buffers (e.g., freesize)  }
{ total size of free, short memory on freelists  }
{ total size of long memory in use  }
{   maximum totlong  }
{ total size of short memory in use  }
{ total unused short memory (estimated, short size - request size of first allocations)  }
{ count of setlarger's  }
{ total copied by setlarger  }
  PqhmemT = ^TqhmemT;
  TqhmemT = record
      BUFsize : longint;
      BUFinit : longint;
      TABLEsize : longint;
      NUMsizes : longint;
      LASTsize : longint;
      ALIGNmask : longint;
      freelists : ^pointer;
      sizetable : Plongint;
      indextable : Plongint;
      curbuffer : pointer;
      freemem : pointer;
      freesize : longint;
      tempstack : PsetT;
      ferr : PFILE;
      IStracing : longint;
      cntquick : longint;
      cntshort : longint;
      cntlong : longint;
      freeshort : longint;
      freelong : longint;
      totbuffer : longint;
      totdropped : longint;
      totfree : longint;
      totlong : longint;
      maxlong : longint;
      totshort : longint;
      totunused : longint;
      cntlarger : longint;
      totlarger : longint;
    end;

{==================== -macros ==================== }
{-<a                             href="qh-mem_r.htm#TOC"
  >--------------------------------</a><a name="memalloc_">-</a>

  qh_memalloc_(qh, insize, freelistp, object, type)
    returns object of size bytes
        assumes size<=qh->qhmem.LASTsize and void **freelistp is a temp
 }

function qh_memalloc(qh:PqhT; insize:longint):pointer;cdecl;external libqhull_r;
procedure qh_memcheck(qh:PqhT);cdecl;external libqhull_r;
procedure qh_memfree(qh:PqhT; object:pointer; insize:longint);cdecl;external libqhull_r;
procedure qh_memfreeshort(qh:PqhT; curlong:Plongint; totlong:Plongint);cdecl;external libqhull_r;
procedure qh_meminit(qh:PqhT; ferr:PFILE);cdecl;external libqhull_r;
procedure qh_meminitbuffers(qh:PqhT; tracelevel:longint; alignment:longint; numsizes:longint; bufsize:longint; 
            bufinit:longint);cdecl;external libqhull_r;
procedure qh_memsetup(qh:PqhT);cdecl;external libqhull_r;
procedure qh_memsize(qh:PqhT; size:longint);cdecl;external libqhull_r;
procedure qh_memstatistics(qh:PqhT; fp:PFILE);cdecl;external libqhull_r;
procedure qh_memtotal(qh:PqhT; totlong:Plongint; curlong:Plongint; totshort:Plongint; curshort:Plongint; 
            maxlong:Plongint; totbuffer:Plongint);cdecl;external libqhull_r;
{$endif}
{ qhDEFmem  }

// === Konventiert am: 19-2-26 17:34:22 ===


implementation



end.
