program project1;

uses
  SysUtils,
  vulkan_core,
//  fp_glew,
  fp_vulkan,
  fp_glfw3;
//  fp_GL_Tools;

const
  WIDTH = 800;
  HEIGHT = 600;

var
  window: PGLFWwindow;
  instance: TVkInstance;
  physicalDevice: TVkPhysicalDevice = nil;
  device: TVkDevice;
  graphicsQueue: TVkQueue;
  surface: TVkSurfaceKHR;

  // Diese Objekte hängen direkt von der Fenstergröße ab:
  swapChain: TVkSwapchainKHR;
  swapChainImageFormat: TVkFormat;
  swapChainExtent: TVkExtent2D;
  swapChainImageCount: UInt32;
  swapChainImages: ^TVkImage;
  swapChainImageViews: ^TVkImageView;
  pipelineLayout: TVkPipelineLayout;
  graphicsPipeline: TVkPipeline;
  swapChainFramebuffers: ^TVkFramebuffer;

  renderPass: TVkRenderPass;
  commandPool: TVkCommandPool;
  commandBuffer: TVkCommandBuffer;

  imageAvailableSemaphore: TVkSemaphore;
  renderFinishedSemaphore: TVkSemaphore;
  inFlightFence: TVkFence;

  // Flag für die Größenänderung
  framebufferResized: Boolean = False;

procedure framebufferResizeCallback(window: PGLFWwindow; width, height: Integer); cdecl;
begin
  framebufferResized := True;
end;

function readBinaryFile(filename: PAnsiChar; out size: PtrUInt): Pointer;
var
  f: File;
  buffer: Pointer;
begin
  Assign(f, filename);
  {$I-} Reset(f, 1); {$I+}
  if IOResult <> 0 then
  begin
    Writeln(StdErr, Format('Fehler: Shader-Datei %s konnte nicht geoeffnet werden!', [filename]));
    Halt(1);
  end;
  size := FileSize(f);
  GetMem(buffer, size);
  BlockRead(f, buffer^, size);
  Close(f);
  Result := buffer;
end;

function createShaderModule(code: Pointer; size: PtrUInt): TVkShaderModule;
var createInfo: TVkShaderModuleCreateInfo;
begin
  FillChar(createInfo, SizeOf(createInfo), 0);
  createInfo.sType := VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
  createInfo.codeSize := size;
  createInfo.pCode := PUInt32(code);
  if vkCreateShaderModule(device, @createInfo, nil, @Result) <> VK_SUCCESS then
  begin
    Writeln(StdErr, 'Fehler: Shader-Modul konnte nicht erstellt werden!');
    Halt(1);
  end;
end;

procedure initWindow();
begin
  glfwInit();
  glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE); // Jetzt Erlaubt!
  window := glfwCreateWindow(WIDTH, HEIGHT, 'Vulkan Farbiges Dreieck', nil, nil);
  glfwSetFramebufferSizeCallback(window, @framebufferResizeCallback);
end;

// Sub-Prozeduren zum Erstellen der größenabhängigen Ressourcen
procedure createSwapChain();
var
  capabilities: TVkSurfaceCapabilitiesKHR;
  swapchainCreateInfo: TVkSwapchainCreateInfoKHR;
begin
  vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physicalDevice, surface, @capabilities);

  swapChainImageFormat := VK_FORMAT_B8G8R8A8_SRGB;
  swapChainExtent := capabilities.currentExtent;

  FillChar(swapchainCreateInfo, SizeOf(swapchainCreateInfo), 0);
  swapchainCreateInfo.sType := VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
  swapchainCreateInfo.surface := surface;
  swapchainCreateInfo.minImageCount := capabilities.minImageCount + 1;
  swapchainCreateInfo.imageFormat := swapChainImageFormat;
  swapchainCreateInfo.imageColorSpace := VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
  swapchainCreateInfo.imageExtent := swapChainExtent;
  swapchainCreateInfo.imageArrayLayers := 1;
  swapchainCreateInfo.imageUsage := VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
  swapchainCreateInfo.imageSharingMode := VK_SHARING_MODE_EXCLUSIVE;
  swapchainCreateInfo.preTransform := capabilities.currentTransform;
  swapchainCreateInfo.compositeAlpha := VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
  swapchainCreateInfo.presentMode := VK_PRESENT_MODE_FIFO_KHR;
  swapchainCreateInfo.clipped := VK_TRUE;

  vkCreateSwapchainKHR(device, @swapchainCreateInfo, nil, @swapChain);

  vkGetSwapchainImagesKHR(device, swapChain, @swapChainImageCount, nil);
  GetMem(swapChainImages, swapChainImageCount * SizeOf(TVkImage));
  vkGetSwapchainImagesKHR(device, swapChain, @swapChainImageCount, swapChainImages);
