
unit H5Epubgen;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5Epubgen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5Epubgen.h
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


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  }
{ Generated automatically by bin/make_err -- do not edit  }
{ Add new errors to H5err.txt file  }
{$ifndef H5Epubgen_H}
{$define H5Epubgen_H}
{ C++ extern C conditionnal removed }
{******************* }
{ Major error codes  }
{******************* }
  var
    H5E_FUNC_g : Thid_t;cvar;external;
{ Function entry/exit  }
    H5E_FILE_g : Thid_t;cvar;external;
{ File accessibility  }
    H5E_SOHM_g : Thid_t;cvar;external;
{ Shared Object Header Messages  }
    H5E_SYM_g : Thid_t;cvar;external;
{ Symbol table  }
    H5E_PLUGIN_g : Thid_t;cvar;external;
{ Plugin for dynamically loaded library  }
    H5E_VFL_g : Thid_t;cvar;external;
{ Virtual File Layer  }
    H5E_INTERNAL_g : Thid_t;cvar;external;
{ Internal error (too specific to document in detail)  }
    H5E_BTREE_g : Thid_t;cvar;external;
{ B-Tree node  }
    H5E_REFERENCE_g : Thid_t;cvar;external;
{ References  }
    H5E_DATASPACE_g : Thid_t;cvar;external;
{ Dataspace  }
    H5E_RESOURCE_g : Thid_t;cvar;external;
{ Resource unavailable  }
    H5E_RS_g : Thid_t;cvar;external;
{ Reference Counted Strings  }
    H5E_FARRAY_g : Thid_t;cvar;external;
{ Fixed Array  }
    H5E_HEAP_g : Thid_t;cvar;external;
{ Heap  }
    H5E_ATTR_g : Thid_t;cvar;external;
{ Attribute  }
    H5E_IO_g : Thid_t;cvar;external;
{ Low-level I/O  }
    H5E_EFL_g : Thid_t;cvar;external;
{ External file list  }
    H5E_TST_g : Thid_t;cvar;external;
{ Ternary Search Trees  }
    H5E_PAGEBUF_g : Thid_t;cvar;external;
{ Page Buffering  }
    H5E_FSPACE_g : Thid_t;cvar;external;
{ Free Space Manager  }
    H5E_DATASET_g : Thid_t;cvar;external;
{ Dataset  }
    H5E_STORAGE_g : Thid_t;cvar;external;
{ Data storage  }
    H5E_LINK_g : Thid_t;cvar;external;
{ Links  }
    H5E_PLIST_g : Thid_t;cvar;external;
{ Property lists  }
    H5E_DATATYPE_g : Thid_t;cvar;external;
{ Datatype  }
    H5E_OHDR_g : Thid_t;cvar;external;
{ Object header  }
    H5E_ATOM_g : Thid_t;cvar;external;
{ Object atom  }
    H5E_NONE_MAJOR_g : Thid_t;cvar;external;
{ No error  }
    H5E_SLIST_g : Thid_t;cvar;external;
{ Skip Lists  }
    H5E_ARGS_g : Thid_t;cvar;external;
{ Invalid arguments to routine  }
    H5E_CONTEXT_g : Thid_t;cvar;external;
{ API Context  }
    H5E_EARRAY_g : Thid_t;cvar;external;
{ Extensible Array  }
    H5E_PLINE_g : Thid_t;cvar;external;
{ Data filters  }
    H5E_ERROR_g : Thid_t;cvar;external;
{ Error API  }
    H5E_CACHE_g : Thid_t;cvar;external;
{ Object cache  }
{******************* }
{ Minor error codes  }
{******************* }
{ Generic low-level file I/O errors  }
    H5E_SEEKERROR_g : Thid_t;cvar;external;
{ Seek failed  }
    H5E_READERROR_g : Thid_t;cvar;external;
{ Read failed  }
    H5E_WRITEERROR_g : Thid_t;cvar;external;
{ Write failed  }
    H5E_CLOSEERROR_g : Thid_t;cvar;external;
{ Close failed  }
    H5E_OVERFLOW_g : Thid_t;cvar;external;
{ Address overflowed  }
    H5E_FCNTL_g : Thid_t;cvar;external;
{ File control (fcntl) failed  }
{ Resource errors  }
    H5E_NOSPACE_g : Thid_t;cvar;external;
{ No space available for allocation  }
    H5E_CANTALLOC_g : Thid_t;cvar;external;
{ Can't allocate space  }
    H5E_CANTCOPY_g : Thid_t;cvar;external;
{ Unable to copy object  }
    H5E_CANTFREE_g : Thid_t;cvar;external;
{ Unable to free object  }
    H5E_ALREADYEXISTS_g : Thid_t;cvar;external;
{ Object already exists  }
    H5E_CANTLOCK_g : Thid_t;cvar;external;
{ Unable to lock object  }
    H5E_CANTUNLOCK_g : Thid_t;cvar;external;
{ Unable to unlock object  }
    H5E_CANTGC_g : Thid_t;cvar;external;
{ Unable to garbage collect  }
    H5E_CANTGETSIZE_g : Thid_t;cvar;external;
{ Unable to compute size  }
    H5E_OBJOPEN_g : Thid_t;cvar;external;
{ Object is already open  }
{ Heap errors  }
    H5E_CANTRESTORE_g : Thid_t;cvar;external;
{ Can't restore condition  }
    H5E_CANTCOMPUTE_g : Thid_t;cvar;external;
{ Can't compute value  }
    H5E_CANTEXTEND_g : Thid_t;cvar;external;
{ Can't extend heap's space  }
    H5E_CANTATTACH_g : Thid_t;cvar;external;
{ Can't attach object  }
    H5E_CANTUPDATE_g : Thid_t;cvar;external;
{ Can't update object  }
    H5E_CANTOPERATE_g : Thid_t;cvar;external;
{ Can't operate on object  }
{ Function entry/exit interface errors  }
    H5E_CANTINIT_g : Thid_t;cvar;external;
{ Unable to initialize object  }
    H5E_ALREADYINIT_g : Thid_t;cvar;external;
{ Object already initialized  }
    H5E_CANTRELEASE_g : Thid_t;cvar;external;
{ Unable to release object  }
{ Property list errors  }
    H5E_CANTGET_g : Thid_t;cvar;external;
{ Can't get value  }
    H5E_CANTSET_g : Thid_t;cvar;external;
{ Can't set value  }
    H5E_DUPCLASS_g : Thid_t;cvar;external;
{ Duplicate class name in parent class  }
    H5E_SETDISALLOWED_g : Thid_t;cvar;external;
{ Disallowed operation  }
{ Free space errors  }
    H5E_CANTMERGE_g : Thid_t;cvar;external;
{ Can't merge objects  }
    H5E_CANTREVIVE_g : Thid_t;cvar;external;
{ Can't revive object  }
    H5E_CANTSHRINK_g : Thid_t;cvar;external;
{ Can't shrink container  }
{ Object header related errors  }
    H5E_LINKCOUNT_g : Thid_t;cvar;external;
{ Bad object header link count  }
    H5E_VERSION_g : Thid_t;cvar;external;
{ Wrong version number  }
    H5E_ALIGNMENT_g : Thid_t;cvar;external;
{ Alignment error  }
    H5E_BADMESG_g : Thid_t;cvar;external;
{ Unrecognized message  }
    H5E_CANTDELETE_g : Thid_t;cvar;external;
{ Can't delete message  }
    H5E_BADITER_g : Thid_t;cvar;external;
{ Iteration failed  }
    H5E_CANTPACK_g : Thid_t;cvar;external;
{ Can't pack messages  }
    H5E_CANTRESET_g : Thid_t;cvar;external;
{ Can't reset object  }
    H5E_CANTRENAME_g : Thid_t;cvar;external;
{ Unable to rename object  }
{ System level errors  }
    H5E_SYSERRSTR_g : Thid_t;cvar;external;
{ System error message  }
{ I/O pipeline errors  }
    H5E_NOFILTER_g : Thid_t;cvar;external;
{ Requested filter is not available  }
    H5E_CALLBACK_g : Thid_t;cvar;external;
{ Callback failed  }
    H5E_CANAPPLY_g : Thid_t;cvar;external;
{ Error from filter 'can apply' callback  }
    H5E_SETLOCAL_g : Thid_t;cvar;external;
{ Error from filter 'set local' callback  }
    H5E_NOENCODER_g : Thid_t;cvar;external;
{ Filter present but encoding disabled  }
    H5E_CANTFILTER_g : Thid_t;cvar;external;
{ Filter operation failed  }
{ Group related errors  }
    H5E_CANTOPENOBJ_g : Thid_t;cvar;external;
{ Can't open object  }
    H5E_CANTCLOSEOBJ_g : Thid_t;cvar;external;
{ Can't close object  }
    H5E_COMPLEN_g : Thid_t;cvar;external;
{ Name component is too long  }
    H5E_PATH_g : Thid_t;cvar;external;
{ Problem with path to object  }
{ No error  }
    H5E_NONE_MINOR_g : Thid_t;cvar;external;
{ No error  }
{ Plugin errors  }
    H5E_OPENERROR_g : Thid_t;cvar;external;
{ Can't open directory or file  }
{ File accessibility errors  }
    H5E_FILEEXISTS_g : Thid_t;cvar;external;
{ File already exists  }
    H5E_FILEOPEN_g : Thid_t;cvar;external;
{ File already open  }
    H5E_CANTCREATE_g : Thid_t;cvar;external;
{ Unable to create file  }
    H5E_CANTOPENFILE_g : Thid_t;cvar;external;
{ Unable to open file  }
    H5E_CANTCLOSEFILE_g : Thid_t;cvar;external;
{ Unable to close file  }
    H5E_NOTHDF5_g : Thid_t;cvar;external;
{ Not an HDF5 file  }
    H5E_BADFILE_g : Thid_t;cvar;external;
{ Bad file ID accessed  }
    H5E_TRUNCATED_g : Thid_t;cvar;external;
{ File has been truncated  }
    H5E_MOUNT_g : Thid_t;cvar;external;
{ File mount error  }
    H5E_CANTLOCKFILE_g : Thid_t;cvar;external;
{ Unable to lock file  }
    H5E_CANTUNLOCKFILE_g : Thid_t;cvar;external;
{ Unable to unlock file  }
{ Object atom related errors  }
    H5E_BADATOM_g : Thid_t;cvar;external;
{ Unable to find atom information (already closed?)  }
    H5E_BADGROUP_g : Thid_t;cvar;external;
{ Unable to find ID group information  }
    H5E_CANTREGISTER_g : Thid_t;cvar;external;
{ Unable to register new atom  }
    H5E_CANTINC_g : Thid_t;cvar;external;
{ Unable to increment reference count  }
    H5E_CANTDEC_g : Thid_t;cvar;external;
{ Unable to decrement reference count  }
    H5E_NOIDS_g : Thid_t;cvar;external;
{ Out of IDs for group  }
{ Cache related errors  }
    H5E_CANTFLUSH_g : Thid_t;cvar;external;
{ Unable to flush data from cache  }
    H5E_CANTUNSERIALIZE_g : Thid_t;cvar;external;
{ Unable to mark metadata as unserialized  }
    H5E_CANTSERIALIZE_g : Thid_t;cvar;external;
{ Unable to serialize data from cache  }
    H5E_CANTTAG_g : Thid_t;cvar;external;
{ Unable to tag metadata in the cache  }
    H5E_CANTLOAD_g : Thid_t;cvar;external;
{ Unable to load metadata into cache  }
    H5E_PROTECT_g : Thid_t;cvar;external;
{ Protected metadata error  }
    H5E_NOTCACHED_g : Thid_t;cvar;external;
{ Metadata not currently cached  }
    H5E_SYSTEM_g : Thid_t;cvar;external;
{ Internal error detected  }
    H5E_CANTINS_g : Thid_t;cvar;external;
{ Unable to insert metadata into cache  }
    H5E_CANTPROTECT_g : Thid_t;cvar;external;
{ Unable to protect metadata  }
    H5E_CANTUNPROTECT_g : Thid_t;cvar;external;
{ Unable to unprotect metadata  }
    H5E_CANTPIN_g : Thid_t;cvar;external;
{ Unable to pin cache entry  }
    H5E_CANTUNPIN_g : Thid_t;cvar;external;
{ Unable to un-pin cache entry  }
    H5E_CANTMARKDIRTY_g : Thid_t;cvar;external;
{ Unable to mark a pinned entry as dirty  }
    H5E_CANTMARKCLEAN_g : Thid_t;cvar;external;
{ Unable to mark a pinned entry as clean  }
    H5E_CANTMARKUNSERIALIZED_g : Thid_t;cvar;external;
{ Unable to mark an entry as unserialized  }
    H5E_CANTMARKSERIALIZED_g : Thid_t;cvar;external;
{ Unable to mark an entry as serialized  }
    H5E_CANTDIRTY_g : Thid_t;cvar;external;
{ Unable to mark metadata as dirty  }
    H5E_CANTCLEAN_g : Thid_t;cvar;external;
{ Unable to mark metadata as clean  }
    H5E_CANTEXPUNGE_g : Thid_t;cvar;external;
{ Unable to expunge a metadata cache entry  }
    H5E_CANTRESIZE_g : Thid_t;cvar;external;
{ Unable to resize a metadata cache entry  }
    H5E_CANTDEPEND_g : Thid_t;cvar;external;
{ Unable to create a flush dependency  }
    H5E_CANTUNDEPEND_g : Thid_t;cvar;external;
{ Unable to destroy a flush dependency  }
    H5E_CANTNOTIFY_g : Thid_t;cvar;external;
{ Unable to notify object about action  }
    H5E_LOGGING_g : Thid_t;cvar;external;
{ Failure in the cache logging framework  }
    H5E_LOGFAIL_g : Thid_t;cvar;external;
{ old H5E_LOGGING_g (maintained for binary compatibility)  }
    H5E_CANTCORK_g : Thid_t;cvar;external;
{ Unable to cork an object  }
    H5E_CANTUNCORK_g : Thid_t;cvar;external;
{ Unable to uncork an object  }
{ Link related errors  }
    H5E_TRAVERSE_g : Thid_t;cvar;external;
{ Link traversal failure  }
    H5E_NLINKS_g : Thid_t;cvar;external;
{ Too many soft links in path  }
    H5E_NOTREGISTERED_g : Thid_t;cvar;external;
{ Link class not registered  }
    H5E_CANTMOVE_g : Thid_t;cvar;external;
{ Can't move object  }
    H5E_CANTSORT_g : Thid_t;cvar;external;
{ Can't sort objects  }
{ Parallel MPI errors  }
    H5E_MPI_g : Thid_t;cvar;external;
{ Some MPI function failed  }
    H5E_MPIERRSTR_g : Thid_t;cvar;external;
{ MPI Error String  }
    H5E_CANTRECV_g : Thid_t;cvar;external;
{ Can't receive data  }
    H5E_CANTGATHER_g : Thid_t;cvar;external;
{ Can't gather data  }
    H5E_NO_INDEPENDENT_g : Thid_t;cvar;external;
{ Can't perform independent IO  }
{ Dataspace errors  }
    H5E_CANTCLIP_g : Thid_t;cvar;external;
{ Can't clip hyperslab region  }
    H5E_CANTCOUNT_g : Thid_t;cvar;external;
{ Can't count elements  }
    H5E_CANTSELECT_g : Thid_t;cvar;external;
{ Can't select hyperslab  }
    H5E_CANTNEXT_g : Thid_t;cvar;external;
{ Can't move to next iterator location  }
    H5E_BADSELECT_g : Thid_t;cvar;external;
{ Invalid selection  }
    H5E_CANTCOMPARE_g : Thid_t;cvar;external;
{ Can't compare objects  }
    H5E_INCONSISTENTSTATE_g : Thid_t;cvar;external;
{ Internal states are inconsistent  }
    H5E_CANTAPPEND_g : Thid_t;cvar;external;
{ Can't append object  }
{ Argument errors  }
    H5E_UNINITIALIZED_g : Thid_t;cvar;external;
{ Information is uinitialized  }
    H5E_UNSUPPORTED_g : Thid_t;cvar;external;
{ Feature is unsupported  }
    H5E_BADTYPE_g : Thid_t;cvar;external;
{ Inappropriate type  }
    H5E_BADRANGE_g : Thid_t;cvar;external;
{ Out of range  }
    H5E_BADVALUE_g : Thid_t;cvar;external;
{ Bad value  }
{ B-tree related errors  }
    H5E_NOTFOUND_g : Thid_t;cvar;external;
{ Object not found  }
    H5E_EXISTS_g : Thid_t;cvar;external;
{ Object already exists  }
    H5E_CANTENCODE_g : Thid_t;cvar;external;
{ Unable to encode value  }
    H5E_CANTDECODE_g : Thid_t;cvar;external;
{ Unable to decode value  }
    H5E_CANTSPLIT_g : Thid_t;cvar;external;
{ Unable to split node  }
    H5E_CANTREDISTRIBUTE_g : Thid_t;cvar;external;
{ Unable to redistribute records  }
    H5E_CANTSWAP_g : Thid_t;cvar;external;
{ Unable to swap records  }
    H5E_CANTINSERT_g : Thid_t;cvar;external;
{ Unable to insert object  }
    H5E_CANTLIST_g : Thid_t;cvar;external;
{ Unable to list node  }
    H5E_CANTMODIFY_g : Thid_t;cvar;external;
{ Unable to modify record  }
    H5E_CANTREMOVE_g : Thid_t;cvar;external;
{ Unable to remove object  }
{ Datatype conversion errors  }
    H5E_CANTCONVERT_g : Thid_t;cvar;external;
{ Can't convert datatypes  }
    H5E_BADSIZE_g : Thid_t;cvar;external;
{ Bad size for object  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5Epubgen_H  }

implementation


end.
