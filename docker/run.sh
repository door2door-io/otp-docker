#!/bin/bash

java -Dlogback.configurationFile=/opentripplanner/logback.xml -Xmx14G -jar otp-1.0.0-SNAPSHOT.jar --server --insecure --graphs /opentripplanner/graphs --autoScan --autoReload