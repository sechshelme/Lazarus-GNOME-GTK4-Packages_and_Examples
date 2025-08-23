program project1;

uses
  fp_wchar;

  procedure main;
  const
    format: array[0..4] of Twchar_t = (Twchar_t('%'), Twchar_t('h'), Twchar_t('s'), 10, 0);  // '%s'#10#0
  begin
    wprintf(format, 'Hello World');
  end;



begin
  main;
end.