end;

procedure createImageViews();
var
  i: UInt32;
  viewInfo: TVkImageViewCreateInfo;
begin
  GetMem(swapChainImageViews, swapChainImageCount * SizeOf(TVkImageView));
  for i := 0 to swapChainImageCount - 1 do
  begin
    FillChar(viewInfo, SizeOf(viewInfo), 0);
    viewInfo.sType := VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    viewInfo.image := swapChainImages[i];
    viewInfo.viewType := VK_IMAGE_VIEW_TYPE_2D;
    viewInfo.format := swapChainImageFormat;
    viewInfo.components.r := VK_COMPONENT_SWIZZLE_IDENTITY;
    viewInfo.components.g := VK_COMPONENT_SWIZZLE_IDENTITY;
    viewInfo.components.b := VK_COMPONENT_SWIZZLE_IDENTITY;
    viewInfo.components.a := VK_COMPONENT_SWIZZLE_IDENTITY;
    viewInfo.subresourceRange.aspectMask := VK_IMAGE_ASPECT_COLOR_BIT;
    viewInfo.subresourceRange.baseMipLevel := 0;
    viewInfo.subresourceRange.levelCount := 1;
    viewInfo.subresourceRange.baseArrayLayer := 0;
    viewInfo.subresourceRange.layerCount := 1;

    vkCreateImageView(device, @viewInfo, nil, @swapChainImageViews[i]);
  end;
end;

procedure createGraphicsPipeline();
var
  vertSize, fragSize: PtrUInt;
  vertCode, fragCode: Pointer;
  vertShaderModule, fragShaderModule: TVkShaderModule;
  shaderStages: array[0..1] of TVkPipelineShaderStageCreateInfo;
  vertexInputInfo: TVkPipelineVertexInputStateCreateInfo;
  inputAssembly: TVkPipelineInputAssemblyStateCreateInfo;
  viewport: TVkViewport;
  scissor: TVkRect2D;
  viewportState: TVkPipelineViewportStateCreateInfo;
  rasterizer: TVkPipelineRasterizationStateCreateInfo;
  multisampling: TVkPipelineMultisampleStateCreateInfo;
  colorBlendAttachment: TVkPipelineColorBlendAttachmentState;
  colorBlending: TVkPipelineColorBlendStateCreateInfo;
  pipelineLayoutInfo: TVkPipelineLayoutCreateInfo;
  pipelineInfo: TVkGraphicsPipelineCreateInfo;
