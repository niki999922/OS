#!/bin/bash

war="\\(WW\\)"
inf="\\(II\\)"
grep -E -h -s $war "/var/log/Xorg.0.log" | sed -E "s/$war/Warning: /g" > full.log
grep -E -h -s $inf "/var/log/Xorg.0.log" | sed -E "s/$inf/Information: /g" >> full.log
nl full.log