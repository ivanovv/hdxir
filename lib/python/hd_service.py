#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import json
from handsetdetection.HD4 import HandsetDetection

hd = HandsetDetection()

def detect(ua):
    result = hd.deviceDetect({'User-Agent': ua}, {})
    return json.dumps(result)
