unit Common;

interface

const
  MusicDir: string = '/n4800/Multimedia/Music';
  DefaultExt = 'xml';
  CFTime = 13 * 1000; // 3s
  FITime = CFTime;
  FATime = FITime;

type
  Tcommand = (cmNone, cmNew, cmSave, cmOpen, cmClose, cmAdd, cmRemove, cmRemoveAll, cmUp, cmDown, cmPlay, cmPause, cmStop, cmNext, cmPrev, cmDefaultSongs, cmHelp, cmAbout);

  TPlayBoxEvent = procedure(cmd: Tcommand) of object;

  TcmdProp = record
    cmd: Tcommand;
    Caption: string;
    IconPath: string;
  end;
  TcmdProps = array of TcmdProp;

  // /home/tux/fpcupdeluxe_trunk/lazarus/images/general_purpose

const
  FileCmdProb: TcmdProps = (
    (cmd: cmNew; Caption: 'Neu'; IconPath: ''),
    (cmd: cmNone; Caption: '-'; IconPath: ''),
    (cmd: cmSave; Caption: 'Speichern'; IconPath: ''),
    (cmd: cmOpen; Caption: 'Öffnen'; IconPath: ''),
    (cmd: cmNone; Caption: '-'; IconPath: ''),
    (cmd: cmDefaultSongs; Caption: 'Default'; IconPath: ''),
    (cmd: cmNone; Caption: '-'; IconPath: ''),
    (cmd: cmClose; Caption: 'Beenden'; IconPath: ''));

  EditCmdProb: TcmdProps = (
    (cmd: cmAdd; Caption: 'Add'; IconPath: ''),
    (cmd: cmRemove; Caption: 'Remove'; IconPath: ''),
    (cmd: cmRemoveAll; Caption: 'Remove All'; IconPath: ''),
    (cmd: cmUp; Caption: 'Up'; IconPath: ''),
    (cmd: cmDown; Caption: 'Down'; IconPath: ''));

  PlayCmdProp: TcmdProps = (
    (cmd: cmPlay; Caption: 'Play️'; IconPath: 'Play_01_24'),
    (cmd: cmPause; Caption: 'Pause️'; IconPath: 'Pause_01_24'),
    (cmd: cmStop; Caption: 'Stop'; IconPath: 'Stop_01_24'),
    (cmd: cmNext; Caption: 'Next️'; IconPath: 'Forward_02_24'),
    (cmd: cmPrev; Caption: 'Prev'; IconPath: 'Backward_02_24'));

  HelpCmdProp: TcmdProps = (
    (cmd: cmHelp; Caption: 'Hilfe...'; IconPath: ''),
    (cmd: cmAbout; Caption: 'About...'; IconPath: ''));

implementation

end.
