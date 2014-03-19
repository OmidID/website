#!/bin/bash
<<comment
#extract files from xml
mkdir sites
mcs extract.cs -r:System.Xml.Linq
mono extract.exe
comment

function lang {
  sed -E -i -e 's/<python>/<div class=\"python\"><pre><code>/g' $1
  sed -E -i -e 's/<\/python>/<\/code><\/pre><\/div>/g' $1
  sed -E -i -e 's/<csharp>/<div class=\"csharp\"><pre><code>/g' $1
  sed -E -i -e 's/<\/csharp>/<\/code><\/pre><\/div>/g' $1
  sed -E -i -e 's/<xml>/<div class=\"xml\"><pre><code>/g' $1
  sed -E -i -e 's/<\/xml>/<\/code><\/pre><\/div>/g' $1
  sed -E -i -e 's/<c>/<div class=\"c\"><pre><code>/g' $1
  sed -E -i -e 's/<\/c>/<\/code><\/pre><\/div>/g' $1
  rm $1-e
}

# go to the recently created directory
cd sites/

#converting files to html or markdown format according to the regex
rm MediaWiki*
rm File*

SUCCESS=0
for filename in $( find . -name \* -type f )
do
  sed -E -i -e 's/\[\[Image\:/&http\:\/\/localhost\:4000\/files\//g' ${filename}
  rm ${filename}-e
  grep -l -e "<div>" -e "<br><br>" -e "\|\}" "$filename"

  if [ $? -eq $SUCCESS ]
    then
    lang ${filename}
    pandoc -f mediawiki -t html5 -s "$filename" -o "$filename".html 
    temp="${filename}.html"
    sed -E -i -e 's/[ #.:_A-Za-z]+\" title=\"wikilink\"/http\:\/\/localhost\:4000\/&/g' ${temp}
    rm ${temp}-e
  else
    lang ${filename}
    pandoc -f mediawiki -t markdown -s "$filename" -o "$filename".md
    temp="${filename}.md"
    sed -E -i -e 's/[ #.:_A-Za-z]+\"wikilink\"\)/\{\{site.url\}\}\/&/g' ${temp}
    sed -E -i -e 's/<code>/<pre>&/g' ${temp}
    sed -E -i -e 's/<\/code>/&<\/pre>/g' ${temp}
    rm ${temp}-e
  fi
done


#modify markdown files to jekyll purpose
for FILE in $( find . -type f \( -name "*.html" -or -name "*.md" \) )
do
  #set directory names to be the file name plus _io
  DIR="${FILE%.*}_io"
  NEWDIR="${DIR%_io}"
  #make those directories
  mkdir -p "$DIR"
  #change file name to be index.md
  IN="index.${FILE##*.}"
  mv "$FILE" "$IN"
  #add format for jekyll in each file
  if [[ $IN =~ \.md$ ]]
    then
    mdheader='---'
    newline='\n'
    title="Title: "
    layout="layout: default"
    Filetitle="$NEWDIR"
    header=$mdheader$newline$title$Filetitle$newline$layout$newline$mdheader$newline
    echo -e "$header" | cat - "$IN" > temp && mv temp "$IN"
  fi
  #move the file into the newly created directory
  mv "$IN" "$DIR"
  #remove the old file
  rm "$NEWDIR"
  #rename the directories w/o _io at the end
  mv "$DIR" "$NEWDIR"
done
#clear all .ds_store files
find . -name *.DS_Store -type f -exec rm {} \;