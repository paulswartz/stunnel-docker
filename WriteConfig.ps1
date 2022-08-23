$stunnel_root = "C:\Program Files (x86)\stunnel"
$core_config_path = "C:\Users\ContainerAdministrator\stunnel\stunnel.conf"

echo "Writing environment configuration..."
${env:STUNNEL_CONF} | Out-File -Append -Encoding ascii $core_config_path

echo "Starting stunnel..."
copy $core_config_path $stunnel_root\config\stunnel.conf
& "$stunnel_Root\bin\stunnel.exe"

# Wait for Stunnel to start
sleep 5

ps stunnel
if (-not $?)
{
    Write-Error "Unable to start stunnel"
    Exit 1
}

Get-Content -Wait stunnel.log
