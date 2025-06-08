cmake_minimum_required(VERSION 3.20)
project(VulkanMontCarloRaytracing VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(Vulkan REQUIRED)

# Add subdirectories for vendor libraries
add_subdirectory(vendor/glfw)
add_subdirectory(vendor/tinyobjloader)

# Set shader directory
set(SHADER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/shaders)

# Add executable
add_executable(${PROJECT_NAME} main.cpp)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor/Vulkan/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor/glfw/include
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor/tinyobjloader
)

# Link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    Vulkan::Vulkan
    glfw
    tinyobjloader
)

# Copy shaders to build directory
file(COPY ${SHADER_DIR} DESTINATION ${CMAKE_BINARY_DIR})

# Set working directory for the executable
set_target_properties(${PROJECT_NAME} PROPERTIES
    VS_DEBUGGER_WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
) 