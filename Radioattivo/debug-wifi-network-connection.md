# Debug Wi-Fi - not establishing network connection

- [GET HARDWARE & NETWORK INFO](#get-hardware-&-network-info)
  - [1. List Device Info](#1.-list-device-info)
  - [2. List Network Info](#2.-list-network-info)
  - [3. List Preferred Networks](#3.-list-preferred-networks)
- [SET VARIABLES](#set-variables)
- [DECISION TREE](#decision-tree)
  - [1. Is network service available?](#1.-is-network-service-available?)
  - [2. Is Wi-Fi radio on?](#2.-is-wi-fi-radio-on?)
  - [3. Is Wi-Fi service connected to network?](#3.-is-wi-fi-service-connected-to-network?)
- [ERROR CONDITIONS](#error-conditions)
- [DIAGNOSTICS](#diagnostics)
- [COMMANDS NOT RUN](#commands-not-run)
- [sources](#sources)

## GET HARDWARE & NETWORK INFO

### 1. List Device Info 

```zsh
networksetup -listallhardwareports
Hardware Port: Ethernet
Device: en0
Ethernet Address: c4:2c:03:0c:5f:e9

Hardware Port: Wi-Fi
Device: en1
Ethernet Address: f8:1e:df:e8:46:66

VLAN Configurations
===================
```

### 2. List Network Info

```zsh
networksetup -listallnetworkservices
An asterisk (*) denotes that a network service is disabled.
Wi-Fi
Ethernet
FireWire
```

### 3. List Preferred Networks

```zsh
networksetup -listpreferredwirelessnetworks en1
Preferred networks on en1:
    Azkaban
    Epiphany
    FidoF1415
    KPL-CountryHills
    KPL-MAIN
    Kitchener Public WiFi
    zucchero
    zucker
```

## SET VARIABLES

```zsh
dev=en1
srv=Wi-Fi
net=KPL-CountryHills
```

## DECISION TREE

### 1. Is network service available?

```zsh
networksetup -getnetworkserviceenabled $srv
Disabled
Enabled

networksetup -setnetworkserviceenabled $srv on|off # {enable,disable}
```

### 2. Is Wi-Fi radio on?

> Device power status?

```zsh
networksetup -getairportpower $dev  # Is Wi-Fi radio on?
Wi-Fi Power (en1): Off
Wi-Fi Power (en1): On

networksetup -setairportpower $dev on|off  # {enable,disable}
```

### 3. Is Wi-Fi service connected to network?

```zsh
networksetup -getairportnetwork $dev
You are not associated with an AirPort network.
Current Wi-Fi Network: KPL-CountryHills

networksetup -setairportnetwork $dev $net  # syntax: $dev $net password, if pwd does not exist in Keychain Access
Could not find network KPL-CountryHills.   # IF($?=0,,Could not find network $net.)
```

## ERROR CONDITIONS

```zsh
dev=en1

networksetup -getairportpower $dev
Wi-Fi Power (en1): On

networksetup -getairportnetwork $dev
You are not associated with an AirPort network.

networksetup -setairportnetwork $dev KPL-CountryHills
Could not find network KPL-CountryHills.

networksetup -getairportnetwork $dev
You are not associated with an AirPort network.
Wi-Fi power is currently off.
```

## DIAGNOSTICS

Run diagnostics. Start with `networksetup -- configuration tool for network settings`

```zsh
# VARIABLES
hardwareport   = Wi-Fi
networkservice = Wi-Fi
device         = en1

# REPORTS
% networksetup -listnetworkserviceorder
An asterisk (*) denotes that a network service is disabled.
(1) Wi-Fi
(Hardware Port: Wi-Fi, Device: en1)

(2) Ethernet
(Hardware Port: Ethernet, Device: en0)

(3) FireWire
(Hardware Port: FireWire, Device: fw0)

% networksetup -listallnetworkservices
An asterisk (*) denotes that a network service is disabled.
Wi-Fi
Ethernet
FireWire

% networksetup -listallhardwareports
Hardware Port: Ethernet
Device: en0
Ethernet Address: c4:2c:03:0c:5f:e9

Hardware Port: Wi-Fi
Device: en1
Ethernet Address: f8:1e:df:e8:46:66

VLAN Configurations
===================

% networksetup -detectnewhardware

% networksetup -getmacaddress Wi-Fi # networksetup -getmacaddress [hardwareport]
Ethernet Address: f8:1e:df:e8:46:66 (Hardware Port: Wi-Fi)

% networksetup -getcomputername
Zorg

% networksetup -getinfo Wi-Fi
DHCP Configuration
Client ID: 
IPv6: Automatic
IPv6 IP address: none
IPv6 Router: none
Wi-Fi ID: f8:1e:df:e8:46:66

% networksetup -getadditionalroutes Wi-Fi
There are no additional IPv4 routes on Wi-Fi.

% networksetup -getdnsservers Wi-Fi
1.1.1.1
1.0.0.1
2606:4700:4700::1111
2606:4700:4700::1001

% networksetup -getsearchdomains Wi-Fi
PUBLIC.LIBRARY.LOCAL

% networksetup -getftpproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getwebproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getsecurewebproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getstreamingproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getgopherproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getsocksfirewallproxy Wi-Fi
Enabled: No
Server: 
Port: 0
Authenticated Proxy Enabled: 0

% networksetup -getproxybypassdomains Wi-Fi
*.local
169.254/16

% networksetup -getproxyautodiscovery Wi-Fi
Auto Proxy Discovery: Off

% networksetup -getpassiveftp Wi-Fi 
Passive FTP: On

% networksetup -getairportnetwork en1 
You are not associated with an AirPort network.

% networksetup -getairportpower en1 
Wi-Fi Power (en1): On

% networksetup -listpreferredwirelessnetworks en1
Preferred networks on en1:
	KPL-CountryHills
	Azkaban
	Kitchener Public WiFi
	zucker
	zucchero

% networksetup -getnetworkserviceenabled Wi-Fi 
Enabled

% networksetup -ordernetworkservices service1 service2 ... "last service n"
% networksetup -ordernetworkservices Wi-Fi Ethernet FireWire

% networksetup -getMTU Wi-Fi 
Active MTU: 1500 (Current Setting: 1500)

% networksetup -listvalidMTUrange Wi-Fi 
Valid MTU Range: 1280-1500

% networksetup -getmedia Wi-Fi 
Current: autoselect
Active: not set

% networksetup -listvalidmedia Wi-Fi 
autoselect

% networksetup -listVLANs 
There are no VLANs currently configured on this system.

% networksetup -listdevicesthatsupportVLAN 
en0 (Ethernet)

% networksetup -isBondSupported en1 
NO

% networksetup -listBonds 

% networksetup -listpppoeservices 

% networksetup -listlocations 
Automatic
KPL

% networksetup -getcurrentlocation 
KPL

% networksetup -version
networksetup, Version 1.8.4
Copyright 2002-2020 Apple Inc. All rights reserved. 

% networksetup -help
[prints this list of commands with descriptions &/or examples]

% networksetup -printcommands
[prints this list]
```

## COMMANDS NOT RUN

```zsh
networksetup
  -setcomputername computername
  -setmanual Wi-Fi ip subnet router
  -setdhcp Wi-Fi clientid
  -setbootp Wi-Fi
  -setmanualwithdhcprouter Wi-Fi ip
  -setadditionalroutes Wi-Fi dest1 mask1 gate1 dest2 mask2 gate2 ... destN maskN gateN
  -setv4off Wi-Fi
  -setv6off Wi-Fi
  -setv6automatic Wi-Fi
  -setv6linklocal Wi-Fi
  -setv6manual Wi-Fi address prefixLength router
  -getv6additionalroutes Wi-Fi
  -setv6additionalroutes Wi-Fi dest1 prefixlength1 gate1 dest2 prefixlength2 gate2 ... destN prefixlengthN gateN
  -setdnsservers Wi-Fi dns1 dns2 ...
  -setsearchdomains Wi-Fi domain1 domain2 ...
  -create6to4service Wi-Finame
  -set6to4automatic Wi-Fi
  -set6to4manual Wi-Fi relayAddress
  -setftpproxy Wi-Fi domain portnumber authenticated username password
  -setftpproxystate Wi-Fi on | off
  -setwebproxy Wi-Fi domain portnumber authenticated username password
  -setwebproxystate Wi-Fi on | off
  -setsecurewebproxy Wi-Fi domain portnumber authenticated username password
  -setsecurewebproxystate Wi-Fi on | off
  -setstreamingproxy Wi-Fi domain portnumber authenticated username password
  -setgopherproxy Wi-Fi domain portnumber authenticated username password
  -setgopherproxystate Wi-Fi on | off
  -setpppoeaccountname service account
  -setpppoepassword service password
  -setsocksfirewallproxy Wi-Fi domain portnumber authenticated username password
  -setsocksfirewallproxystate Wi-Fi on | off
  -setproxybypassdomains Wi-Fi domain1 domain2 ...
  -setproxyautodiscovery Wi-Fi on | off
  -setpassiveftp Wi-Fi on | off
  -setairportnetwork device network password
  -setairportpower device on | off
  -setMTU Wi-Fi value
  -setnetworkserviceenabled Wi-Fi on | off
  -setmedia Wi-Fi subtype option1 option2 ...
  -removepreferredwirelessnetwork Wi-Fi network
  -removeallpreferredwirelessnetworks Wi-Fi
  -createnetworkservice Wi-Finame Wi-Fi
  -duplicatenetworkservice Wi-Fi newnetworkservicename
  -removenetworkservice Wi-Fi
  -createVLAN name parentdevice tag
  -deleteVLAN name parentdevice tag 
  -createBond name device1 device2 ...
  -deleteBond bond
  -removeDeviceFromBond device bond
  -createpppoeservice device name account password pppoeName
  -deletepppoeservice service
  -createlocation location populate
  -deletelocation location
  -addpreferredwirelessnetworkatindex en1 network index securitytype password 
  -renamenetworkservice Wi-Fi newnetworkservicename 
  -addDeviceToBond en1 bond
  -showBondStatus bond  
  -showpppoestatus name 
  -connectpppoeservice service 
  -disconnectpppoeservice **service** 
  -switchtolocation location 
```

## sources

Tags: system administration, sysadmin, network admin, macos, linux, command line, cli

^ 2022-09-28T10:25:32-04:00\
% 2022-10-27T19:27:13-04:00

<!-- SOURCES & RESOURCES -->

