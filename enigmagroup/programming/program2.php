<?php
include("init.php");
$URL="http://www.enigmagroup.org/missions/programming/2/";

$CH = curl_init();
curl_setopt($CH, CURLOPT_URL, $URL);
curl_setopt($CH, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($CH, CURLOPT_HTTPHEADER, array($COOKIE));

$OUTPUT = curl_exec($CH);
$SUB=substr($OUTPUT, 543,580);
preg_match_all('/value="[0-9a-z]+"/',$SUB,$FIND,PREG_SET_ORDER);
preg_match_all('/random number [0-9]+/',$SUB,$FINDANSWER,PREG_SET_ORDER);

$ENUM=substr($FIND[0][0],7,-1);
$ETIME=substr($FIND[1][0],7,-1);
$HASH=substr($FIND[2][0],7,-1);
$SUBMITA="Submit Answer";
$ANS=substr($FIND[0][0],7,-1)*4;

$SUBMIT="$LOGIN&answer=$ANS&E[number]=$ENUM&E[time]=$ETIME&hash=$HASH&submit=$SUBMITA";
curl_setopt($CH, CURLOPT_POSTFIELDS, $SUBMIT);
$OUTPUT = curl_exec($CH);
curl_close($CH);

echo $OUTPUT;
echo "\nFin\n";
?>