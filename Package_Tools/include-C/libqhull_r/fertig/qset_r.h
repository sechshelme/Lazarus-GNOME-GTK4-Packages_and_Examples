/*<html><pre>  -<a                             href="qh-set_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   qset_r.h
     header file for qset_r.c that implements set

   see qh-set_r.htm and qset_r.c

   only uses mem_r.c, malloc/free

   for error handling, writes message and calls
      qh_errexit(qhT *qh, qhmem_ERRqhull, NULL, NULL);

   set operations satisfy the following properties:
    - sets have a max size, the actual size (if different) is stored at the end
    - every set is NULL terminated
    - sets may be sorted or unsorted, the caller must distinguish this

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/qset_r.h#4 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
*/

#ifndef qhDEFset
#define qhDEFset 1

#include <stdio.h>

/*================= -structures- ===============*/

#ifndef DEFsetT
#define DEFsetT 1
typedef struct setT setT;   /* a set is a sorted or unsorted array of pointers */
#endif

#ifndef DEFqhT
#define DEFqhT 1
typedef struct qhT qhT;          /* defined in libqhull_r.h */
#endif

/* [jan'15] Decided not to use countT.  Most sets are small.  The code uses signed tests */

/*-<a                                      href="qh-set_r.htm#TOC"
>----------------------------------------</a><a name="setT">-</a>

setT
  a set or list of pointers with maximum size and actual size.

variations:
  unsorted, unique   -- a list of unique pointers with NULL terminator
                           user guarantees uniqueness
  sorted             -- a sorted list of unique pointers with NULL terminator
                           qset_r.c guarantees uniqueness
  unsorted           -- a list of pointers terminated with NULL
  indexed            -- an array of pointers with NULL elements

structure for set of n elements:

        --------------
        |  maxsize
        --------------
        |  e[0] - a pointer, may be NULL for indexed sets
        --------------
        |  e[1]

        --------------
        |  ...
        --------------
        |  e[n-1]
        --------------
        |  e[n] = NULL
        --------------
        |  ...
        --------------
        |  e[maxsize] - n+1 or NULL (determines actual size of set)
        --------------

*/

/*-- setelemT -- internal type to allow both pointers and indices
*/
typedef union setelemT setelemT;
union setelemT {
  void    *p;
  int   i;         /* integer used for e[maxSize] */
};

struct setT {
  int maxsize;          /* maximum number of elements (except NULL) */
  setelemT e[1];        /* array of pointers, tail is NULL */
                        /* last slot (unless NULL) is actual size+1
                           e[maxsize]==NULL or e[e[maxsize]-1]==NULL */
                        /* this may generate a warning since e[] contains
                           maxsize elements */
};

/*=========== -constants- =========================*/

/*-<a                                 href="qh-set_r.htm#TOC"
  >-----------------------------------</a><a name="SETelemsize">-</a>

  SETelemsize
    size of a set element in bytes
*/
#define SETelemsize ((int)sizeof(setelemT))



void  qh_setaddsorted(qhT *qh, setT **setp, void *elem);
void  qh_setaddnth(qhT *qh, setT **setp, int nth, void *newelem);
void  qh_setappend(qhT *qh, setT **setp, void *elem);
void  qh_setappend_set(qhT *qh, setT **setp, setT *setA);
void  qh_setappend2ndlast(qhT *qh, setT **setp, void *elem);
void  qh_setcheck(qhT *qh, setT *set, const char *tname, unsigned int id);
void  qh_setcompact(qhT *qh, setT *set);
setT *qh_setcopy(qhT *qh, setT *set, int extra);
void *qh_setdel(setT *set, void *elem);
void *qh_setdellast(setT *set);
void *qh_setdelnth(qhT *qh, setT *set, int nth);
void *qh_setdelnthsorted(qhT *qh, setT *set, int nth);
void *qh_setdelsorted(setT *set, void *newelem);
setT *qh_setduplicate(qhT *qh, setT *set, int elemsize);
void **qh_setendpointer(setT *set);
int   qh_setequal(setT *setA, setT *setB);
int   qh_setequal_except(setT *setA, void *skipelemA, setT *setB, void *skipelemB);
int   qh_setequal_skip(setT *setA, int skipA, setT *setB, int skipB);
void  qh_setfree(qhT *qh, setT **set);
void  qh_setfree2(qhT *qh, setT **setp, int elemsize);
void  qh_setfreelong(qhT *qh, setT **set);
int   qh_setin(setT *set, void *setelem);
int   qh_setindex(setT *set, void *setelem);
void  qh_setlarger(qhT *qh, setT **setp);
int   qh_setlarger_quick(qhT *qh, int setsize, int *newsize);
void *qh_setlast(setT *set);
setT *qh_setnew(qhT *qh, int size);
setT *qh_setnew_delnthsorted(qhT *qh, setT *set, int size, int nth, int prepend);
void  qh_setprint(qhT *qh, FILE *fp, const char* string, setT *set);
void  qh_setreplace(qhT *qh, setT *set, void *oldelem, void *newelem);
int   qh_setsize(qhT *qh, setT *set);
setT *qh_settemp(qhT *qh, int setsize);
void  qh_settempfree(qhT *qh, setT **set);
void  qh_settempfree_all(qhT *qh);
setT *qh_settemppop(qhT *qh);
void  qh_settemppush(qhT *qh, setT *set);
void  qh_settruncate(qhT *qh, setT *set, int size);
int   qh_setunique(qhT *qh, setT **set, void *elem);
void  qh_setzero(qhT *qh, setT *set, int idx, int size);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* qhDEFset */
