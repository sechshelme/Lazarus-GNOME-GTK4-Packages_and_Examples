program project1;

uses
  fp_argp,
  fp_getopt;


const
  arg: array of pchar = ('project.exe', '-h', '-t', '-ffredy', '-ssusi', '-wblublu', '-o123', '-zabc', '-q');


  procedure main;
  var
    opt: integer = 0;
  begin
    repeat
      //            opt:=getopt(argc, argv,'htf:s:w:o:z:');
      opt := getopt(Length(arg), PPChar(arg), 'htqf:s:w:o:z:');
      WriteLn('optarg:  ', optarg);
      case char(opt) of
        'h': begin
          WriteLn('Hilfe anzeigen');
        end;
        't': begin
          WriteLn('t als Argument');
        end;
        'q': begin
          WriteLn('q als Argument');
        end;
        'f': begin
          WriteLn('Ein f String: ', optarg);
        end;
        's': begin
          WriteLn('Ein s String: ', optarg);
        end;
        'w': begin
          WriteLn('Ein w String: ', optarg);
        end;
        'z': begin
          WriteLn('Ein z String: ', optarg);
        end;
        'o': begin
          WriteLn('Ein o String: ', optarg);
        end;
      end;
      WriteLn();
    until opt = -1;
  end;

begin
  main;
end.
