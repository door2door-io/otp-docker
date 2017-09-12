#!/bin/bash

java -Dlogback.configurationFile=/opentripplanner/logback.xml -Xmx3G -jar otp-1.3.0-SNAPSHOT.jar --server --insecure --graphs /opentripplanner/graphs --autoScan --autoReload
