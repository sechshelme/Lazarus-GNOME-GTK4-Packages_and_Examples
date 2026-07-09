program project1;

// diff /usr/include/glib-2.0/gio/gioenumtypes.h /home/tux/include_neu/gtk-4.0/gdk/gdkenumtypes.h > test.diff

// diff -U 1 -r /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/glib-2.80.0/C-include/gio-unix-2.80.0 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/glib-2.88.0/C-include/gio-unix-2.0 > test.diff
// diff -U 1 /usr/include/glib-2.0/girepository /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Package_Tools/include-C/Ubuntu_26.04/girepository > test.diff

// diff -U 1 /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2024/gtk-4.14.2/C-include/gtk/gtkslicelistmodel.h /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/Packages_2026/gtk-4.22.4/C-include/gtk-4.0/gtk/gtkslicelistmodel.h > test.diff
uses
  gtktypes,
  gtktypebuiltins,
  gtkenums,
  gtkwidget,
  gtkwindow,
  gtkwindowgroup,
  gtkaboutdialog,
  gtkaccelgroup,
  gtkatcontext,
  gtkaccessible,
  gtkaccessibletext,
  gtkaccessiblehypertext,
  gtkaccessiblerange,
  gtkactionable,
  gtkactionbar,
  gtkadjustment,
  gtkalertdialog,
  gtkapplication,
  gtkapplicationwindow,
  gtkaspectframe,
  gtklayoutchild,
  gtklayoutmanager,           // GtkLayoutChild
  gtkbinlayout,               // GtkLayoutManager
  gtkbitset,
  gtkbookmarklist,
  gtkexpression,
  gtkfilter,
  gtkfilterlistmodel,
  gtkboolfilter,                // GtkFilter
  gtkborder,                        //  gtk_sorter_get_type failure
  gtkbox,
  gtkboxlayout,                 // GtkLayoutManager
  gtkbuilderscope,
  gtkbuilder,
  gtkbuildable,
  gtkselectionmodel,
  gtkselectionfiltermodel,
  gtklistbase,
  gtklistbox,
  gtklistheader,
  gtklistitem,
  gtklistitemfactory,
  gtklistview,
  gtkbuilderlistitemfactory,
  gtkbutton,
  gtkcalendar,
  gtkcenterbox,
  gtkcenterlayout,                // GtkLayoutManager
  gtkcheckbutton,
  gtkcolordialog,
  gtkcolordialogbutton,
  gtkcolorutils,
  gtkscrollable,
  gtkscrollbar,
  gtkscrolledwindow,
  gtkscrollinfo,
  gtksorter,
  gtksortlistmodel,
  gtkcolumnviewcolumn,
  gtkcolumnview,
  gtkcolumnviewcell,
  gtkcolumnviewrow,
  gtkcolumnviewsorter,          // GtkSorter
  gtkconstraint,
  gtkconstraintguide,
  gtkconstraintlayout,          // GtkLayoutManager, GtkLayoutChild
  gtkcssprovider,
  gtkcustomfilter,              // GtkFilter
  gtkcustomlayout,              // GtkLayoutManager
  gtkcustomsorter,              // GtkSorter
  gtkdebug,
  gtkdialogerror,
  gtkdirectorylist,
  gtkdragicon,
  gtkdragsource,
  gtkdrawingarea,
  gtkimcontext,
  gtkimcontextsimple,           // GtkIMContext
  gtkimmodule,
  gtkimmulticontext,
  gtkeventcontroller,
  gtkeventcontrollerfocus,
  gtkeventcontrollerkey,
  gtkeventcontrollerlegacy,
  gtkeventcontrollermotion,
  gtkeventcontrollerscroll,
  gtkdropcontrollermotion,
  gtkstringfilter,           // GtkFilter
  gtkstringlist,
  gtkstringsorter,            // GtkSorter
  gtkdropdown,
  gtkdroptarget,
  gtkdroptargetasync,
  gtkeditable,
  gtkeditablelabel,
  gtkemojichooser,
  gtkimage,
  gtkentrybuffer,
  gtkentry,
  gtkexpander,
  gtkfilefilter,
  gtkfiledialog,
  gtkfilelauncher,
  gtkfixed,
  gtkfixedlayout,                 // gtklayoutmanagerm gtklayoutchild
  gtkflattenlistmodel,
  gtkflowbox,
  gtkfontdialog,
  gtkfontdialogbutton,
  gtkframe,
  gtkgesture,
  gtkgestureclick,
  gtkgesturedrag,
  gtkgesturelongpress,
  gtkgesturepan,
  gtkgesturerotate,
  gtkgesturesingle,
  gtkgesturestylus,
  gtkgestureswipe,
  gtkgesturezoom,
  gtkglarea,
  gtkgraphicsoffload,
  gtkgrid,
  gtkgridlayout,                // gtklayoutmanager, gtklayoutchild
  gtkgridview,
  gtkheaderbar,
  gtkiconpaintable,
  gtkicontheme,
  gtkinscription,
  gtklabel,
  gtklevelbar,
  gtklinkbutton,
  gtkmain,                  // ???      gtk_init probieren
  gtkmaplistmodel,
  gtkmediastream,
  gtkmediacontrols,
  gtkmediafile,            // GtkMediaStream
  gtkpopover,
  gtkpopoverbin,
  gtkpopovermenu,
  gtkpopovermenubar,
  gtkmenubutton,
  gtkmountoperation,
  gtkmultifilter,
  gtkmultiselection,
  gtkmultisorter,           //      GtkSorter
  gtknative,
  gtknativedialog,
  gtknoselection,
  gtknotebook,
  gtknumericsorter,             // GtkSorter
  gtkorientable,
  gtkoverlay,
  gtkoverlaylayout,           // gtklayoutmanager, gtklayoutchild
  gtkpadcontroller,
  gtkpaned,
  gtkpasswordentry,
  gtkpasswordentrybuffer,    // GtkEntryBuffer
  gtkpicture,
  gtkprintdialog,
  gtkprogressbar,
  gtkrange,
  gtkrecentmanager,
  gtkrevealer,
  gtkroot,
  gtkscale,                      // GtkRange
  gtkscalebutton,
  gtksearchbar,
  gtksearchentry,
  gtksectionmodel,
  gtkseparator,
  gtksettings,
  gtkshortcut,
  gtkshortcutaction,
  gtkshortcutcontroller,
  gtkshortcutmanager,
  gtkshortcuttrigger,
  gtksignallistitemfactory,
  gtksingleselection,
  gtksizegroup,
  gtksizerequest,
  gtkslicelistmodel,
  gtksnapshot,

  gtkspinbutton,
  gtkspinner,
  gtkstack,
  gtkstacksidebar,
  gtkstackswitcher,
  gtkstyleprovider,
  gtksvg,
  gtkswitch,
  gtksymbolicpaintable,
  gtktestatcontext,
  gtktestutils,
  gtktext,
  gtktextbuffer,
  gtktextchild,
  gtktextiter,
  gtktextmark,
  gtktexttag,
  gtktexttagtable,
  gtktextview,
  gtktogglebutton,
  gtktooltip,
  gtktreeexpander,
  gtktreelistmodel,
  gtktreelistrowsorter,
  gtkurilauncher,
  gtkversion,
  gtkvideo,
  gtkviewport,
  gtkwidgetpaintable,
  gtkwindowcontrols,
  gtkwindowhandle,



  fp_girepository_2,
  fp_glib_unix,
  fp_gio_unix_2,
  fp_GTK4,
  fp_glib2;

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
