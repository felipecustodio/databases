# initialize postgresql (windows/linux)


# check if packages are installed
if python -c "import package_name" &> /dev/null; then
    echo 'Packages installed.'
else
    echo 'Install packages first using pip install -r requirements.txt'
fi

# run python script
python main.py
