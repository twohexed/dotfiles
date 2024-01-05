
-----

# NAT (Network Address Translation)

# Documentation

```
# Router 1
enable
configure terminal
interface g0/0
ip addresss 192.168.1.1 255.255.255.0
no shutdown
exit                                                                             interface g0/1                                                                   ip address 192.168.2.1 255.255.255.0                                             no shutdown
exit
ip router 192.168.3.0 255.255.255.0 192.168.2.2
ip nat inside source static 192.168.1.2  192.168.2.10
ip nat inside source static 192.168.1.2 192.168.2.11
ip nat inside source static 102168.1.4 192.168.2.12
interface g0/0
ip nat inside
exit
interface g0/1
ip nat outside
exit
```

```
# Router 2
enable
configure terminal
interface g0/0
ip address 192.168.2.2 255.255.255.0
no shutdown
exit
interface g0/1
ip address 192.168.2.1 255.255.255.0
no shutdown
exit
ip route 192.168.1.0 255.255.255.0 192.168.2.1
```