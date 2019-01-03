### Start toggle_bt.sh

cat /proc/acpi/ibm/bluetooth |head -1 |grep -q enabled

if [ "$?" -ne "0" ]; then
  echo enabled > /proc/acpi/ibm/bluetooth
  exit 0
fi

echo disabled > /proc/acpi/ibm/bluetooth
### End toggle_bt.sh
