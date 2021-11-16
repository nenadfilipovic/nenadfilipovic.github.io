---
title: 'Php Based Rest Api'
date: 2019-10-07T20:34:09+02:00
draft: false
tags: ['Php']
---

For almost every communication esp is doing to the web api is needed, so I
tought why don't I build one. I familiarized myself with with what are crucial
options api needs to do to be called rest and I think this one does all of that.

I have found a lot info online how to start, how to handle main methods as post,
get, put, delete and how every method controls their functions. Easiest way to
test this api is with Postman.

This is servers response to get request, server returns all data in JSON format.

{{< highlight json >}} { "id": "3", "item_sku": "11", "item_name": "Item",
"item_price": "100", "item_quantity": "5" } {{< /highlight >}}

This one is with post request, message after item is successfully and
unsuccessfully created.

{{< highlight json >}} { "status": 201, "status_message": "Item Created
Successfully." , "status": 400, "status_message": "Item Creation Failed." }
{{< /highlight >}}

Find whole project in this
[repository](https://github.com/nenadfilipovic/php-rest-api) on github.
