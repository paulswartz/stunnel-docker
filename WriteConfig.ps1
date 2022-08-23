$core_config_path = "C:\Users\ContainerAdministrator\stunnel\stunnel.conf"

echo "Writing environment configuration..."
${env:STUNNEL_CONF} | Out-File -Append -Encoding ascii $core_config_path

echo "Starting stunnel..."
& "C:\Program Files (x86)\stunnel\bin\stunnel.exe" $core_config_path

ps stunnel
if (-not $?)
{
    Write-Error "Unable to start stunnel"
    Exit 1
}

Get-Content -Wait stunnel.log
