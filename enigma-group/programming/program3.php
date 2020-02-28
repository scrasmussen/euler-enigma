<?php
include("init.php");

$URL="http://www.enigmagroup.org/missions/programming/3/image.php";
$IMG='tmp.jpg';
$FP = fopen($IMG, 'wb');

$CH = curl_init();
curl_setopt($CH, CURLOPT_URL, $URL);
curl_setopt($CH, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($CH, CURLOPT_HTTPHEADER, array($COOKIE));
curl_setopt($CH, CURLOPT_FILE, $FP);
$OUTPUT = curl_exec($CH);
fclose($FP);
curl_close($CH);

$IM = imagecreatefromjpeg($IMG);
$rgb = imagecolorat($IM, 4, 4);
$r = ($rgb >> 16) & 0xFF;$g = ($rgb >> 8) & 0xFF;$b = $rgb & 0xFF;
var_dump($r, $g, $b);

$SUBMIT="color=$r;$g;$b&submit=1&$LOGIN"; 

$CH = curl_init();
curl_setopt($CH, CURLOPT_URL, $URL);
curl_setopt($CH, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($CH, CURLOPT_HTTPHEADER, array($COOKIE));
curl_setopt($CH, CURLOPT_POSTFIELDS, $SUBMIT);
curl_setopt($CH, CURLOPT_REFERER, $URL);
$OUTPUT = curl_exec($CH);
curl_close($CH);
echo $OUTPUT;
echo "\nFin\n";
?>