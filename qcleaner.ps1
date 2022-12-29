# Cleanner Temp Files By QuantumWavves
function Test-Administrator  
{  
    [OutputType([bool])]
    param()
    process {
        [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
        return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    }
}
if(-not (Test-Administrator))
{
    # TODO: define proper exit codes for the given errors 
    Write-Error "This script must be executed as Administrator.";
    exit 1;
}
function General {
    #---------------------Clean Temp Files for Admin User System----------------#
    Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Temporary files cleared"
    #-------------------Clean Logs--------------------#
    Get-ChildItem -Path "C:\Windows\Logs\CBS" *.log -Recurse | Remove-Item -Force -Recurse
    Write-Output "Temporary log files cleared"
}
function UserFiles {
    #-------------------Clean Temp Files for User-------------------#
    Get-ChildItem -Path "$env:temp" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Temporary files user cleared"
    #---------------Clear Recycle Bin------------#
    Clear-RecycleBin -Force
    Write-Output "Recycle bin cleared"
}
function Browser {
    EdgeCleaner
    ChromeCleaner
    BraveCleaner
    FirefoxCleaner
}
function EdgeCleaner {
    #--------Clear Temp Files Edge Chromium Browser-------------#
    Stop-Process -Name msedge -Force
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Default\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Default\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\GrShaderCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Default\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Edge temporary files cleared"
    ##-------Clear Files for another profiles----------##
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 1\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 1\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 1\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 1\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse

    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 2\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 2\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 2\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Microsoft\Edge\User Data\Profile 2\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Edge users temporary files cleared"
}
function ChromeCleaner {
    #--------------Clean Temp Files Google Chrome---------------#
    Stop-Process -Name chrome -Force
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\GrShaderCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\ShaderCache\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Google Chrome temporary files cleared"
    #--------------Google Chrome files for another profiles------------#
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 1\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 1\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 1\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 1\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse

    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 2\Cache" *.* -Recurse | Re`move-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 2\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 2\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Profile 2\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Google Chrome users temporary files cleared"
}
function BraveCleaner {
    #--------------Clean Temp Files Brave Browser--------------#
    Stop-Process -Name brave -Force
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\GrShaderCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\ShaderCache\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Brave temporary files cleared"
    #-----------Clean files for another profiles---------------#
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 1\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 1\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 1\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 1\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse

    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 2\Cache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 2\Service Worker" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 2\GPUCache" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path "C:\Users\$env:username\AppData\Local\BraveSoftware\Brave-Browser\User Data\Profile 2\Storage\ext\" *.* -Recurse | Remove-Item -Force -Recurse
    Write-Output "Brave users temporary files cleared"
}
function FirefoxCleaner {
    #--------------Clean Temp Files Firefox Browser--------------#
    Stop-Process -Name firefox -Force
    foreach ($itemF in Get-ChildItem -Path C:\Users\$env:username\AppData\Local\Mozilla\Firefox\Profiles\ ){
        Get-ChildItem -Path "$itemF\cache2\entries\" *.* -Recurse | Remove-Item -Force -Recurse 
        Get-ChildItem -Path "$itemF\startupCache" *.bin -Recurse | Remove-Item -Force -Recurse
        Get-ChildItem -Path "$itemF\startupCache" *.lz -Recurse | Remove-Item -Force -Recurse
        Get-ChildItem -Path "$itemF\startupCache" *.lz4 -Recurse | Remove-Item -Force -Recurse
        Get-ChildItem -Path "$itemF\cache2\" index.* -Recurse | Remove-Item -Force -Recurse
        Get-ChildItem -Path "$itemF\startupCache\" *.little -Recurse | Remove-Item -Force -Recurse
        Get-ChildItem -Path "$itemF\cache2" *.log -Recurse | Remove-Item -Force -Recurse
        Write-Output "Firefox temporary files cleared"
    }
}
UserFiles
Browser