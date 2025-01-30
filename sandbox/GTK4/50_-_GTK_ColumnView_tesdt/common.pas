unit Common;

interface

uses
  fp_glib2, fp_GTK4;

type
  THuman = record
    Index: Tgint;
    FirstName: Pgchar;
    LastName: Pgchar;
    Age: Tgint;
    Size: Tgfloat;
  end;
  PHuman = ^THuman;

const
  humanObjectKey = 'human-object';
  store_Key = 'store';
  mainWindows_Key = 'mainWindow';
  dialogWindows_Key = 'dialogWindow';

  // Dialog
  cmd_Key = 'cmd';
  cmdOk = 1000;
  cmdCancel = 1001;
  cmdApply = 1002;
  cmHelp = 1003;
  FirstName_Label_Key = 'firstNameLabel';
  LastName_Label_Key = 'lastNameLabel';
  FirstName_Entry_Key = 'firstNameEntry';
  LastName_Entry_Key = 'lastNameEntry';



implementation

end.
