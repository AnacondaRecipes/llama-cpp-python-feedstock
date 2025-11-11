:: Set CMake arguments for vendored llama.cpp build
set CMAKE_ARGS=%CMAKE_ARGS% -DLLAMA_BUILD=ON
set CMAKE_ARGS=%CMAKE_ARGS% -DLLAVA_BUILD=OFF

:: Install the package
%PYTHON% -m pip install . -vv
if errorlevel 1 exit 1

:: Move DLLs from site-packages/bin to Library/bin (standard conda location)
:: This matches the expectation in the patched llama_cpp.py
if exist %SP_DIR%\bin\*.dll (
    if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
    move %SP_DIR%\bin\*.dll %LIBRARY_BIN%\
    if errorlevel 1 exit 1
)

:: Also move DLLs from site-packages/llama_cpp/lib to Library/bin
if exist %SP_DIR%\llama_cpp\lib\*.dll (
    move %SP_DIR%\llama_cpp\lib\*.dll %LIBRARY_BIN%\
    if errorlevel 1 exit 1
)
