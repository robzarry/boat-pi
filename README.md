# boat-pi
Configuration for Raspberry Pi and SignalK on our boat
First, the hardware, noting that I chose to go with NVME drive vs. SD and got large capacity so I could store data locally. 
 
Cost could be reduced by using an SD card, I prefer the reliability of the NVME. 
 
I also added an uninterruptible power supply to ensure a smooth shutdown if the boat lost power, still working through some kinks in the configuration of that as it doesn't come properly configured out of the box.
 
Raspberry Pi 4 w/ 8 GB: https://www.amazon.com/dp/B0899VXM8F

NVME Drive Board: https://www.amazon.com/dp/B0CBJYWKJ1

NVME Drive: https://www.amazon.com/dp/B0CP9CXCXG

UPS: https://www.amazon.com/dp/B087FXLZZH

UPS Batteries: https://www.amazon.com/Rechargeable-Battery-Batteries-Headlamp-Flashlight/dp/B0CL7KPHWP

12 volt -> 5 volt Power Supply: https://www.amazon.com/dp/B00J3MHTYG

5 volt to UPS cable: https://www.amazon.com/dp/B0DLKNF297

Pican NMEA Hat: https://copperhilltech.com/pican-m-nmea-0183-nmea-2000-hat-for-raspberry-pi/

NMEA Cable: https://www.amazon.com/dp/B001G9W0WA
 
One might also need an adapter or tee fitting if there isn't a free port on your NMEA network... 
 
Installation and configuration is covered in this excellent article on Steve Mitchell's highly useful Seabits site.  He covers most of what's needed to get up and running:

https://seabits.com/set-up-signal-k-and-grafana-on-raspberry-pi-with-pican-m-nmea-2000-board/
 
