

{$include webkit/WebKit.inc}                                    // io.
{$include webkit/WebKitVersion.inc}                             // io.
{$include webkit/WebKitWebViewBase.inc}                         // io.
{$include webkit/WebKitURIRequest.inc}                          // io.
{$include webkit/WebKitNavigationAction.inc}                    // io. -> WebKitURIRequest
{$include webkit/WebKitScriptDialog.inc}                        // io.
{$include webkit/WebKitPermissionRequest.inc}                   // io.
{$include webkit/WebKitWebsitePolicies.inc}                     // io.
{$include webkit/WebKitPolicyDecision.inc}                      // io. -> WebKitWebsitePolicies
{$include webkit/WebKitHitTestResult.inc}                       // io.
{$include webkit/WebKitPrintOperation.inc}                      // io.
{$include webkit/WebKitURIResponse.inc}                         // io.
{$include webkit/WebKitWebResource.inc}                         // io. -> WebKitURIResponse
{$include webkit/WebKitFileChooserRequest.inc}                  // io.
{$include webkit/WebKitContextMenuActions.inc}                  // io.
{$include webkit/WebKitContextMenuItem.inc}                     // io. -> WebKitContextMenuActions
{$include webkit/WebKitContextMenu.inc}                         // io. -> WebKitContextMenuItem
{$include webkit/WebKitSecurityOrigin.inc}                      // io.
{$include webkit/WebKitFormSubmissionRequest.inc}               // io.
{$include webkit/WebKitCredential.inc}                          // io.
{$include webkit/WebKitNotification.inc}                        // io.
{$include webkit/WebKitAuthenticationRequest.inc}               // io. -> WebKitCredential, WebKitSecurityOrigin
{$include webkit/WebKitOptionMenuItem.inc}                      // io.
{$include webkit/WebKitOptionMenu.inc}                          // io. -> WebKitOptionMenuItem
{$include webkit/WebKitColorChooserRequest.inc}                 // io.
{$include webkit/WebKitUserMessage.inc}                         // io.
{$include webkit/WebKitPermissionStateQuery.inc}                // io. -> WebKitSecurityOrigin
{$include webkit/WebKitApplicationInfo.inc}                     // io.
{$include webkit/WebKitCookieManager.inc}                       // io.
{$include webkit/WebKitAutomationSession.inc}                   // io. -> WebKitApplicationInfo
{$include webkit/WebKitWebsiteData.inc}                         // io.
{$include webkit/WebKitFaviconDatabase.inc}                     // io.
{$include webkit/WebKitWebsiteDataManager.inc}                  // io. -> WebKitFaviconDatabase, WebKitWebsiteData
{$include webkit/WebKitNetworkProxySettings.inc}                // io.
{$include webkit/WebKitMemoryPressureSettings.inc}              // io.
{$include webkit/WebKitDownload.inc}                            // io. -> WebKitURIRequest, WebKitURIResponse
{$include webkit/WebKitNetworkSession.inc}                      // io. -> WebKitWebsiteDataManager, WebKitCookieManager, WebKitNetworkProxySettings, WebKitMemoryPressureSettings, WebKitDownload
{$include webkit/WebKitURISchemeResponse.inc}                   // io.
{$include webkit/WebKitURISchemeRequest.inc}                    // io. -> WebKitURISchemeResponse
{$include webkit/WebKitGeolocationManager.inc}                  // io.
{$include webkit/WebKitSecurityManager.inc}                     // io.
{$include webkit/WebKitWebContext.inc}                          // io. -> WebKitURISchemeRequest, WebKitNetworkSession, WebKitGeolocationManager, WebKitSecurityManager, WebKitUserMessage
{$include webkit/WebKitBackForwardListItem.inc}                 // io.
{$include webkit/WebKitBackForwardList.inc}                     // io. -> WebKitBackForwardListItem
{$include webkit/WebKitFeature.inc}                             // io.
{$include webkit/WebKitSettings.inc}                            // io. -> WebKitFeature
{$include webkit/WebKitWindowProperties.inc}                    // io.
{$include webkit/WebKitFindController.inc}                      // io.
{$include webkit/WebKitWebInspector.inc}                        // io.
{$include webkit/WebKitUserContent.inc}                         // io.
{$include webkit/WebKitUserContentManager.inc}                  // io. -> WebKitUserContent
{$include webkit/WebKitEditorState.inc}                         // io.
{$include webkit/WebKitWebViewSessionState.inc}                 // io.
{$include webkit/WebKitInputMethodContext.inc}                  // io.
{$include webkit/WebKitWebView.inc}                             // io. -> ( fast der ganze Rest )
{$include webkit/WebKitEnumTypes.inc}                           // io.
{$include webkit/WebKitError.inc}                               // io.
{$include webkit/WebKitUserContentFilterStore.inc}              // io.
{$include webkit/WebKitWebFormManager.inc}                      // io.
{$include webkit/WebKitWebEditor.inc}                           // io.
{$include webkit/WebKitScriptWorld.inc}                         // io.
{$include webkit/WebKitFrame.inc}                               // io. -> WebKitScriptWorld
{$include webkit/WebKitWebPage.inc}                             // io. -> WebKitFrame, WebKitWebEditor, WebKitScriptWorld, WebKitWebFormManager, WebKitUserMessage
{$include webkit/WebKitEditingCommands.inc}                     // io.
{$include webkit/WebKitWebProcessExtension.inc}                 // io. -> WebKitWebPage, WebKitUserMessage
{$include webkit/WebKitConsoleMessage.inc}                      // io.
{$include webkit/WebKitResponsePolicyDecision.inc}              // io. -> WebKitPolicyDecision, WebKitURIRequest, WebKitURIResponse
{$include webkit/WebKitWebHitTestResult.inc}                    // io. -> WebKitScriptWorld
{$include webkit/WebKitUserMediaPermissionRequest.inc}          // io.
{$include webkit/WebKitWebProcessEnumTypes.inc}                 // io.
{$include webkit/WebKitWebsiteDataAccessPermissionRequest.inc}  // io.
{$include webkit/WebKitMediaKeySystemPermissionRequest.inc}     // io.
{$include webkit/WebKitNavigationPolicyDecision.inc}            // io. -> WebKitPolicyDecision, WebKitNavigationAction
{$include webkit/WebKitNotificationPermissionRequest.inc}       // io.
{$include webkit/WebKitClipboardPermissionRequest.inc}          // io.
{$include webkit/WebKitGeolocationPermissionRequest.inc}        // io.
{$include webkit/WebKitPointerLockPermissionRequest.inc}        // io.
{$include webkit/WebKitDeviceInfoPermissionRequest.inc}         // io.
{$include webkit/WebKitURIUtilities.inc}                        // io.

// neu: 2.48.0
{$include webkit/WebKitWebExtensionMatchPattern.inc}            // io.



