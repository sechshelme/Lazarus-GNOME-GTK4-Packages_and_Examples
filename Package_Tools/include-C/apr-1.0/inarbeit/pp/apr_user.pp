
unit apr_user;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_user.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_user.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Papr_gid_t  = ^apr_gid_t;
Papr_pool_t  = ^apr_pool_t;
Papr_uid_t  = ^apr_uid_t;
Pchar  = ^char;
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
{$ifndef APR_USER_H}
{$define APR_USER_H}
{*
 * @file apr_user.h
 * @brief APR User ID Services 
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{$include "apr_pools.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_user User and Group ID Services
 * @ingroup APR 
 * @
  }
{*
 * Structure for determining user ownership.
  }
{$ifdef WIN32}
type
  Papr_uid_t = ^Tapr_uid_t;
  Tapr_uid_t = TPSID;
{$else}
type
  Papr_uid_t = ^Tapr_uid_t;
  Tapr_uid_t = Tuid_t;
{$endif}
{*
 * Structure for determining group ownership.
  }
{$ifdef WIN32}
type
  Papr_gid_t = ^Tapr_gid_t;
  Tapr_gid_t = TPSID;
{$else}
type
  Papr_gid_t = ^Tapr_gid_t;
  Tapr_gid_t = Tgid_t;
{$endif}
{$if APR_HAS_USER }
{*
 * Get the userid (and groupid) of the calling process
 * @param userid   Returns the user id
 * @param groupid  Returns the user's group id
 * @param p The pool from which to allocate working space
 * @remark This function is available only if APR_HAS_USER is defined.
  }

function apr_uid_current(userid:Papr_uid_t; groupid:Papr_gid_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the user name for a specified userid
 * @param username Pointer to new string containing user name (on output)
 * @param userid The userid
 * @param p The pool from which to allocate the string
 * @remark This function is available only if APR_HAS_USER is defined.
  }
function apr_uid_name_get(username:PPchar; userid:Tapr_uid_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the userid (and groupid) for the specified username
 * @param userid   Returns the user id
 * @param groupid  Returns the user's group id
 * @param username The username to look up
 * @param p The pool from which to allocate working space
 * @remark This function is available only if APR_HAS_USER is defined.
  }
(* Const before type ignored *)
function apr_uid_get(userid:Papr_uid_t; groupid:Papr_gid_t; username:Pchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the home directory for the named user
 * @param dirname Pointer to new string containing directory name (on output)
 * @param username The named user
 * @param p The pool from which to allocate the string
 * @remark This function is available only if APR_HAS_USER is defined.
  }
(* Const before type ignored *)
function apr_uid_homepath_get(dirname:PPchar; username:Pchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Compare two user identifiers for equality.
 * @param left One uid to test
 * @param right Another uid to test
 * @return APR_SUCCESS if the apr_uid_t structures identify the same user,
 * APR_EMISMATCH if not, APR_BADARG if an apr_uid_t is invalid.
 * @remark This function is available only if APR_HAS_USER is defined.
  }
{$if defined(WIN32)}

function apr_uid_compare(left:Tapr_uid_t; right:Tapr_uid_t):Tapr_status_t;cdecl;external;
{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function apr_uid_compare(left,right : longint) : longint;

{$endif}
{*
 * Get the group name for a specified groupid
 * @param groupname Pointer to new string containing group name (on output)
 * @param groupid The groupid
 * @param p The pool from which to allocate the string
 * @remark This function is available only if APR_HAS_USER is defined.
  }

function apr_gid_name_get(groupname:PPchar; groupid:Tapr_gid_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the groupid for a specified group name
 * @param groupid Pointer to the group id (on output)
 * @param groupname The group name to look up
 * @param p The pool from which to allocate the string
 * @remark This function is available only if APR_HAS_USER is defined.
  }
(* Const before type ignored *)
function apr_gid_get(groupid:Papr_gid_t; groupname:Pchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Compare two group identifiers for equality.
 * @param left One gid to test
 * @param right Another gid to test
 * @return APR_SUCCESS if the apr_gid_t structures identify the same group,
 * APR_EMISMATCH if not, APR_BADARG if an apr_gid_t is invalid.
 * @remark This function is available only if APR_HAS_USER is defined.
  }
{$if defined(WIN32)}

function apr_gid_compare(left:Tapr_gid_t; right:Tapr_gid_t):Tapr_status_t;cdecl;external;
{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function apr_gid_compare(left,right : longint) : longint;

{$endif}
{$endif}
{ ! APR_HAS_USER  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_USER_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_uid_compare(left,right : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if left=right then
    if_local1:=APR_SUCCESS
  else
    if_local1:=APR_EMISMATCH;
  apr_uid_compare:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_gid_compare(left,right : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if left=right then
    if_local1:=APR_SUCCESS
  else
    if_local1:=APR_EMISMATCH;
  apr_gid_compare:=if_local1;
end;


end.