begin
  vertCode := readBinaryFile('vert.spv', vertSize);
  fragCode := readBinaryFile('frag.spv', fragSize);
  vertShaderModule := createShaderModule(vertCode, vertSize);
  fragShaderModule := createShaderModule(fragCode, fragSize);

  FillChar(shaderStages, SizeOf(shaderStages), 0);
  shaderStages[0].sType := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
  shaderStages[0].stage := VK_SHADER_STAGE_VERTEX_BIT;
  shaderStages[0].module := vertShaderModule;
  shaderStages[0].pName := 'main';
  shaderStages[1].sType := VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
  shaderStages[1].stage := VK_SHADER_STAGE_FRAGMENT_BIT;
  shaderStages[1].module := fragShaderModule;
  shaderStages[1].pName := 'main';

  FillChar(vertexInputInfo, SizeOf(vertexInputInfo), 0);
  vertexInputInfo.sType := VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;

  FillChar(inputAssembly, SizeOf(inputAssembly), 0);
  inputAssembly.sType := VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
  inputAssembly.topology := VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;

  viewport.x := 0.0; viewport.y := 0.0;
  viewport.width := swapChainExtent.width;
  viewport.height := swapChainExtent.height;
  viewport.minDepth := 0.0; viewport.maxDepth := 1.0;

  scissor.offset.x := 0; scissor.offset.y := 0;
  scissor.extent := swapChainExtent;

  FillChar(viewportState, SizeOf(viewportState), 0);
  viewportState.sType := VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
  viewportState.viewportCount := 1;
  viewportState.pViewports := @viewport;
  viewportState.scissorCount := 1;
  viewportState.pScissors := @scissor;

  FillChar(rasterizer, SizeOf(rasterizer), 0);
  rasterizer.sType := VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
  rasterizer.polygonMode := VK_POLYGON_MODE_FILL;
  rasterizer.cullMode := VK_CULL_MODE_BACK_BIT;
  rasterizer.frontFace := VK_FRONT_FACE_CLOCKWISE;
  rasterizer.lineWidth := 1.0;

  FillChar(multisampling, SizeOf(multisampling), 0);
  multisampling.sType := VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
  multisampling.rasterizationSamples := VK_SAMPLE_COUNT_1_BIT;

  FillChar(colorBlendAttachment, SizeOf(colorBlendAttachment), 0);
  colorBlendAttachment.colorWriteMask := VK_COLOR_COMPONENT_R_BIT or VK_COLOR_COMPONENT_G_BIT or VK_COLOR_COMPONENT_B_BIT or VK_COLOR_COMPONENT_A_BIT;
  colorBlendAttachment.blendEnable := VK_FALSE;

  FillChar(colorBlending, SizeOf(colorBlending), 0);
  colorBlending.sType := VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
  colorBlending.attachmentCount := 1;
  colorBlending.pAttachments := @colorBlendAttachment;

  FillChar(pipelineLayoutInfo, SizeOf(pipelineLayoutInfo), 0);
  pipelineLayoutInfo.sType := VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
  vkCreatePipelineLayout(device, @pipelineLayoutInfo, nil, @pipelineLayout);

  FillChar(pipelineInfo, SizeOf(pipelineInfo), 0);
  pipelineInfo.sType := VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
  pipelineInfo.stageCount := 2;
  pipelineInfo.pStages := @shaderStages[0];
  pipelineInfo.pVertexInputState := @vertexInputInfo;
  pipelineInfo.pInputAssemblyState := @inputAssembly;
  pipelineInfo.pViewportState := @viewportState;
  pipelineInfo.pRasterizationState := @rasterizer;
  pipelineInfo.pMultisampleState := @multisampling;
  pipelineInfo.pColorBlendState := @colorBlending;
  pipelineInfo.layout := pipelineLayout;
  pipelineInfo.renderPass := renderPass;
  pipelineInfo.subpass := 0;

  vkCreateGraphicsPipelines(device, VK_NULL_HANDLE, 1, @pipelineInfo, nil, @graphicsPipeline);

  FreeMem(vertCode); FreeMem(fragCode);
  vkDestroyShaderModule(device, fragShaderModule, nil);
  vkDestroyShaderModule(device, vertShaderModule, nil);
end;

procedure createFramebuffers();
var
  i: UInt32;
  framebufferInfo: TVkFramebufferCreateInfo;
begin
  GetMem(swapChainFramebuffers, swapChainImageCount * SizeOf(TVkFramebuffer));
  for i := 0 to swapChainImageCount - 1 do
  begin
    FillChar(framebufferInfo, SizeOf(framebufferInfo), 0);
    framebufferInfo.sType := VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    framebufferInfo.renderPass := renderPass;
    framebufferInfo.attachmentCount := 1;
    framebufferInfo.pAttachments := @swapChainImageViews[i];
    framebufferInfo.width := swapChainExtent.width;
    framebufferInfo.height := swapChainExtent.height;
    framebufferInfo.layers := 1;

    vkCreateFramebuffer(device, @framebufferInfo, nil, @swapChainFramebuffers[i]);
  end;
end;

procedure cleanupSwapChain();
var i: UInt32;
begin
  for i := 0 to swapChainImageCount - 1 do
    vkDestroyFramebuffer(device, swapChainFramebuffers[i], nil);
  FreeMem(swapChainFramebuffers);

  vkDestroyPipeline(device, graphicsPipeline, nil);
  vkDestroyPipelineLayout(device, pipelineLayout, nil);

  for i := 0 to swapChainImageCount - 1 do
    vkDestroyImageView(device, swapChainImageViews[i], nil);
  FreeMem(swapChainImageViews);
  FreeMem(swapChainImages);

  vkDestroySwapchainKHR(device, swapChain, nil);
end;

