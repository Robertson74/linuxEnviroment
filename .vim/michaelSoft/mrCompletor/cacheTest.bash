# find ./src/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/\(.*\):\(.*\)/block,.\/\nfile,.\/\1\n\2\nendBlock,.\//" | sed -e "s/^\s*class\s*\(\S\+\).*/class,.\/\1/" 
# find ./src/ ./vendor/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/\(.*\):\(.*\)/block,.\/\nfile,.\/\1\n\2\nendBlock,.\//" | sed -e "s/^\s*class\s*\(\S\+\).*/class,.\/\1/" 
# find ./src/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/\(.*\):\(.*\)/block,.\/\nfile,.\/\1\n\2\nendBlock,.\//" | sed -e "s/^\s*class\s*\(\S\+\).*/class,.\/\1/" 
searchDirs="./"
searchFilesRegex="-regex \".*\.php\""
excludeFiles="| grep -v \"\/Resources\/\""
# classGrep="| xargs grep \"^\s*class\""
# formattingSed="| sed -e \"s/\(.*\):.*class\s*\(\S*\).*/block,.\/\nfile,.\/\1\nclass,.\/\2\nendBlock,.\/\n/\""
formattingSed="| sed -e \"s/\(.*\)/block,.\/\nfile,.\/\1\nendBlock,.\/\n/\""
classCacheFile="./.michaelSoft/mrCompleter/classCache.mr"
classGrep="sed"
phpClassRegex="^\s*public\sfunction"
phpVarRegex="^\s*public\s\$"
phpConstRegex="^\s*const"
phpClassDefRegex="^\s*class"

phpClassCacheRegex="\($phpClassRegex\|$phpVarRegex\|$phpConstRegex\|$phpClassDefRegex\)"


cacheDir=`echo $classCacheFile | sed -e "s/classCache.mr//"`
mkdir "$cacheDir" -p
echo "start,./" > $cacheDir"/refreshCache.mr"

eval "find $searchDirs $searchFilesRegex $excludeFiles $formattingSed > $classCacheFile"


cache=''
for i in `sed -n '/block/{:a;N;/endBlock/!ba; /file/p}' $classCacheFile | sed -n '/file,.\//p' | sed -e 's/file,.\///'` 
do
  echo "$i"
  classCache=`grep "\($phpClassCacheRegex\)" "$i"`
  while read line; do
    if [[ "$line" =~ $i ]]
    then
    #   echo $line >> $cacheDir"/refreshCache.mr"
    #   echo "$classCache" >> $cacheDir"/refreshCache.mr"
    echo "hi"
    else
      echo $line >> $cacheDir"/refreshCache.mr"
    fi
  done < $classCacheFile
  # echo hi
  # echo $i
  # classItems=`grep "^\s*public\sfunction" $i`
  # echo $classItems
  # methods=`grep "^\s*public\sfunction" "$i" | sed -e "s/\s*public\s*function\s*\(.*)\).*/method,.\/\1/"`
  # | sed -e "s/\s*public\s*function\s*\(.*)\).*/method,.\/\1/"`
  # echo "$i" >> testCache.text
  # echo "$classCache" >> testCache.text
  # cache="$cache"$(echo $i)
  # $(echo "$classCache")

  # while read -r line; do
  #    sed -i "s:$i:$i\n$line:" $classCacheFile
  # done <<< "$classCache"
  # sed -e "s:$i:$i\n$methods:" $classCacheFile
  # echo "sed -e \"s:$i:$i\n$methods:\" $classCacheFile"
  # echo "/$i/a testTEST" 
  # echo "$methods"
  # sed '/"$i"/a "$methods"' $classCacheFile
  # echo "/$i/a $methods" $classCacheFile
  # cat $methods
  # for o in `cat $methods`; do
  #   echo "$o"
  # done
  # echo $methods 
  # echo 123456
  # for o in $methods; do
    # sed "/$i/a $o" $classCacheFile
    # echo $o
    # echo "sed \"/$i/a $o\" $classCacheFile"
  # done
done;
