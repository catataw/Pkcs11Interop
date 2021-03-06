@setlocal

@rem Initialize build environment of Visual Studio 2015
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"

@rem Define signing options
set CERTHASH=d5de31ea974f5ea8581d633eeffa8f3ea0d479bb
set TSAURL=http://time.certum.pl/
set LIBNAME=Pkcs11Interop
set LIBURL=https://www.pkcs11interop.net/

@rem Sign all assemblies using SHA1withRSA algorithm
signtool sign /sha1 %CERTHASH% /fd sha1 /tr %TSAURL% /td sha1 /d %LIBNAME% /du %LIBURL% ^
net20\Pkcs11Interop.dll ^
net20\Pkcs11Interop.StrongName.dll ^
net40\Pkcs11Interop.dll ^
net40\Pkcs11Interop.StrongName.dll ^
net45\Pkcs11Interop.dll ^
net45\Pkcs11Interop.StrongName.dll ^
sl5\Pkcs11Interop.Silverlight.dll ^
sl5\Pkcs11Interop.Silverlight.StrongName.dll ^
netstandard1.3\Pkcs11Interop.DotNetCore.dll ^
netstandard1.3\Pkcs11Interop.DotNetCore.StrongName.dll ^
monoandroid2.3\Pkcs11Interop.Android.dll ^
xamarinios1.0\Pkcs11Interop.iOS.dll || goto :error

@rem Sign all assemblies using SHA256withRSA algorithm
signtool sign /sha1 %CERTHASH% /as /fd sha256 /tr %TSAURL% /td sha256 /d %LIBNAME% /du %LIBURL% ^
net20\Pkcs11Interop.dll ^
net20\Pkcs11Interop.StrongName.dll ^
net40\Pkcs11Interop.dll ^
net40\Pkcs11Interop.StrongName.dll ^
net45\Pkcs11Interop.dll ^
net45\Pkcs11Interop.StrongName.dll ^
sl5\Pkcs11Interop.Silverlight.dll ^
sl5\Pkcs11Interop.Silverlight.StrongName.dll ^
netstandard1.3\Pkcs11Interop.DotNetCore.dll ^
netstandard1.3\Pkcs11Interop.DotNetCore.StrongName.dll ^
monoandroid2.3\Pkcs11Interop.Android.dll ^
xamarinios1.0\Pkcs11Interop.iOS.dll || goto :error

@echo *** SIGNING SUCCESSFUL ***
@endlocal
@exit /b 0

:error
@echo *** SIGNING FAILED ***
@endlocal
@exit /b 1
