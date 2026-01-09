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

  MagickCore splay-tree methods.
*/
#ifndef MAGICKCORE_SPLAY_H
#define MAGICKCORE_SPLAY_H

typedef struct _SplayTreeInfo
  SplayTreeInfo;

extern  MagickBooleanType
  AddValueToSplayTree(SplayTreeInfo *,const void *,const void *);
extern  MagickBooleanType
  DeleteNodeByValueFromSplayTree(SplayTreeInfo *,const void *);
extern  MagickBooleanType
  DeleteNodeFromSplayTree(SplayTreeInfo *,const void *);

extern  const void
  *GetNextKeyInSplayTree(SplayTreeInfo *);
extern  const void
  *GetNextValueInSplayTree(SplayTreeInfo *);
extern  const void
  *GetRootValueFromSplayTree(SplayTreeInfo *);
extern  const void
  *GetValueFromSplayTree(SplayTreeInfo *,const void *);

extern  int
  CompareSplayTreeString(const void *,const void *);
extern  int
  CompareSplayTreeStringInfo(const void *,const void *);

extern  SplayTreeInfo
  *CloneSplayTree(SplayTreeInfo *,void *(*)(void *),void *(*)(void *));
extern  SplayTreeInfo
  *DestroySplayTree(SplayTreeInfo *);
extern  SplayTreeInfo
  *NewSplayTree(int (*)(const void *,const void *),void *(*)(void *),    void *(*)(void *));

extern  size_t
  GetNumberOfNodesInSplayTree(const SplayTreeInfo *);

extern  void
  *RemoveNodeByValueFromSplayTree(SplayTreeInfo *,const void *);
extern  void
  *RemoveNodeFromSplayTree(SplayTreeInfo *,const void *);
extern  void
  ResetSplayTree(SplayTreeInfo *);
extern  void
  ResetSplayTreeIterator(SplayTreeInfo *);

