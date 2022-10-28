#!user/bin/bash

#path to the directory where the file should be created and used
path=/home/vagrant/memory_logs/log_file.log
#string formatting from date to extract hour and minute
midnight=$(date +%H%M)
#email address to receive the alert
email=**************@gmail.com

touch ${path}
#This command creates the log_file.log at the specified path. 
#Notice how we call the path variable.
if [[ ${midnight} == 0000 ]]; 
   then echo "HERE IS YOUR MIDNIGHT REPORT" | mutt -a ${path} -s "Midnight RAM Report" -- ${email} && sudo rm -f ${path}
else
date >> ${path}
free -h >> ${path}
echo "-------" >> ${path}
fi
