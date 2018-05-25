# script needs sudo
if [ "$EUID" -ne 0 ]
then echo "ERROR: Run script as root (sudo)"
  exit
fi

# start postgresql
sudo systemctl start postgresql

# run python script
python -W ignore main.py