procedure recreateSwapChain();
var width, height: Integer;
begin
  glfwGetFramebufferSize(window, @width, @height);
  while (width = 0) or (height = 0) do // Abfangen von Minimierung
  begin
    glfwGetFramebufferSize(window, @width, @height);
    glfwWaitEvents();
  end;

  vkDeviceWaitIdle(device);
  cleanupSwapChain();

  createSwapChain();
  createImageViews();
  createGraphicsPipeline();
  createFramebuffers();
end;

procedure initVulkan();
var
  glfwExtensionCount: UInt32;
  glfwExtensions: PPAnsiChar;
  appInfo: TVkApplicationInfo;
  createInfo: TVkInstanceCreateInfo;
  deviceCount: UInt32;
  devices: ^TVkPhysicalDevice;
  queueFamilyCount: UInt32;
  queueFamilies: ^TVkQueueFamilyProperties;
  graphicsFamilyIndex: Integer;
  i: UInt32;
  presentSupport: TVkBool32;
  queuePriority: Single;
  queueCreateInfo: TVkDeviceQueueCreateInfo;
  deviceExtensions: array[0..0] of PAnsiChar;
  deviceCreateInfo: TVkDeviceCreateInfo;
  colorAttachment: TVkAttachmentDescription;
  colorAttachmentRef: TVkAttachmentReference;
  subpass: TVkSubpassDescription;
  dependency: TVkSubpassDependency;
  renderPassInfo: TVkRenderPassCreateInfo;
  poolInfo: TVkCommandPoolCreateInfo;
  allocInfo: TVkCommandBufferAllocateInfo;
  semaphoreInfo: TVkSemaphoreCreateInfo;
  fenceInfo: TVkFenceCreateInfo;
