#!/bin/bash

install_destination='../../lib/'
libname="libzrandom.a"
object_files="Boost_Random.o Standard_Random.o State_of_Art_Random.o dSFMT.o Random.o random.o"

tmp_destination="lib/"


##################
function if_error
##################
{
if [[ $? -ne 0 ]]; then # check return code passed to function
echo "$1" 
exit $?
fi
}

echo "Compiling..."
make 2>/dev/null 1>/dev/null
if_error "ERROR: Source Code does not compile!"

mkdir $tmp_destination

echo "Creating Libraries:"

echo "Building lib..."
ar rcs $tmp_destination$libname $object_files

mv $tmp_destination$libname $install_destination



