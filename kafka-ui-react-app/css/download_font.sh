#/bin/bash

cat googlefont.css.orig |  sed -En "s/.*?(http.*?\.woff2).*/\1/p" | while read line ; 
do 
    file_name=$(echo $line | sed -En "s/https:..fonts.gstatic.com.s.(.*)/\1/p" | tr "/" "_");
    echo $file_name
    curl -so font/$file_name $line;
done