begin
  glfwExtensionCount := 0;
  glfwExtensions := glfwGetRequiredInstanceExtensions(@glfwExtensionCount);

  FillChar(appInfo, SizeOf(appInfo), 0);
  appInfo.sType := VK_STRUCTURE_TYPE_APPLICATION_INFO;
  appInfo.pApplicationName := 'Vulkan Dreieck';
  appInfo.applicationVersion := VK_MAKE_VERSION(1, 0, 0);
  appInfo.apiVersion := VK_API_VERSION_1_0;

  FillChar(createInfo, SizeOf(createInfo), 0);
  createInfo.sType := VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
  createInfo.pApplicationInfo := @appInfo;
  createInfo.enabledExtensionCount := glfwExtensionCount;
  createInfo.ppEnabledExtensionNames := glfwExtensions;
  vkCreateInstance(@createInfo, nil, @instance);

  glfwCreateWindowSurface(instance, window, nil, @surface);

  deviceCount := 0;
  vkEnumeratePhysicalDevices(instance, @deviceCount, nil);
  GetMem(devices, deviceCount * SizeOf(TVkPhysicalDevice));
  vkEnumeratePhysicalDevices(instance, @deviceCount, devices);
  physicalDevice := devices[0];
  FreeMem(devices);

  queueFamilyCount := 0;
  vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, @queueFamilyCount, nil);
  GetMem(queueFamilies, queueFamilyCount * SizeOf(TVkQueueFamilyProperties));
  vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, @queueFamilyCount, queueFamilies);

  graphicsFamilyIndex := -1;
  for i := 0 to queueFamilyCount - 1 do
  begin
    presentSupport := VK_FALSE;
    vkGetPhysicalDeviceSurfaceSupportKHR(physicalDevice, i, surface, @presentSupport);
    if ((queueFamilies[i].queueFlags and VK_QUEUE_GRAPHICS_BIT) <> 0) and (presentSupport = VK_TRUE) then
    begin
      graphicsFamilyIndex := i;
      Break;
    end;
  end;
  FreeMem(queueFamilies);

  queuePriority := 1.0;
  FillChar(queueCreateInfo, SizeOf(queueCreateInfo), 0);
  queueCreateInfo.sType := VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
  queueCreateInfo.queueFamilyIndex := graphicsFamilyIndex;
  queueCreateInfo.queueCount := 1;
  queueCreateInfo.pQueuePriorities := @queuePriority;

  deviceExtensions[0] := VK_KHR_SWAPCHAIN_EXTENSION_NAME;

  FillChar(deviceCreateInfo, SizeOf(deviceCreateInfo), 0);
  deviceCreateInfo.sType := VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
  deviceCreateInfo.queueCreateInfoCount := 1;
  deviceCreateInfo.pQueueCreateInfos := @queueCreateInfo;
  deviceCreateInfo.enabledExtensionCount := 1;
  deviceCreateInfo.ppEnabledExtensionNames := @deviceExtensions[0];
  vkCreateDevice(physicalDevice, @deviceCreateInfo, nil, @device);
  vkGetDeviceQueue(device, graphicsFamilyIndex, 0, @graphicsQueue);

  // Initialer Aufbau der Swapchain-Objekte
  createSwapChain();
  createImageViews();

  // Render Pass (bleibt auch bei Resize gleich, da das Format identisch bleibt)
  FillChar(colorAttachment, SizeOf(colorAttachment), 0);
  colorAttachment.format := swapChainImageFormat;
  colorAttachment.samples := VK_SAMPLE_COUNT_1_BIT;
  colorAttachment.loadOp := VK_ATTACHMENT_LOAD_OP_CLEAR;
  colorAttachment.storeOp := VK_ATTACHMENT_STORE_OP_STORE;
  colorAttachment.initialLayout := VK_IMAGE_LAYOUT_UNDEFINED;
  colorAttachment.finalLayout := VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;

  colorAttachmentRef.attachment := 0;
  colorAttachmentRef.layout := VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;

  FillChar(subpass, SizeOf(subpass), 0);
  subpass.pipelineBindPoint := VK_PIPELINE_BIND_POINT_GRAPHICS;
  subpass.colorAttachmentCount := 1;
  subpass.pColorAttachments := @colorAttachmentRef;

  FillChar(dependency, SizeOf(dependency), 0);
  dependency.srcSubpass := VK_SUBPASS_EXTERNAL;
  dependency.dstSubpass := 0;
  dependency.srcStageMask := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
  dependency.srcAccessMask := 0;
  dependency.dstStageMask := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
  dependency.dstAccessMask := VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;

  FillChar(renderPassInfo, SizeOf(renderPassInfo), 0);
  renderPassInfo.sType := VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
  renderPassInfo.attachmentCount := 1;
  renderPassInfo.pAttachments := @colorAttachment;
  renderPassInfo.subpassCount := 1;
  renderPassInfo.pSubpasses := @subpass;
  renderPassInfo.dependencyCount := 1;
  renderPassInfo.pDependencies := @dependency;
  vkCreateRenderPass(device, @renderPassInfo, nil, @renderPass);

  // Pipeline und Framebuffer aufbauen
  createGraphicsPipeline();
  createFramebuffers();

  FillChar(poolInfo, SizeOf(poolInfo), 0);
  poolInfo.sType := VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
  poolInfo.flags := VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
  poolInfo.queueFamilyIndex := graphicsFamilyIndex;
  vkCreateCommandPool(device, @poolInfo, nil, @commandPool);

  FillChar(allocInfo, SizeOf(allocInfo), 0);
  allocInfo.sType := VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
  allocInfo.commandPool := commandPool;
  allocInfo.level := VK_COMMAND_BUFFER_LEVEL_PRIMARY;
  allocInfo.commandBufferCount := 1;
  vkAllocateCommandBuffers(device, @allocInfo, @commandBuffer);

  FillChar(semaphoreInfo, SizeOf(semaphoreInfo), 0);
  semaphoreInfo.sType := VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
  FillChar(fenceInfo, SizeOf(fenceInfo), 0);
  fenceInfo.sType := VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
  fenceInfo.flags := VK_FENCE_CREATE_SIGNALED_BIT;

  vkCreateSemaphore(device, @semaphoreInfo, nil, @imageAvailableSemaphore);
  vkCreateSemaphore(device, @semaphoreInfo, nil, @renderFinishedSemaphore);
  vkCreateFence(device, @fenceInfo, nil, @inFlightFence);
end;

procedure recordCommandBuffer(imageIndex: UInt32);
var
  beginInfo: TVkCommandBufferBeginInfo;
  clearColor: TVkClearValue;
  renderPassInfo: TVkRenderPassBeginInfo;
