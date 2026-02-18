/*<html><pre>  -<a                             href="qh-set.htm"
  >-------------------------------</a><a name="TOP">-</a>

   qset.h
     header file for qset.c that implements set

   see qh-set.htm and qset.c

   only uses mem.c, malloc/free

   for error handling, writes message and calls
      qh_errexit(qhmem_ERRqhull, NULL, NULL);

   set operations satisfy the following properties:
    - sets have a max size, the actual size (if different) is stored at the end
    - every set is NULL terminated
    - sets may be sorted or unsorted, the caller must distinguish this

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/qset.h#4 $$Change: 2953 $
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

/* [jan'15] Decided not to use countT.  Most sets are small.  The code uses signed tests */

/*-<a                                      href="qh-set.htm#TOC"
>----------------------------------------</a><a name="setT">-</a>

setT
  a set or list of pointers with maximum size and actual size.

variations:
  unsorted, unique   -- a list of unique pointers with NULL terminator
                           user guarantees uniqueness
  sorted             -- a sorted list of unique pointers with NULL terminator
                           qset.c guarantees uniqueness
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

/*-<a                                 href="qh-set.htm#TOC"
  >-----------------------------------</a><a name="SETelemsize">-</a>

  SETelemsize
    size of a set element in bytes
*/
#define SETelemsize ((int)sizeof(setelemT))



/*======= prototypes in alphabetical order ============*/

void  qh_setaddsorted(setT **setp, void *elem);
void  qh_setaddnth(setT **setp, int nth, void *newelem);
void  qh_setappend(setT **setp, void *elem);
void  qh_setappend_set(setT **setp, setT *setA);
void  qh_setappend2ndlast(setT **setp, void *elem);
void  qh_setcheck(setT *set, const char *tname, unsigned int id);
void  qh_setcompact(setT *set);
setT *qh_setcopy(setT *set, int extra);
void *qh_setdel(setT *set, void *elem);
void *qh_setdellast(setT *set);
void *qh_setdelnth(setT *set, int nth);
void *qh_setdelnthsorted(setT *set, int nth);
void *qh_setdelsorted(setT *set, void *newelem);
setT *qh_setduplicate(setT *set, int elemsize);
void **qh_setendpointer(setT *set);
int   qh_setequal(setT *setA, setT *setB);
int   qh_setequal_except(setT *setA, void *skipelemA, setT *setB, void *skipelemB);
int   qh_setequal_skip(setT *setA, int skipA, setT *setB, int skipB);
void  qh_setfree(setT **set);
void  qh_setfree2(setT **setp, int elemsize);
void  qh_setfreelong(setT **set);
int   qh_setin(setT *set, void *setelem);
int   qh_setindex(setT *set, void *setelem);
void  qh_setlarger(setT **setp);
int   qh_setlarger_quick(int setsize, int *newsize);
void *qh_setlast(setT *set);
setT *qh_setnew(int size);
setT *qh_setnew_delnthsorted(setT *set, int size, int nth, int prepend);
void  qh_setprint(FILE *fp, const char* string, setT *set);
void  qh_setreplace(setT *set, void *oldelem, void *newelem);
int   qh_setsize(setT *set);
setT *qh_settemp(int setsize);
void  qh_settempfree(setT **set);
void  qh_settempfree_all(void);
setT *qh_settemppop(void);
void  qh_settemppush(setT *set);
void  qh_settruncate(setT *set, int size);
int   qh_setunique(setT **set, void *elem);
void  qh_setzero(setT *set, int idx, int size);

#endif /* qhDEFset */
