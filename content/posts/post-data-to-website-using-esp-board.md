---
title: 'Post Data to Website Using Esp Board'
date: 2019-10-07T20:29:44+02:00
draft: false
tags: ['Php', 'Micropython']
---

Having many of these boards and wanted to learn micropython, I have decided to
make little project and to use esp8266 board to send some data to my website
from where I can access it any time or place I want. They are very cheap and can
be bought for around $2 on Aliexpress.

Biggest problem I have encountered was when whatever I send to server php did't
show anything. I tought it is problem in my python code so I have changed it few
times, tried to use post and get dump websites to see how my post request looks
and all looked fine.

Then I installed Postman - tool that can simulate http requests, and it worked,
my `display_data.php` showed data in table.

That was strange, my server side was ok and my client puts out valid post
request. I wasted few hours until I found post on stackoverflow, where is very
well explained that php cant display JSON decoded data, guy on that site also
posted solution. Code looks like this.

{{< highlight php >}}

<?php
$_POST = json_decode(file_get_contents('php://input'), true);
?>

{{< /highlight >}}

Find whole project in this
[repository](https://github.com/nenadfilipovic/esp8266-micropython-web-data) on
github.
