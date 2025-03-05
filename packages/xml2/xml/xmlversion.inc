{$IFDEF read_interface}


procedure xmlCheckVersion(version: longint); cdecl; external libxml2;

const
  LIBXML_DOTTED_VERSION = '2.9.14';
  LIBXML_VERSION = 20914;
  LIBXML_VERSION_STRING = '20914';
  LIBXML_VERSION_EXTRA = '';
  WITH_TRIO = 1;
  LIBXML_MODULE_EXTENSION = '.so';

procedure LIBXML_TEST_VERSION;

// === Konventiert am: 3-3-25 17:42:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure LIBXML_TEST_VERSION;
begin
  xmlCheckVersion(20914);
end;


{$ENDIF read_implementation}
