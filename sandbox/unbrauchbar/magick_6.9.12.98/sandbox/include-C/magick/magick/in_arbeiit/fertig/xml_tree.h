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

  Magick's toolkit xml-tree methods.
*/
#ifndef MAGICKCORE_XML_TREE_H
#define MAGICKCORE_XML_TREE_H

#include "magick/exception.h"
#include "magick/splay-tree.h"

typedef struct _XMLTreeInfo
  XMLTreeInfo;

extern  char
  *CanonicalXMLContent(const char *,const MagickBooleanType);
extern  char
  *XMLTreeInfoToXML(XMLTreeInfo *);

extern  const char
  *GetXMLTreeAttribute(XMLTreeInfo *,const char *);
extern  const char
  *GetXMLTreeContent(XMLTreeInfo *);
extern  const char
  **GetXMLTreeProcessingInstructions(XMLTreeInfo *,const char *);
extern  const char
  *GetXMLTreeTag(XMLTreeInfo *);

extern  MagickBooleanType
  GetXMLTreeAttributes(const XMLTreeInfo *,SplayTreeInfo *);

extern  XMLTreeInfo
  *AddChildToXMLTree(XMLTreeInfo *,const char *,const size_t);
extern  XMLTreeInfo
  *AddPathToXMLTree(XMLTreeInfo *,const char *,const size_t);
extern  XMLTreeInfo
  *DestroyXMLTree(XMLTreeInfo *);
extern  XMLTreeInfo
  *GetNextXMLTreeTag(XMLTreeInfo *);
extern  XMLTreeInfo
  *GetXMLTreeChild(XMLTreeInfo *,const char *);
extern  XMLTreeInfo
  *GetXMLTreeOrdered(XMLTreeInfo *);
extern  XMLTreeInfo
  *GetXMLTreePath(XMLTreeInfo *,const char *);
extern  XMLTreeInfo
  *GetXMLTreeSibling(XMLTreeInfo *);
extern  XMLTreeInfo
  *InsertTagIntoXMLTree(XMLTreeInfo *,XMLTreeInfo *,const size_t);
extern  XMLTreeInfo
  *NewXMLTree(const char *,ExceptionInfo *);
extern  XMLTreeInfo
  *NewXMLTreeTag(const char *);
extern  XMLTreeInfo
  *ParseTagFromXMLTree(XMLTreeInfo *);
extern  XMLTreeInfo
  *PruneTagFromXMLTree(XMLTreeInfo *);
extern  XMLTreeInfo
  *SetXMLTreeAttribute(XMLTreeInfo *,const char *,const char *);
extern  XMLTreeInfo
  *SetXMLTreeContent(XMLTreeInfo *,const char *);


