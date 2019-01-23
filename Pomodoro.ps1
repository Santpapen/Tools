#requires -version 3

Function Pomodoro-Session{
<#
    .SYSNOPSIS
    Pomodoro-Session is a command to start a Pomodor Session.

    .EXAMPLE
    Pomodoro-Session -Minutes 25
#>
    [CmdletBinding()]
    Param(
     [int] $Minutes = 25, # Default time
     [string] $Activity = "" # Your Activity
    )
    # Counting down to end of Pomodoro
    $seconds = $Minutes * 60
    $delay = 1 #seconds between ticks
     cls
     Write-Host "Inicio de "$Activity " durante:" $Minutes
     Write-Host "Procure no distraerse durante este tiempo"
        for ($i = $seconds; $i -gt 0; $i=$i-$delay){
            $PercentComplete = 100 - (($i/$seconds)*100)
            Write-Progress -Activity "Pomodoro-Session: $Minutes" -PercentComplete $PercentComplete -Status "Time remaining:" -SecondsRemaining $i
            Start-Sleep -Seconds $delay
        }
    Write-Host "Fin del Pomodoro"
}