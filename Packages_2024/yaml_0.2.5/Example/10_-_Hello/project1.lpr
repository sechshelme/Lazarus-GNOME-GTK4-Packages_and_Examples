program project1;

uses
  fp_yaml;

  procedure Add_new_item(var emitter: Tyaml_emitter_t; var event: Tyaml_event_t; fn, ln: pchar; age: integer);
  var
    s: string;
  begin
    yaml_scalar_event_initialize(@event, nil, nil, 'firstname', -1, 1, 1, YAML_PLAIN_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);
    yaml_scalar_event_initialize(@event, nil, nil, fn, -1, 1, 1, YAML_DOUBLE_QUOTED_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);

    yaml_scalar_event_initialize(@event, nil, nil, 'lastname', -1, 1, 1, YAML_PLAIN_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);
    yaml_scalar_event_initialize(@event, nil, nil, ln, -1, 1, 1, YAML_DOUBLE_QUOTED_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);

    yaml_scalar_event_initialize(@event, nil, nil, 'age', -1, 1, 1, YAML_PLAIN_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);

    str(age, s);
    yaml_scalar_event_initialize(@event, nil, nil, pchar(s), -1, 1, 1, YAML_PLAIN_SCALAR_STYLE);
    yaml_emitter_emit(@emitter, @event);
  end;

  procedure create_yaml_file(filename: pchar);
  var
    f: PFILE;
    event: Tyaml_event_t;
    emitter: Tyaml_emitter_t;
  begin
    f := fopen(filename, 'wb');

    yaml_emitter_initialize(@emitter);
    yaml_emitter_set_output_file(@emitter, f);

    yaml_stream_start_event_initialize(@event, YAML_UTF8_ENCODING);
    yaml_emitter_emit(@emitter, @event);

    yaml_document_start_event_initialize(@event, nil, nil, nil, 1);
    yaml_emitter_emit(@emitter, @event);

    yaml_mapping_start_event_initialize(@event, nil, nil, 1, YAML_ANY_MAPPING_STYLE);
    yaml_emitter_emit(@emitter, @event);

    Add_new_item(emitter, event, 'Werner', 'Weber', 34);
    Add_new_item(emitter, event, 'Urs', 'Schmid', 45);
    Add_new_item(emitter, event, 'Peter', 'Ulrich', 34);

    yaml_mapping_end_event_initialize(@event);
    yaml_emitter_emit(@emitter, @event);

    yaml_document_end_event_initialize(@event, 1);
    yaml_emitter_emit(@emitter, @event);

    yaml_stream_end_event_initialize(@event);
    yaml_emitter_emit(@emitter, @event);

    yaml_emitter_delete(@emitter);
    fclose(f);
  end;

  procedure load_yaml_file(filename: pchar);
  var
    f: PFILE;
    parser: Tyaml_parser_t;
    event: Tyaml_event_t;
    quit: boolean = False;
  begin
    f := fopen(filename, 'rb');

    yaml_parser_initialize(@parser);
    yaml_parser_set_input_file(@parser, f);

    while not quit do begin
      yaml_parser_parse(@parser, @event);
      case event._type of
        YAML_STREAM_END_EVENT: begin
          quit := True;
        end;
        YAML_SCALAR_EVENT: begin
          WriteLn('Scalar: ', event.data.scalar.value);
        end;
        else begin
          WriteLn('Event: ', event._type);
        end;
      end;
      yaml_event_delete(@event);
    end;

    yaml_parser_delete(@parser);
    fclose(f);
  end;

const
  filename = 'test.yaml';

begin
  create_yaml_file(filename);
  load_yaml_file(filename);
end.
