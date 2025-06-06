{$IFDEF read_interface}


{$ifndef _ELM_ATSPI_BRIDGE_EO_LEGACY_H_}
{$define _ELM_ATSPI_BRIDGE_EO_LEGACY_H_}
{$ifndef _ELM_ATSPI_BRIDGE_EO_CLASS_TYPE}
{$define _ELM_ATSPI_BRIDGE_EO_CLASS_TYPE}
type
  PElm_Atspi_Bridge = ^TElm_Atspi_Bridge;
  TElm_Atspi_Bridge = TEo;
{$endif}
{$ifndef _ELM_ATSPI_BRIDGE_EO_TYPES}
{$define _ELM_ATSPI_BRIDGE_EO_TYPES}
{$endif}
{*
 * @brief Indicate if connection with AT-SPI2 bus has been established.
 *
 * @param[in] obj The object.
 *
 * @return @c true if connection has been established, @c false otherwise
 *
 * @ingroup Elm_Atspi_Bridge_Group
  }

function elm_atspi_bridge_connected_get(obj:PElm_Atspi_Bridge):TEina_Bool;cdecl;external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:53:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
