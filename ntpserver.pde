#include "config.h"
#include "hwdep.h"
#include "timing.h"
#include "gps.h"
#include "ethernet.h"
#include "tempprobe.h"

volatile extern char pps_int;
volatile extern char ether_int;
volatile extern char schedule_ints;

void setup () {
  pinMode(13, OUTPUT);
  for (int k = 0 ; k < 3 ; k++) {
    digitalWrite(13, HIGH);
    delay(250);
    digitalWrite(13, LOW);
    delay(250);
  }

  Serial.begin(115200);
  timer_init();
  gps_init();
  ether_init();
#ifdef TEMPCORR
  tempprobe_init();
#endif
}

void loop () {
  while (1) {
    if (pps_int) {
      pll_run();
    }
    if (ether_int) {
      ether_poll();
    }
    gps_poll();
    while (schedule_ints) {
#ifdef TEMPCORR
      tempprobe_run();
#endif
      ether_dhcp_poll();
      schedule_ints--;
    }
  }
}

// vim: ft=cpp
