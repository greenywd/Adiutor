COUNTER=0
         while [  $COUNTER -lt 55 ]; do
             echo The counter is $COUNTER
make package             
let COUNTER=COUNTER+1 
         done
