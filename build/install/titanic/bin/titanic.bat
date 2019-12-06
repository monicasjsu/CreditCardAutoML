@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  titanic startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and TITANIC_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\titanic-0.0.1.jar;%APP_HOME%\lib\transmogrifai-core_2.11-0.5.2.jar;%APP_HOME%\lib\transmogrifai-readers_2.11-0.5.2.jar;%APP_HOME%\lib\transmogrifai-features_2.11-0.5.2.jar;%APP_HOME%\lib\transmogrifai-utils_2.11-0.5.2.jar;%APP_HOME%\lib\spark-avro_2.11-4.0.0.jar;%APP_HOME%\lib\scopt_2.11-3.5.0.jar;%APP_HOME%\lib\xgboost4j-spark-0.81.jar;%APP_HOME%\lib\xgboost4j-0.81.jar;%APP_HOME%\lib\scala-compiler-2.11.12.jar;%APP_HOME%\lib\graph-core_2.11-1.12.5.jar;%APP_HOME%\lib\scalaj-collection_2.11-0.1.2.jar;%APP_HOME%\lib\sourcecode_2.11-0.1.3.jar;%APP_HOME%\lib\json4s-ext_2.11-3.2.11.jar;%APP_HOME%\lib\akka-actor_2.11-2.3.11.jar;%APP_HOME%\lib\scala-xml_2.11-1.0.5.jar;%APP_HOME%\lib\scala-parser-combinators_2.11-1.0.4.jar;%APP_HOME%\lib\chill-algebird_2.11-0.8.4.jar;%APP_HOME%\lib\algebird-core_2.11-0.13.4.jar;%APP_HOME%\lib\chill-avro_2.11-0.8.4.jar;%APP_HOME%\lib\enumeratum_2.11-1.4.12.jar;%APP_HOME%\lib\algebra_2.11-0.7.0.jar;%APP_HOME%\lib\enumeratum-macros_2.11-1.4.12.jar;%APP_HOME%\lib\scala-reflect-2.11.12.jar;%APP_HOME%\lib\chill-bijection_2.11-0.8.4.jar;%APP_HOME%\lib\chill_2.11-0.8.4.jar;%APP_HOME%\lib\bijection-avro_2.11-0.9.4.jar;%APP_HOME%\lib\cats-kernel_2.11-0.9.0.jar;%APP_HOME%\lib\bijection-core_2.11-0.9.4.jar;%APP_HOME%\lib\scala-library-2.11.12.jar;%APP_HOME%\lib\geocoder-2.82.jar;%APP_HOME%\lib\carrier-1.72.jar;%APP_HOME%\lib\prefixmapper-2.82.jar;%APP_HOME%\lib\libphonenumber-8.8.5.jar;%APP_HOME%\lib\language-detector-0.0.1.jar;%APP_HOME%\lib\tika-core-1.16.jar;%APP_HOME%\lib\lucene-analyzers-kuromoji-7.3.0.jar;%APP_HOME%\lib\lucene-analyzers-opennlp-7.3.0.jar;%APP_HOME%\lib\lucene-suggest-7.3.0.jar;%APP_HOME%\lib\lucene-analyzers-common-7.3.0.jar;%APP_HOME%\lib\slf4j-api-1.7.6.jar;%APP_HOME%\lib\jsonic-1.2.11.jar;%APP_HOME%\lib\annotations-12.0.jar;%APP_HOME%\lib\guava-14.0.1.jar;%APP_HOME%\lib\lucene-spatial3d-7.3.0.jar;%APP_HOME%\lib\lucene-core-7.3.0.jar;%APP_HOME%\lib\opennlp-maxent-3.0.3.jar;%APP_HOME%\lib\opennlp-tools-1.8.3.jar;%APP_HOME%\lib\commons-validator-1.6.jar;%APP_HOME%\lib\commons-beanutils-1.9.2.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.7.3.jar;%APP_HOME%\lib\joda-time-2.9.4.jar;%APP_HOME%\lib\joda-convert-1.8.1.jar;%APP_HOME%\lib\commons-digester-1.8.1.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\config-1.2.1.jar;%APP_HOME%\lib\snakeyaml-1.15.jar;%APP_HOME%\lib\JavaEWAH-1.1.4.jar;%APP_HOME%\lib\chill-java-0.8.4.jar;%APP_HOME%\lib\kryo-shaded-3.0.3.jar;%APP_HOME%\lib\minlog-1.3.0.jar;%APP_HOME%\lib\objenesis-2.1.jar

@rem Execute titanic
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TITANIC_OPTS%  -classpath "%CLASSPATH%" com.salesforce.app.Titanic %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable TITANIC_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%TITANIC_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
