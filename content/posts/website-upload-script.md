---
title: 'Website Upload Script'
date: 2019-10-07T20:42:09+02:00
draft: false
tags: ['Php']
---

Uploading website file by file using ftp programs can be very boring and
tedious. That's why I have tried to simplify that process.

I have found script called `Unzipper` that I am going to use for this project -
you can download it [here](https://github.com/ndeet/unzipper).

Plan is to zip or rar (if your hosting allows that) your website and use
unzipper script to extract it. Its all plain and simple, it was only needed to
modify few lines in unzipper code.

First line of code was added to remove archive after extraction, second to
remove actual unzipper script and third to redirect to website index page.
Redirection will save user from typing address again and it looks much better
this way.

{{< highlight php >}}

<?php
unlink($archive);
unlink(__FILE__);
header('Location: /');
?>

{{< /highlight >}}

Zip your website, upload archive and php script to root directory, access your
domain and your files should be listed, only thing needs to be done is execute
php script from browser and select extract archive. Rest is automated and you
will be presented with your website homepage.
