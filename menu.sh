#!/bin/bash
#Menu
clear
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "===================-Welcome To Premium Script Menu===================-"
echo "=========================-Remodified by TuanYz-=======================-"
echo " "
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
echo -e "\e[032;1mCPU Model:\e[0m $cname"
echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
echo -e "\e[032;1mSystem Uptime:\e[0m $up"
echo -e “================================================================"
echo -e ""
echo -e "=============================-Menu-============================="
echo -e ""
echo -e "=========================-SSH & OpenVPN-========================"
echo -e "${color1}1${color3}: Buat akun SSH dan OpenVPN (${color2}usernew${color3})"
echo -e "${color1}2${color3}: Buat akun SSH dan OpenVPN sementara(${color2}trial${color3})"
echo -e "${color1}3${color3}: Generate Random Account (${color2}user-generate${color3})"
echo -e "${color1}4${color3}: Extending SSH & OpenVPN Account Active Life (${color2}renew${color3})"
echo -e "${color1}5${color3}: Hapus akun SSH dan OpenVPN (${color2}deluser${color3})"
echo -e "${color1}6${color3}: Lihat daftar Member akun SSH dan OpenVPN (${color2}member${color3})"
echo -e "${color1}7${color3}: Hapus akun SSH dan OpenVPN yang sudah expired (${color2}delete${color3})"
echo -e "${color1}8${color3}: Set up Autokill SSH (${color2}autokill${color3})"
echo -e "${color1}9${color3}: Lock User Account (${color2}user-lock${color3})"
echo -e "${color1}10${color3}: Unlock User Account (${color2}user-unlock${color3})"
echo -e "${color1}11${color3}: Tampilkan Multi Login SSH (${color2}ceklim${color3})"
echo -e "${color1}12${color3}: Mulai ulang Dropbear, Webmin, Squid3,Dll (${color2}restart${color3})"
echo -e "${color1}13${color3}: Change User Account Password (${color2}user-password${color3})"
echo -e "${color1}14${color3}: Display User Lists (${color2}user-list${color3})"
echo -e "${color1}15${color3}: Display Locked User Account (${color2}log-limit${color3})"
echo -e "${color1}16${color3}: Remove Expired User Account (${color2}user-delete-expired${color3})"
echo -e ""
echo -e "==========================-Wireguard-============================="
echo -e "${color1}17${color3}: Buat akun Wireguard (${color2}addwg${color3})"
echo -e "${color1}18${color3}: Hapus akun Wireguard (${color2}delwg${color3})"
echo -e "${color1}19${color3}: Perbarui akun Wireguard (${color2}renewwg${color3})"
echo -e "${color1}20${color3}: Cek tampilan Wireguard (${color2}wg${color3})"
echo -e ""
echo -e "=========================-L2TP/IPSEC-============================"
echo -e "${color1}21${color3}: Creating L2TP / IPSEC Account (${color2}addl2tp${color3})"
echo -e "${color1}22${color3}: Deleting L2TP / IPSEC Account (${color2}dell2tp${color3})"
echo -e "${color1}23${color3}: Extend L2TP / IPSEC Account (${color2}renewl2tp${color3})"
echo -e ""
echo -e "============================-PPTP-=============================="
echo -e "${color1}24${color3}: Create Account PPTP (${color2}addpptp${color3})"
echo -e "${color1}25${color3}: Delete PPTP Account (${color2}delpptp${color3})"
echo -e "${color1}26${color3}: Extend PPTP Account (${color2}renewpptp${color3})"
echo -e ""
echo -e "============================-SSTP-=============================="
echo -e "${color1}27${color3}: Create Account SSTP (${color2}addsstp${color3})"
echo -e "${color1}28${color3}: Delete SSTP Account (${color2}delsstp${color3})"
echo -e "${color1}29${color3}: Extend SSTP Account (${color2}renewsstp${color3})"
echo -e ""
echo -e "=============================-SSR-=============================="
echo -e "${color1}30${color3}: Buat akun shadowsocks-R (${color2}addssr${color3})"
echo -e "${color1}31${color3}: Hapus akun shadowsocks-R (${color2}delssr${color3})"
echo -e "${color1}32${color3}: Perbarui akun shadowsocks-R (${color2}renewssr${color3})"
echo -e "${color1}33${color3}: Tampilkan menu shadowsocks-R lainnya (${color2}ssr${color3})"
echo -e ""
echo -e "=======================-Shadowsocks OBFS-========================"
echo -e "${color1}34${color3}: Buat akun shadowsocks (${color2}addss${color3})"
echo -e "${color1}35${color3}: Hapus akun shadowsocks (${color2}delss${color3})"
echo -e "${color1}36${color3}: Perbarui akun shadowsocks (${color2}renewss${color3})"
echo -e ""
echo -e "============================-V2RAY-============================="
echo -e "${color1}37${color3}: Buat akun vmess (${color2}addws${color3})"
echo -e "${color1}38${color3}: Hapus akun vmess (${color2}delws${color3})"
echo -e "${color1}39${color3}: Perbarui akun vmess (${color2}renewws${color3})"
echo -e "${color1}40${color3}: Perbarui serifikat vmess (${color2}certv2ray${color3})"
echo -e ""
echo -e "============================-VLESS-============================="
echo -e "${color1}41${color3}: Buat akun vless (${color2}addvless${color3})"
echo -e "${color1}42${color3}: Hapus akun vless (${color2}delvless${color3})"
echo -e "${color1}43${color3}: Perbarui akun vless (${color2}renewvless${color3})"
echo -e ""
echo -e "============================-Trojan-=============================="
echo -e "${color1}44${color3}: Buat akun trojan (${color2}addtr ${color3})"
echo -e "${color1}45${color3}: Hapus akun trojan (${color2}deltr${color3})"
echo -e "${color1}46${color3}: Perbarui akun trojan (${color2}renewtr${color3})"
echo -e ""
echo -e "=========================-Anti-Torrent-============================="
echo -e "${color1}47${color3}: Anti-Torrent (${color2}antitorrent${color3})"
echo -e ""
echo -e "===================-[ EDIT SERVER MESSAGE ]-======================"
echo -e "${color1}48${color3}: Edit Server Message (${color2}editsm${color3})"
echo -e " "
echo -e "=============================-SYSTEM-==========================="
echo -e "${color1}49${color3}: Buat domain untuk VPS (${color2}addhost${color3})"
echo -e "${color1}50${color3}: Tampilkan menu webmin (${color2}webmin${color3})"
echo -e "${color1}51${color3}: Cek Penggunaan ram VPS (${color2}ram${color3})"
echo -e "${color1}52${color3}: Reboot VPS (${color2}reboot${color3})"
echo -e "${color1}53${color3}: Change Server Password (${color2}passwd${color3})"
echo -e "${color1}54${color3}: Tes kecepatan VPS (${color2}speedtest${color3})"
echo -e "${color1}55${color3}: Benchmark Server (${color2}bench-network${color3})"
echo -e "${color1}56${color3}: Informasi (${color2}info${color3})"
echo -e "${color1}57${color3}: Informasi script autossh (${color2}about${color3})"
echo -e ""
echo -e "================================================================"
echo -e ""
echo -e "=========================-[ EXTRA MENU ]-========================="
echo -e "${color1}00${color3}: Exit Menu (${color2}exit${color3})"
echo -e ""
read -p "Choose an option from (1-57): " x
if test $x -eq 1; then
usernew
elif test $x -eq 2; then
trial
elif test $x -eq 3; then
user-generate
elif test $x -eq 4; then
renew
elif test $x -eq 5; then
deluser
elif test $x -eq 6; then
member
elif test $x -eq 7; then
delete
elif test $x -eq 8; then
autokill
elif test $x -eq 9; then
user-lock
elif test $x -eq 10; then
user-unlock
elif test $x -eq 11; then
ceklim
elif test $x -eq 12; then
restart
elif test $x -eq 13; then
user-password
elif test $x -eq 14; then
user-list
elif test $x -eq 15; then
log-limit
elif test $x -eq 16; then
user-delete-expired
elif test $x -eq 17; then
addwg
elif test $x -eq 18; then
delwg
elif test $x -eq 19; then
renewwg
elif test $x -eq 20; then
wg
elif test $x -eq 21; then
addl2tp
elif test $x -eq 22; then
dell2tp
elif test $x -eq 23; then
renewl2tp
elif test $x -eq 24; then
addpptp
elif test $x -eq 25; then
delpptp
elif test $x -eq 26; then
renewpptp
elif test $x -eq 27; then
addsstp
elif test $x -eq 28; then
delsstp
elif test $x -eq 29; then
renewsstp
elif test $x -eq 30; then
addssr
elif test $x -eq 31; then
delssr
elif test $x -eq 32; then
renewssr
elif test $x -eq 33; then
ssr
elif test $x -eq 34; then
addss
elif test $x -eq 35; then
delss
elif test $x -eq 36; then
renewss
elif test $x -eq 37; then
addws
elif test $x -eq 38; then
delws
elif test $x -eq 39; then
renewws
elif test $x -eq 40; then
certv2ray
elif test $x -eq 41; then
addvless
elif test $x -eq 42; then
delvless
elif test $x -eq 43; then
renewvless
elif test $x -eq 44; then
addtr
elif test $x -eq 45; then
deltr
elif test $x -eq 46; then
renewtr
elif test $x -eq 47; then
antitorrent
elif test $x -eq 48; then
editsm
elif test $x -eq 49; then
addhost
elif test $x -eq 50; then
webmin
elif test $x -eq 51; then
ram
elif test $x -eq 52; then
reboot
elif test $x -eq 53; then
passwd
elif test $x -eq 54; then
speedtest
elif test $x -eq 55; then
bench-network
elif test $x -eq 56; then
info
elif test $x -eq 57; then
about
elif test $x -eq 00; then
echo " "
echo "Goodbye Menu!"
echo "Remodified by TuanYz"
echo " "
exit
else
echo "Options Not Available In Menu."
echo " "
exit
fi
