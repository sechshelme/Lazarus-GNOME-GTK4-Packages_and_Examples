unit H5Epubgen;

interface

uses
  fp_hdf5, H5Ipublic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  H5E_FUNC_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SOHM_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SYM_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PLUGIN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_VFL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_INTERNAL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BTREE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_REFERENCE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_DATASPACE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_RESOURCE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_RS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FARRAY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_HEAP_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ATTR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_IO_g: Thid_t; cvar;external libhdf5_serial;
  H5E_EFL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_TST_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PAGEBUF_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FSPACE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_DATASET_g: Thid_t; cvar;external libhdf5_serial;
  H5E_STORAGE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_LINK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PLIST_g: Thid_t; cvar;external libhdf5_serial;
  H5E_DATATYPE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_OHDR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ATOM_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NONE_MAJOR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SLIST_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ARGS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CONTEXT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_EARRAY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PLINE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CACHE_g: Thid_t; cvar;external libhdf5_serial;

  H5E_SEEKERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_READERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_WRITEERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CLOSEERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_OVERFLOW_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FCNTL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOSPACE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTALLOC_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCOPY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTFREE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ALREADYEXISTS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTLOCK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNLOCK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTGC_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTGETSIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_OBJOPEN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRESTORE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCOMPUTE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTEXTEND_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTATTACH_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUPDATE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTOPERATE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTINIT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ALREADYINIT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRELEASE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTGET_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSET_g: Thid_t; cvar;external libhdf5_serial;
  H5E_DUPCLASS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SETDISALLOWED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMERGE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTREVIVE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSHRINK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_LINKCOUNT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_VERSION_g: Thid_t; cvar;external libhdf5_serial;
  H5E_ALIGNMENT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADMESG_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTDELETE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADITER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTPACK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRESET_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRENAME_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SYSERRSTR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOFILTER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CALLBACK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANAPPLY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SETLOCAL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOENCODER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTFILTER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTOPENOBJ_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCLOSEOBJ_g: Thid_t; cvar;external libhdf5_serial;
  H5E_COMPLEN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PATH_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NONE_MINOR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_OPENERROR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FILEEXISTS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_FILEOPEN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCREATE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTOPENFILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCLOSEFILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOTHDF5_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADFILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_TRUNCATED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_MOUNT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTLOCKFILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNLOCKFILE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADATOM_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADGROUP_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTREGISTER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTINC_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTDEC_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOIDS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTFLUSH_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNSERIALIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSERIALIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTTAG_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTLOAD_g: Thid_t; cvar;external libhdf5_serial;
  H5E_PROTECT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOTCACHED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_SYSTEM_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTINS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTPROTECT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNPROTECT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTPIN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNPIN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMARKDIRTY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMARKCLEAN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMARKUNSERIALIZED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMARKSERIALIZED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTDIRTY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCLEAN_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTEXPUNGE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRESIZE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTDEPEND_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNDEPEND_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTNOTIFY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_LOGGING_g: Thid_t; cvar;external libhdf5_serial;
  H5E_LOGFAIL_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCORK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTUNCORK_g: Thid_t; cvar;external libhdf5_serial;
  H5E_TRAVERSE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NLINKS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOTREGISTERED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMOVE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSORT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_MPI_g: Thid_t; cvar;external libhdf5_serial;
  H5E_MPIERRSTR_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTRECV_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTGATHER_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NO_INDEPENDENT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCLIP_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCOUNT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSELECT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTNEXT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADSELECT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCOMPARE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_INCONSISTENTSTATE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTAPPEND_g: Thid_t; cvar;external libhdf5_serial;
  H5E_UNINITIALIZED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_UNSUPPORTED_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADTYPE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADRANGE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADVALUE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_NOTFOUND_g: Thid_t; cvar;external libhdf5_serial;
  H5E_EXISTS_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTENCODE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTDECODE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSPLIT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTREDISTRIBUTE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTSWAP_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTINSERT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTLIST_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTMODIFY_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTREMOVE_g: Thid_t; cvar;external libhdf5_serial;
  H5E_CANTCONVERT_g: Thid_t; cvar;external libhdf5_serial;
  H5E_BADSIZE_g: Thid_t; cvar;external libhdf5_serial;

  // === Konventiert am: 20-8-26 19:37:19 ===


implementation



end.
