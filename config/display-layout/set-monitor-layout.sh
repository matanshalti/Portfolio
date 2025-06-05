#!/bin/bash
# Disable internal laptop display
kscreen-doctor output.eDP-1.disable
# Enable TV (right side), set as primary
kscreen-doctor output.DP-1.enable
kscreen-doctor output.DP-1.primary
kscreen-doctor output.DP-1.scale.1.25
kscreen-doctor output.DP-1.mode.3840x2160@60
kscreen-doctor output.DP-1.position.1920,0
# Enable Samsung monitor (left), aligned to bottom of TV
kscreen-doctor output.HDMI-A-1.enable
kscreen-doctor output.HDMI-A-1.scale.1
kscreen-doctor output.HDMI-A-1.mode.1920x1080@60
kscreen-doctor output.HDMI-A-1.position.0,465
