searchDirs="./src/"
searchFilesRegex="-regex \".*\.php\""
excludeFiles="| grep -v \"\/Resources\/\""
# classGrep="| xargs grep \"^\s*class\""
# formattingSed="| sed -e \"s/\(.*\):.*class\s*\(\S*\).*/block,.\/\nfile,.\/\1\nclass,.\/\2\nendBlock,.\/\n/\""
formattingSed="| sed -e \"s/\(.*\)/block,.\/\nfile,.\/\1\nendBlock,.\/\n/\""
classCacheFile="./.michaelSoft/mrCompleter/classCache.mr"
classGrep="sed"

# php regexs'
phpMethodRegex="^\s*public\sfunction\s*\(.*)\).*"
phpMethodFormatRegex="s/^\s*public\sfunction\s*\(.*)\).*/method,.\/\1/"
phpVarRegex="^\s*public\s\$"
phpVarFormatRegex="s/^\s*public\s\$/var,.\//"
phpConstRegex="^\s*const"
phpConstFormatRegex="s/^\s*const\s*\(\S*\).*/const,.\/\1/"
phpClassRegex="^\s*class"
phpClassFormatRegex="s/^\s*class\s*\(\S*\).*/class,.\/\1/"

# class formatting regexs
phpClassFormatArr=($phpMethodFormatRegex $phpVarFormatRegex $phpConstFormatRegex $phpClassFormatRegex)

# class info search parameters
phpClassCacheRegex="\($phpMethodRegex\|$phpVarRegex\|$phpConstRegex\|$phpClassRegex\)"


cacheDir=`echo $classCacheFile | sed -e "s/classCache.mr//"`
mkdir "$cacheDir" -p

# get php files
echo "start,./" > $cacheDir"/classCache.mr"
eval "find $searchDirs $searchFilesRegex $excludeFiles $formattingSed > $classCacheFile"

for i in `sed -n '/block/{:a;N;/endBlock/!ba; /file/p}' $classCacheFile | sed -n '/file,.\//p' | sed -e 's/file,.\///'` 
do
  # get class info
  classCache=`grep "\($phpClassCacheRegex\)" "$i"`

  # read class info into array
  classCacheArr=()
  while read -r line; do
    classCacheArr+=("$line")
  done <<< "$classCache"

  # insert class info lines into cache file
  for o in "${classCacheArr[@]}"
  do
    sed -i "s#$i#$i\n$o#" $classCacheFile
  done

done;

# format cache file
for p in "${phpClassFormatArr[@]}"; do
  sed -i "$p" $classCacheFile
done

