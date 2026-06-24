program project1;

uses
  gtypes,       // Alte gtypes.inc übernommen,   ckd_add, etc überürüfen

  garray,
  gbytes,
  glist,
  gslist,
  gasyncqueue,
  gatomic,
  gbacktrace,
  gbase64,
  gbitlock,
  gquark,
  gerror,
  gtimezone,
  gdatetime,
  gbookmarkfile,
  gcharset,
  gchecksum,
  gconvert,
  gdataset,
  gdate,
  gdir,
  genviron,
  gfileutils,
  ggettext,
  ghash,
  ghmac,
  ghook,
  ghostutils,
  gunicode,
  gstring,
  gpoll,
  gthread,
  gmain,
  giochannel,
  gkeyfile,
  gmappedfile,
  gmarkup,
  gmem,
  gvarianttype,
  gvariant,
  gmessages,
  gnode,
  goption,
  gpathbuf,
  gpattern,
  gprimes,
  gprintf,
  gqsort,
  gqueue,
  grand,
  grcbox,
  grefcount,
  grefstring,
  gregex,
  gscanner,
  gsequence,
  gshell,
  gslice,
  gspawn,
  gstdio,
  gtestutils,
  gstrfuncs,             // g_test_queue_unref ???
  gstringchunk,
  gstrvbuilder,
  gthreadpool,
  gtimer,
  gtrashstack,
  gtree,
  guri,
  gutils,
  guuid,
  gversion,
  gversionmacros,

  common_GLIB;

  procedure main;
  var
    list: PPgchar;
    i: integer = 0;
    v: Pgchar;
  begin
    list := g_listenv;
    if list <> nil then begin
      while list[i] <> nil do begin
        v := g_getenv(list[i]);
        g_printf('%3d. %-30s   %s'#10, i, list[i], v);
        Inc(i);
      end;
      g_free(list);
    end;
  end;

begin
  main;
end.
