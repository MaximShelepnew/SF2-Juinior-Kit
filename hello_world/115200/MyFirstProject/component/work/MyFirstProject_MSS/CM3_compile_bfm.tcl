# ===========================================================
# Created by Microsemi SmartDesign Fri Sep 08 12:39:15 2017
# 
# Warning: Do not modify this file, it may lead to unexpected 
#          simulation failures in your design.
#
# ===========================================================

if {$tcl_platform(os) == "Linux"} {
  exec "$env(ACTEL_SW_DIR)/bin/bfmtovec" -in test.bfm -out test.vec
} else {
  exec "$env(ACTEL_SW_DIR)/bin/bfmtovec.exe" -in test.bfm -out test.vec
}
