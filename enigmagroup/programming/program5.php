<?php
include("init.php");

/* ===Steps===
 get compiler from https://github.com/fabianm/brainfuck
 parse html, compile, return */

$url = "http://www.enigmagroup.org/missions/programming/5/";
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, array($COOKIE));
$output = curl_exec($ch);

curl_close($ch);
echo "\nFin\n";
?>