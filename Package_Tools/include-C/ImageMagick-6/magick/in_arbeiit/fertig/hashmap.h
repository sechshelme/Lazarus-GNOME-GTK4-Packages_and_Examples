/*
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore hash methods.
*/
#ifndef MAGICKCORE_HASHMAP_H
#define MAGICKCORE_HASHMAP_H


#define SmallHashmapSize  17
#define MediumHashmapSize  509
#define LargeHashmapSize  8191
#define HugeHashmapSize  131071

typedef struct _HashmapInfo
  HashmapInfo;

typedef struct _LinkedListInfo
  LinkedListInfo;

extern HashmapInfo
  *DestroyHashmap(HashmapInfo *);
extern HashmapInfo
  *NewHashmap(const size_t,size_t (*)(const void *),MagickBooleanType (*) (const void *,const void *),void *(*)(void *),void *(*)(void *));

extern  LinkedListInfo
  *DestroyLinkedList(LinkedListInfo *,void *(*)(void *));
extern  LinkedListInfo
  *NewLinkedList(const size_t);

extern  MagickBooleanType
  AppendValueToLinkedList(LinkedListInfo *,const void *);
extern  MagickBooleanType
  CompareHashmapString(const void *,const void *);
extern  MagickBooleanType
  CompareHashmapStringInfo(const void *,const void *);
extern  MagickBooleanType
  InsertValueInLinkedList(LinkedListInfo *,const size_t,const void *);
extern  MagickBooleanType
  InsertValueInSortedLinkedList(LinkedListInfo *,
    int (*)(const void *,const void *),void **,const void *);
extern  MagickBooleanType
  IsHashmapEmpty(const HashmapInfo *);
extern  MagickBooleanType
  IsLinkedListEmpty(const LinkedListInfo *);
extern  MagickBooleanType
  LinkedListToArray(LinkedListInfo *,void **);
extern  MagickBooleanType
  PutEntryInHashmap(HashmapInfo *,const void *,const void *);

extern  size_t
  GetNumberOfElementsInLinkedList(const LinkedListInfo *);
extern  size_t
  GetNumberOfEntriesInHashmap(const HashmapInfo *);
extern  size_t
  HashPointerType(const void *);
extern  size_t
  HashStringType(const void *);
extern  size_t
  HashStringInfoType(const void *);

extern  void
  ClearLinkedList(LinkedListInfo *,void *(*)(void *));
extern  void
  *GetLastValueInLinkedList(LinkedListInfo *);
extern  void
  *GetNextKeyInHashmap(HashmapInfo *);
extern  void
  *GetNextValueInHashmap(HashmapInfo *);
extern  void
  *GetNextValueInLinkedList(LinkedListInfo *);
extern  void
  *GetValueFromHashmap(HashmapInfo *,const void *);
extern  void
  *GetValueFromLinkedList(LinkedListInfo *,const size_t);
extern  void
  *RemoveElementByValueFromLinkedList(LinkedListInfo *,const void *);
extern  void
  *RemoveElementFromLinkedList(LinkedListInfo *,const size_t);
extern  void
  *RemoveEntryFromHashmap(HashmapInfo *,const void *);
extern  void
  *RemoveLastElementFromLinkedList(LinkedListInfo *);
extern  void
  ResetHashmapIterator(HashmapInfo *);
extern  void
  ResetLinkedListIterator(LinkedListInfo *);


#endif
