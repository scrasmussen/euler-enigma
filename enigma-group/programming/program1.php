<?php
include("init.php");
$URL="http://www.enigmagroup.org/missions/programming/1/";

$COOKIE .= ";mission=yes";

$CH = curl_init();
curl_setopt($CH, CURLOPT_URL, $URL);
curl_setopt($CH, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($CH, CURLOPT_HTTPHEADER, array($COOKIE));
$SUBMIT="$LOGIN";
curl_setopt($CH, CURLOPT_POSTFIELDS, $SUBMIT);
$OUTPUT = curl_exec($CH);
curl_close($CH);

echo $OUTPUT;
echo "\nFin\n";
?>