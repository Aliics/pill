#! /bin/bash

ESC_CHR="\e"
RST_TRM="$ESC_CHR[0m"
CLR_RED="$ESC_CHR[31m"
CLR_GRN="$ESC_CHR[32m"
CLR_YLW="$ESC_CHR[33m"
CLR_BLU="$ESC_CHR[34m"
CLR_MGT="$ESC_CHR[35m"

out_txt_clr() { # takes clr and txt
	echo -e "$1$2$RST_TRM"
}

# this is the actual runtime script
if [[ -z $1 ]]; then
	out_txt_clr $CLR_RED "No argument found. Requires search parameter."
	exit 1
fi
out_txt_clr $CLR_GRN "Gathering pid(s) associated with \"$1\"..."
pid=`ps aux | grep $1 | grep -v grep | grep -v bash | awk '{print $2}'`
shw_pid=`ps aux | grep $1 | grep -v grep | grep -v bash | awk '{printf "%s - %s\n", $2, $11}'`
if [[ -z $pid ]]; then
	out_txt_clr $CLR_GRN "No processes to kill."
else
	don=false
	out_txt_clr $CLR_RED "Do you really want to kill processes: \"$CLR_MGT$shw_pid$CLR_RED\"?"
 	while [[ $don = false ]]; do
  		out_txt_clr $CLR_YLW "[y/n]"
  		read ans
  		if [[ -n $ans && $ans = "y" || $ans = "n" ]]; then
   			don=true
   			if [[ $ans = "y" ]]; then
    			out_txt_clr $CLR_BLU "Killing: \"$CLR_MGT$shw_pid$CLR_BLU\"!"
    			kill $pid
   			elif [[ $ans = "n" ]]; then
    			out_txt_clr $CLR_GRN "Alright... have a nice day!"
   			fi
  		else
   			out_txt_clr $CLR_RED "Invalid answer!"
  		fi
 	done
fi

