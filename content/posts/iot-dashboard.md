---
title: "Iot Dashboard"
date: 2020-10-14T08:57:50Z
draft: false
tags: ["React", "NodeJS", "Docker", "Typescript", "Dashboard"]
---

I am currently working on project that should be a dashboard for IOT sensors. Is it based on microservices structure with services running on NodeJS with MySQL database, communicating between via RabbitMQ as orchestrator. Only log service should be different by using InfluxDB to store data received via MQTT broker : client flow.

I want to completely write it in Typescript and to try to develop services inside containers using VSCode remote plugins and it was very nice experience so far.

Find whole project in this [repository](https://github.com/nenadfilipovic/iot-dashboard) on github.