 #!/bin/bash 

if [ "$#" == "0" ]; then 
    echo "You need tu supply at least one argument!" 
    exit 1
fi 
 
DOMAINS=( '.com')
 
ELEMENTS=${#DOMAINS[@]} 
 
while (( "$#" )); do 
 
  for (( i=0;i<$ELEMENTS;i++)); do 
      whois $1${DOMAINS[${i}]} | egrep -q '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri' 
	  if [ $? -eq 0 ]; then 
	      a=$(echo "$1${DOMAINS[${i}]} : available"  | mailx -s "$1${DOMAINS[${i}]} : available" kapendra.com@gmail.com)

	  fi 
  done 
 
shift 
 
done 
