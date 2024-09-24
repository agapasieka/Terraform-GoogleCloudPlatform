#Link to article
#Deploy Terraform code
#After deployment tasks
https://www.cloudskillsboost.google/games/5426/labs/35169
1. Create a password for ad-dc1
   ```
   gcloud compute reset-windows-password ad-dc1 --zone ${zone_1} --quiet --user=admin
   ```
2. Set the Windows credentials for the Administrator account
   ```
   net user Administrator *
   ```
3. Enable the account
   ```
   net user Administrator /active:yes
   ```
4. Open a PowerShell terminal as Administrator and set the following variables
   ```
   $DNS1 = "10.2.0.100"
   $DNS2 = "127.0.0.1"
   $LocalStaticIp = "10.1.0.100"
   $DefaultGateway = "10.1.0.1"
   ```
5. Set the IP address and default gateway
   ```
   netsh interface ip set address name=Ethernet static `
    $LocalStaticIp 255.255.255.0 $DefaultGateway 1
   ```
6. Configure the primary DNS server
   ```
   netsh interface ip set dns Ethernet static $DNS1
   ```
7. Configure the secondary DNS server
   ```
   netsh interface ip add dns Ethernet $DNS2 index=2
   ```



   