begin
  FillChar(beginInfo, SizeOf(beginInfo), 0);
  beginInfo.sType := VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
  vkBeginCommandBuffer(commandBuffer, @beginInfo);

  FillChar(clearColor, SizeOf(clearColor), 0);
  clearColor.color.float32[0] := 0.0;
  clearColor.color.float32[1] := 0.0;
  clearColor.color.float32[2] := 0.0;
  clearColor.color.float32[3] := 1.0;

  FillChar(renderPassInfo, SizeOf(renderPassInfo), 0);
  renderPassInfo.sType := VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
  renderPassInfo.renderPass := renderPass;
  renderPassInfo.framebuffer := swapChainFramebuffers[imageIndex];
  renderPassInfo.renderArea.offset.x := 0;
  renderPassInfo.renderArea.offset.y := 0;
  renderPassInfo.renderArea.extent := swapChainExtent;
  renderPassInfo.clearValueCount := 1;
  renderPassInfo.pClearValues := @clearColor;

  vkCmdBeginRenderPass(commandBuffer, @renderPassInfo, VK_SUBPASS_CONTENTS_INLINE);
  vkCmdBindPipeline(commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, graphicsPipeline);
  vkCmdDraw(commandBuffer, 3, 1, 0, 0);
  vkCmdEndRenderPass(commandBuffer);

  vkEndCommandBuffer(commandBuffer);
end;

procedure drawFrame();
var
  imageIndex: UInt32;
  waitStages: array[0..0] of TVkPipelineStageFlags;
  submitInfo: TVkSubmitInfo;
  presentInfo: TVkPresentInfoKHR;
  res: TVkResult;
//  res: TVkResult;
begin
  vkWaitForFences(device, 1, @inFlightFence, VK_TRUE, High(UInt64));

  imageIndex := 0;
  res := vkAcquireNextImageKHR(device, swapChain, High(UInt64), imageAvailableSemaphore, VK_NULL_HANDLE, @imageIndex);

  // Wenn Swapchain veraltet ist, direkt neu generieren und Frame abbrechen
  if res = VK_ERROR_OUT_OF_DATE_KHR then
  begin
    recreateSwapChain();
    Exit;
  end;

  vkResetFences(device, 1, @inFlightFence);

  vkResetCommandBuffer(commandBuffer, 0);
  recordCommandBuffer(imageIndex);

  waitStages[0] := VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;

  FillChar(submitInfo, SizeOf(submitInfo), 0);
  submitInfo.sType := VK_STRUCTURE_TYPE_SUBMIT_INFO;
  submitInfo.waitSemaphoreCount := 1;
  submitInfo.pWaitSemaphores := @imageAvailableSemaphore;
  submitInfo.pWaitDstStageMask := @waitStages[0];
  submitInfo.commandBufferCount := 1;
  submitInfo.pCommandBuffers := @commandBuffer;
  submitInfo.signalSemaphoreCount := 1;
  submitInfo.pSignalSemaphores := @renderFinishedSemaphore;

  vkQueueSubmit(graphicsQueue, 1, @submitInfo, inFlightFence);

  FillChar(presentInfo, SizeOf(presentInfo), 0);
  presentInfo.sType := VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
  presentInfo.waitSemaphoreCount := 1;
  presentInfo.pWaitSemaphores := @renderFinishedSemaphore;
  presentInfo.swapchainCount := 1;
  presentInfo.pSwapchains := @swapChain;
  presentInfo.pImageIndices := @imageIndex;

  res := vkQueuePresentKHR(graphicsQueue, @presentInfo);

  // Abfangen ob nach/während des Presentierens das Fenster geändert wurde
  if (res = VK_ERROR_OUT_OF_DATE_KHR) or (res = VK_SUBOPTIMAL_KHR) or framebufferResized then
  begin
    framebufferResized := False;
    recreateSwapChain();
  end;
end;

procedure mainLoop();
begin
  while glfwWindowShouldClose(window) = 0 do
  begin
    glfwPollEvents();
    drawFrame();
  end;
  vkDeviceWaitIdle(device);
end;

procedure cleanup();
begin
  vkDestroySemaphore(device, renderFinishedSemaphore, nil);
  vkDestroySemaphore(device, imageAvailableSemaphore, nil);
  vkDestroyFence(device, inFlightFence, nil);
  vkDestroyCommandPool(device, commandPool, nil);

  cleanupSwapChain(); // Nutzt die ausgelagerte Freigabe-Prozedur

  vkDestroyRenderPass(device, renderPass, nil);
  vkDestroyDevice(device, nil);
  vkDestroySurfaceKHR(instance, surface, nil);
  vkDestroyInstance(instance, nil);
  glfwDestroyWindow(window);
  glfwTerminate();
end;

begin
  initWindow();
  initVulkan();
  mainLoop();
  cleanup();
end.
