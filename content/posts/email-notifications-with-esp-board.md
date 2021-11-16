---
title: 'Email Notifications With Esp Board'
date: 2019-10-07T20:32:40+02:00
draft: false
tags: ['Php']
---

I wanted to create simple notification script that will notify me when my board
detects new software version on github by email.

I have tried few smtp micropython libraries and they throw me errors all the
time so I opted for simpler solution to create my php script that will send
received data as notification to my email.

{{< highlight php >}}

<?php
$_POST = json_decode(file_get_contents('php://input'), true);
$link = $_POST['link'];
$name = $_POST['name'];
$version = $_POST['version'];
$to = 'put target email here';
$subject = "New version of $name is available for download.";
$message = "";
$headers = "From: notification@esp8266.home\r\n";
$headers .= "Reply-To: notification@esp8266.home\r\n";
$headers .= "X-Mailer: PHP/".phpversion();
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
?>

{{< /highlight >}}

My version of this script will send 3 types of data as email notification: name,
version and link. It can be of course changed and expanded. And at the end add
this code to execute request.

{{< highlight php >}}

<?php
mail($to, $subject, $message, $headers);
?>

{{< /highlight >}}

Notification provides name of software that have update available, version of
software and direct link to github repository where user can read latest
changes. This script is useful for any software deployment in which is needed to
notify users about new versions.

Find whole project in this
[repository](https://github.com/nenadfilipovic/esp8266-micropython-email-notification)
on github.
