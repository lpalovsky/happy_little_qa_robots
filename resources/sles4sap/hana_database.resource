pooadm@hana01:/usr/sap/POO/HDB00> HDB stop
hdbdaemon will wait maximal 300 seconds for NewDB services finishing.
Stopping instance using: /usr/sap/POO/SYS/exe/hdb/sapcontrol -prot NI_HTTP -nr 00 -function Stop 400

01.12.2025 18:09:17
Stop
OK
Waiting for stopped instance using: /usr/sap/POO/SYS/exe/hdb/sapcontrol -prot NI_HTTP -nr 00 -function WaitforStopped 600 2


01.12.2025 18:09:41
WaitforStopped
OK
hdbdaemon is stopped.
pooadm@hana01:/usr/sap/POO/HDB00> echo $?
0

===============================================================
pooadm@hana01:/usr/sap/POO/HDB00> HDB start


StartService
OK
OK
Starting instance using: /usr/sap/POO/SYS/exe/hdb/sapcontrol -prot NI_HTTP -nr 00 -function StartWait 2700 2


01.12.2025 18:18:44
Start
OK

01.12.2025 18:19:14
StartWait
OK