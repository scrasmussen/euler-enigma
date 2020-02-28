<?php
include("init.php");
$BASE="http://www.enigmagroup.org/missions/programming/4";
$URL="$BASE/image.php";
$referer="$BASE/index.php";
$IMG='tmp.png';
$FP = fopen($IMG, 'wb');

$CH = curl_init();
curl_setopt($CH, CURLOPT_URL, $URL);
curl_setopt($CH, CURLOPT_HTTPHEADER, array($COOKIE));
curl_setopt($CH, CURLOPT_FILE, $FP);
$OUTPUT = curl_exec($CH);

$size = getimagesize($IMG);
$im = imagecreatefrompng($IMG);
$col="";
for ($y=15; $y<$size[1]; $y++) 
  for ($x=0; $x<$size[0]; $x++) {
    $col .= imagecolorat($im, $x, $y);
  }

$res="";
for ($i=0; $i<strlen($col); $i+=8) {
  $res .= chr(bindec(substr($col,$i,8)));
}

$SUBMIT="answer=$res&submit=1&$LOGIN"; 
echo "$SUBMIT\n";
curl_setopt($CH, CURLOPT_FILE, STDOUT);
curl_setopt($CH, CURLOPT_POSTFIELDS, $SUBMIT);
curl_setopt($CH, CURLOPT_REFERER, $referer);
$OUTPUT = curl_exec($CH);
curl_close($CH);
echo $OUTPUT;
echo "\nFin\n";
?>