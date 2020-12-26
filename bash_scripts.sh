#!/usr/local/bin/bash
#please change this to where your bash is installed

#--------- Function to Compile cpp file and find associated cpp ------#
#---------- files with the include headers -------#

function cppcompile()
{
  filename=$1
  re="^\#include \""
  while read -r line
  do
    if [[ $line =~ $re ]]; then
      temp=${line:9}
      temp1=${temp#\"}
      temp2=${temp1%\.*\"}
      g++-10 -std=c++17 -c "$temp2".cpp
    fi
  done < "$filename".cpp
  g++-10 -std=c++17 -c "$filename".cpp
  g++-10 -o "$filename" ./*.o
  "./$filename"
  rm ./*.o
}


#--------------generating cpp file in temporary location -------------------#

generate_rubbish()
{
  myEditor=sublime 		#you can put any editor that you launch from the shell/cmd here. 
  location=${HOME}/.tmp 	# you can change the location if you want.
  chars=abcdefghijklmnbvczxqwer91231tyyuiopQAZXSWEDCVFRTGBNHYU099287123JM1234 # Random character to pick from

  if [[ $# -eq 1 ]]; then
    ranName="$1"
  else
    ranName="${chars:RANDOM%${#chars}:8}.cpp"
  fi
  cd "${HOME}" || exit;
  if [[ -d "$location" ]]; then
      cd "$location" || exit;
  else
      mkdir "$location"
      cd "$location" || exit;
  fi
  
  touch $ranName;
  $myEditor $ranName

}


# ------------------ Find compile_commands.json and copy it to the top directory ----------- #

mv_compile_commands() {
  if [[ $# -eq 1 ]]; then
  path=$1
  else
  path=.
  fi
  find . -name 'compile_commands.json' -exec cp {} $path \;
}