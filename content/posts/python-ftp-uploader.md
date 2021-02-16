---
title: "Python Ftp Uploader"
date: 2019-10-07T20:38:15+02:00
draft: false
tags: ["Python"]
---

I have created this uploader first as a practice and secondly so I can use it to upload my website.
Basicly script at start checks if directory is hashed, if it's not directory will be hashed, hash file will be created with hash value in it.
Then script will proceed to upload selected directory content to target server.

If hash file exist at start script will rehash directory and compare its hash with hash from existing hash file.
If they match no file will be uploaded and if they don't content of directory will be uploaded and new hash value will be written in hash file.

Find whole project in this [repository](https://github.com/nenadfilipovic/python-ftp-uploader) on github.