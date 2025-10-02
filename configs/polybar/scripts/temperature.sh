
#!/bin/bash
# Get CPU temperature (adjust 'coretemp' based on `sensors` output)
temp=$(sensors | grep 'Package id' | awk '{print $4}' | tr -d '+°C')
echo " $temp°C"  #  is a thermometer icon (Nerd Fonts)
