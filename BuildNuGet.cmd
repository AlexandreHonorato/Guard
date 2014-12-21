echo ------------------------------ .Net 4.5 ------------------------------
msbuild CodeGuard\Seterlund.CodeGuard.csproj /t:Clean;ReBuild /p:Configuration=Release;TargetFrameworkVersion=v4.5
copy CodeGuard\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\net45\
copy CodeGuard\bin\Release\CodeContracts\Seterlund.CodeGuard.CodeContracts.dll NuGet\lib\net45\

echo ------------------------------ .Net 4.0 ------------------------------
msbuild CodeGuard\Seterlund.CodeGuard.csproj /t:Clean;ReBuild /p:Configuration=Release;TargetFrameworkVersion=v4.0
copy CodeGuard\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\net40\
copy CodeGuard\bin\Release\CodeContracts\Seterlund.CodeGuard.CodeContracts.dll NuGet\lib\net40\

echo ------------------------------ .Net 3.5 ------------------------------
msbuild CodeGuard\Seterlund.CodeGuard.csproj /t:Clean;ReBuild /p:Configuration=Release;TargetFrameworkVersion=v3.5 /p:DefineConstants=NET35
copy CodeGuard\bin\Release\Seterlund.CodeGuard.dll NuGet\lib\net35\


echo ------------------------------ Build package and upload it ------------------------------

pushd NuGet
..\packages\NuGet.CommandLine.2.2.1\tools\NuGet.exe pack Seterlund.CodeGuard.nuspec
..\packages\NuGet.CommandLine.2.2.1\tools\NuGet.exe push Seterlund.CodeGuard.2.3.4.nupkg
popd


echo ------------------------------Source files ------------------------------
pushd NuGet_Src
powershell -file replace.ps1
..\packages\NuGet.CommandLine.2.2.1\tools\NuGet.exe pack Seterlund.CodeGuard.Source.nuspec
..\packages\NuGet.CommandLine.2.2.1\tools\NuGet.exe push Seterlund.CodeGuard.Source.2.3.4.nupkg
popd
