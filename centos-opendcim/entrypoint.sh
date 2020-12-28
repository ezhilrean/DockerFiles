#!/bin/bash
/bin/run-parts entrypoint.d

/usr/sbin/httpd -D FOREGROUND 
