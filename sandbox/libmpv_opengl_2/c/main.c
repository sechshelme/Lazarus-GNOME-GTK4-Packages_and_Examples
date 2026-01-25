

// gcc main.c glad.c -o main -lmpv -lglfw -ldl -lm

#include "glad.h"
#include <GLFW/glfw3.h>
#include <mpv/client.h>
#include <mpv/render_gl.h>

#include <stdio.h>
#include <stdlib.h>

// --- KONFIGURATION ---
const int WIDTH = 1280;
const int HEIGHT = 720;
const char* VIDEO_PATH = "/n4800/Multimedia/Videos/WNDSURF1.AVI"; 

// --- GLOBALS ---
static void *get_proc_address(void *ctx, const char *name) {
    glfwGetCurrentContext();
    return (void *)glfwGetProcAddress(name);
}

static void on_mpv_render_update(void *ctx) {
    // Sagt dem Main-Loop, dass ein neuer Frame da ist
    *(int *)ctx = 1;
}

// Shader als normale C-Strings (C kennt keine Raw-Strings R"()")
const char* vertexShaderSource = 
    "#version 330 core\n"
    "layout (location = 0) in vec2 aPos;\n"
    "layout (location = 1) in vec2 aTexCoords;\n"
    "out vec2 TexCoords;\n"
    "void main() {\n"
    "   gl_Position = vec4(aPos.x, aPos.y, 0.0, 1.0);\n"
    "   TexCoords = aTexCoords;\n"
    "}\0";

const char* fragmentShaderSource = 
    "#version 330 core\n"
    "out vec4 FragColor;\n"
    "in vec2 TexCoords;\n"
    "uniform sampler2D videoTexture;\n"
    "void main() {\n"
    "   FragColor = texture(videoTexture, TexCoords);\n"
    "}\0";

// Hilfsfunktion zum Kompilieren der Shader
GLuint createShaderProgram() {
    GLuint vs = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vs, 1, &vertexShaderSource, NULL);
    glCompileShader(vs);
    
    GLuint fs = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fs, 1, &fragmentShaderSource, NULL);
    glCompileShader(fs);

    GLuint program = glCreateProgram();
    glAttachShader(program, vs);
    glAttachShader(program, fs);
    glLinkProgram(program);
    
    glDeleteShader(vs);
    glDeleteShader(fs);
    return program;
}

int main() {
    // 1. GLFW Init
    if (!glfwInit()) {
        printf("GLFW Init failed\n");
        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    
    GLFWwindow* window = glfwCreateWindow(WIDTH, HEIGHT, "Minimal MPV OpenGL C", NULL, NULL);
    if (!window) return -1;
    glfwMakeContextCurrent(window);
    glfwSwapInterval(1); 

    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
        printf("GLAD Init failed\n");
        return -1;
    }

    // 2. MPV Init
    mpv_handle *mpv = mpv_create();
    if (mpv_initialize(mpv) < 0) return -1;

    mpv_opengl_init_params gl_init_params = { get_proc_address, NULL };
    int advanced_control = 1;
    
    // C-Style Array Initialisierung
    mpv_render_param params[] = {
        {MPV_RENDER_PARAM_API_TYPE, (char *)MPV_RENDER_API_TYPE_OPENGL},
        {MPV_RENDER_PARAM_OPENGL_INIT_PARAMS, &gl_init_params},
        {MPV_RENDER_PARAM_ADVANCED_CONTROL, &advanced_control},
        {MPV_RENDER_PARAM_INVALID, NULL}
    };

    mpv_render_context *mpv_ctx;
    if (mpv_render_context_create(&mpv_ctx, mpv, params) < 0) {
        printf("MPV Context create failed\n");
        return -1;
    }

    int wakeup_flag = 0;
    mpv_render_context_set_update_callback(mpv_ctx, on_mpv_render_update, &wakeup_flag);

    const char *cmd[] = {"loadfile", VIDEO_PATH, NULL};
    mpv_command(mpv, cmd);
    mpv_set_option_string(mpv, "hwdec", "auto"); 
    mpv_set_option_string(mpv, "loop", "inf");

    // 3. OpenGL Ressourcen
    GLuint fbo, texture;
    glGenFramebuffers(1, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);

    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, WIDTH, HEIGHT, 0, GL_RGB, GL_UNSIGNED_BYTE, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);

    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
        printf("FBO Error\n");
    
    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    float quadVertices[] = {
        // Pos        // Tex
        -0.8f,  0.8f,  0.0f, 1.0f, // C: Y-Achse der Textur invertiert (1.0 oben), sonst steht Video Kopf
        -0.8f, -0.8f,  0.0f, 0.0f,
         0.8f, -0.8f,  1.0f, 0.0f,

        -0.8f,  0.8f,  0.0f, 1.0f,
         0.8f, -0.8f,  1.0f, 0.0f,
         0.8f,  0.8f,  1.0f, 1.0f 
    };

    GLuint VAO, VBO;
    glGenVertexArrays(1, &VAO);
    glGenBuffers(1, &VBO);
    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(quadVertices), &quadVertices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(float), (void*)(2 * sizeof(float)));

    GLuint shaderProgram = createShaderProgram();
    glUseProgram(shaderProgram);
    glUniform1i(glGetUniformLocation(shaderProgram, "videoTexture"), 0);

    // 4. Render Loop
    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();

        if (wakeup_flag) {
            if (mpv_render_context_update(mpv_ctx) & MPV_RENDER_UPDATE_FRAME) {
                mpv_opengl_fbo mpv_fbo = { (int)fbo, WIDTH, HEIGHT, 0 };
                int flip_y = 1; 
                
                mpv_render_param params_fbo[] = {
                    {MPV_RENDER_PARAM_OPENGL_FBO, &mpv_fbo},
                    {MPV_RENDER_PARAM_FLIP_Y, &flip_y},
                    {MPV_RENDER_PARAM_INVALID, NULL}
                };
                
                mpv_render_context_render(mpv_ctx, params_fbo);
                mpv_render_context_report_swap(mpv_ctx);
            }
            wakeup_flag = 0;
        }

        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        glViewport(0, 0, WIDTH, HEIGHT);
        glClear(GL_COLOR_BUFFER_BIT);

        glUseProgram(shaderProgram);
        glBindVertexArray(VAO);
        
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, texture);
        
        glDrawArrays(GL_TRIANGLES, 0, 6);

        glfwSwapBuffers(window);
    }

    mpv_render_context_free(mpv_ctx);
    mpv_destroy(mpv);
    glfwTerminate();
    return 0;
}
