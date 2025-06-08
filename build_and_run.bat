@echo off
REM Build the project
cmake --build build --config Release

REM Run the executable
.\build\Release\VulkanMontCarloRaytracing.exe