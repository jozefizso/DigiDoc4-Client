@echo on


set QTSDK=C:\Qt\Qt5.12.8\5.12.8\msvc2017

call "c:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsall.bat" amd64

git submodule -q update --init --recursive

msiexec /qn /a libdigidocpp-3.14.2.1257.VS141.msi TARGETDIR="%CD%\libs"

pushd build
cmake -G"NMake Makefiles" ^
      -DCMAKE_BUILD_TYPE=Debug ^
      -DQt5_DIR=C:\Qt\Qt5.12.8\5.12.8\msvc2015_64\lib\cmake\Qt5 ^
      -DLIBDIGIDOCPP_LIBRARY=..\libs\libdigidocpp\x64\digidocppd.lib ^
      -DLIBDIGIDOCPP_INCLUDE_DIR=..\libs\libdigidocpp\include ^
      -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2017/Professional/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x64/cl.exe" ^
      -DCMAKE_C_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2017/Professional/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x64/cl.exe" ^
      ..

popd

cmake -G"NMake Makefiles" ^
      -DCMAKE_BUILD_TYPE=Debug ^
      -DOPENSSL_ROOT_DIR=C:\Program Files\OpenSSL-Win64 ^
      -DQt5_DIR=C:\Qt\Qt5.12.8\5.12.8\msvc2017_64\lib\cmake\Qt5 ^
      -DLIBDIGIDOCPP_LIBRARY=..\libs\libdigidocpp\x64\digidocppd.lib ^
      -DLIBDIGIDOCPP_INCLUDE_DIR=..\libs\libdigidocpp\include ^
      ..

cmake -G"Visual Studio 16 2019" -A x64 ^
      -DCMAKE_BUILD_TYPE=Debug ^
      -DOPENSSL_ROOT_DIR=C:\Program Files\OpenSSL-Win64 ^
      -DQt5_DIR=C:\Qt\Qt5.12.8\5.12.8\msvc2017_64\lib\cmake\Qt5 ^
      -DLIBDIGIDOCPP_LIBRARY=..\libs\libdigidocpp\x64\digidocppd.lib ^
      -DLIBDIGIDOCPP_INCLUDE_DIR=..\libs\libdigidocpp\include ^
      ..
      
      
      