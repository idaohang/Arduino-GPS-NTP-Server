#undef TEMPCORR
#undef SAWTOOTH_COMP
#define LCD
#undef DHCP

#ifndef SAWTOOTH_COMP
#define PLL_FUDGE_NS 723
#else
#define PLL_FUDGE_NS 80
#endif

#define PLL_OFFSET_NTP 0x4000000
#define NTP_FUDGE_RX_US (-50)
#define NTP_FUDGE_TX_US 950

#define PLL_SLEW_DIV 256L
#define PLL_SLEW_MAX 32768L
#define PLL_SLEW_SLOW_ZONE 0
