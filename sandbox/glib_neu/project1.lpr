program project1;

// diff /usr/include/glib-2.0/glib/gtypes.h /home/tux/include_neu/glib-2.0/glib/gtypes.h > test.diff
// diff /usr/include/glib-2.0/glib/gdatetime.h /home/tux/include_neu/glib-2.0/glib/gdatetime.h > test.diff
// diff /usr/include/glib-2.0/glib/gdataset.h /home/tux/include_neu/glib-2.0/glib/gdataset.h > test.diff

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

gthread,            // makros
gmain,               // enum
giochannel,

//gkeyfile,
//gmappedfile,
//gmarkup,
//gmem,
//gmessages,
//gnode,
//goption,
//gpathbuf,
//gpattern,
//gprimes,
//gprintf,
//gqsort,
//gqueue,
//grand,
//grcbox,
//grefcount,
//grefstring,
//gregex,
//gscanner,
//gsequence,
//gshell,
//gslice,
//gspawn,
//gstdio,
//gstrfuncs,
//gstringchunk,
//gstrvbuilder,
//gtestutils,
//gthreadpool,
//gtimer,
//gtrashstack,
//gtree,
//guri,
//gutils,
//guuid,
//gvariant,
//gvarianttype,
//gversion,
//gversionmacros,

common_GLIB;

begin

end.

