# Variables

$Fichero = Read-Host -Prompt 'Fichero a compilar (sin extensión ej: main)'# "main"
$path_workarea = "Ruta del workarea"
$path_bin = "Ruta de ficheros bin"

# move to dir (csc compiler)
cd C:\Windows\Microsoft.NET\Framework\v4.0.30319\ # Ruta a la carpeta con la versión de .Net

# Compile Code
#.\csc.exe -out:$path_bin\$Fichero.exe -reference:<ruta libreria de referencia>\System.Data.SQLite.dll $path_workarea\$Fichero.cs
.\csc.exe -out:$path_bin\$Fichero.exe -optimize $path_workarea\$Fichero.cs

# Pause script (view Result)
Read-Host -Prompt "Press Enter to exit"