#!/usr/bin/env bash
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main_bar 2>&1 | tee -a /tmp/polybar1.log & disown
polybar aux_bar 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
