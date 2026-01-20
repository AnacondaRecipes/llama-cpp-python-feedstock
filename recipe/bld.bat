:: Set CMake arguments to use external llama.cpp library
set CMAKE_ARGS=%CMAKE_ARGS% -DLLAMA_BUILD=OFF
set CMAKE_ARGS=%CMAKE_ARGS% -DLLAVA_BUILD=OFF

:: Install the package
%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
