#!/bin/bash

java -Dlogback.configurationFile=/otp/logback.xml -Xmx7G -jar otp-0.20.1-ROUTERCONFIG.jar --server --insecure

