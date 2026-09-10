
unit apr_perms_set;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_perms_set.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_perms_set.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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
{$ifndef APR_PERMS_SET_H}
{$define APR_PERMS_SET_H}
{*
 * @file apr_perms_set.h
 * @brief APR Process Locking Routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_user.h"}
{$include "apr_file_info.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_perms_set Object permission set functions
 * @ingroup APR 
 * @
  }
{* Permission set callback function.  }
type
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_PERMS_SET  }

implementation


end.
