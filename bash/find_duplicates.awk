{ a[$2,NR]=$0; c[$2]++ }
END {
    for( k in a ) {

        split(k,b,SUBSEP)

       t=c[b[1]] # added this bit to capture count

       if( b[1] in c && t>1 ) { # added && t>1 only print if count more than 1
         print RS "TIMES  ID" RS c[b[1]] "  " b[1] RS
         delete c[b[1]]
       }

       for(i=1;i<=NR;i++) if( a[b[1],i] ) {
               if(t>1){print a[b[1],i]} # added if(t>1) only print lines if count more than 1
               delete a[b[1],i]
           }
    }
}
