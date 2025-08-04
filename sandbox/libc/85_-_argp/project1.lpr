program project1;

uses
  fp_stdio,
  fp_stdlib,
  fp_argp;

// ./project1 -v -c 5 datei1.txt datei2.txt

const
  argp_program_version = 'argp-example 1.0';
  argp_program_bug_address = '<bug-report@example.com>';

  doc = 'Ein Beispielprogramm, das argp zur Argument-Analyse verwendet.';
  args_doc = '[FILENAME]...';

  options: array[0..2] of Targp_option = (
    (name: 'verbose'; key: longint('v'); arg: nil; flags: 0; doc: 'Ausführliche Ausgabe aktivieren'; group: 0),
    (name: 'count'; key: longint('c'); arg: 'NUM'; flags: 0; doc: 'Anzahl setzen'; group: 0),
    (name: nil; key: 0; arg: nil; flags: 0; doc: nil; group: 0));

type
  Targuments = record
    verbose: boolean;
    count: integer;
    files: PPChar;
    files_count: integer;
  end;
  Parguments = ^Targuments;

  function parse_opt(key: integer; arg: pchar; state: Pargp_state): Terror_t; cdecl;
  var
    arguments: Parguments;
  begin
    arguments := state^.input;
    case key of
      integer('v'): begin
        arguments^.verbose := True;
      end;
      integer('c'): begin
        arguments^.count := atoi(arg);
      end;
      ARGP_KEY_ARG: begin
        arguments^.files := @state^.argv[state^.next - 1];
        arguments^.files_count := state^.argc - state^.next + 1;
        state^.next := state^.argc;
      end;
      ARGP_KEY_END: begin
        if arguments^.files_count = 0 then  begin
          argp_error(state, 'Mindestens eine Datei muss angegeben werden.');
        end;
      end;
      else begin
        Exit(ARGP_ERR_UNKNOWN);
      end;
    end;
    Exit(0);
  end;

  procedure main;
  var
    arguments: Targuments;
    argp: Targp = (options: @options; parser: @parse_opt; args_doc: args_doc; doc: doc; children: nil; help_filter: nil; argp_domain: nil);
    i: integer;
  begin
    arguments.verbose := False;
    arguments.count := 0;
    arguments.files := nil;
    arguments.files_count := 0;

    argp_parse(@argp, argc, argv, 0, nil, @arguments);

    if arguments.verbose then begin
      printf('Verbose-Modus aktiviert'#10);
    end;
    printf('Count: %d'#10, arguments.count);
    printf('Dateien:'#10);
    for  i := 0 to arguments.files_count - 1 do begin
      printf('  %s'#10, arguments.files[i]);
    end;
  end;

begin
  main;
end.
