
## Clock signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sw_IBUF[0]]

##Switches
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { sw[0]  }]
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { sw[1]  }]
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { sw[2]  }]
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { sw[3]  }]
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { sw[4]  }]
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { sw[5]  }]
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { sw[6]  }]
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports { sw[7]  }]
set_property -dict { PACKAGE_PIN T8  IOSTANDARD LVCMOS18 } [get_ports { sw[8]  }]
set_property -dict { PACKAGE_PIN U8  IOSTANDARD LVCMOS18 } [get_ports { sw[9]  }]
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { sw[10] }]
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports { sw[11] }]
set_property -dict { PACKAGE_PIN H6  IOSTANDARD LVCMOS33 } [get_ports { sw[12] }]
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { sw[13] }]
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports { sw[14] }]
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { sw[15] }]


## LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { led[0]  }]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { led[1]  }]
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { led[2]  }]
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { led[3]  }]
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { led[4]  }]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { led[5]  }]
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { led[6]  }]
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { led[7]  }]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { led[8]  }]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { led[9]  }]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { led[10] }]
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { led[11] }]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { led[12] }]
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports { led[13] }]
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports { led[14] }]
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { led[15] }]

set_property -dict { PACKAGE_PIN R12 IOSTANDARD LVCMOS33 } [get_ports { led16b }]
set_property -dict { PACKAGE_PIN M16 IOSTANDARD LVCMOS33 } [get_ports { led16g }]
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports { led16r }]
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { led17b }]
set_property -dict { PACKAGE_PIN R11 IOSTANDARD LVCMOS33 } [get_ports { led17g }]
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { led17r }]


##7 segment display
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]

set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports { an[0] }]
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports { an[1] }]
set_property -dict { PACKAGE_PIN T9  IOSTANDARD LVCMOS33 } [get_ports { an[2] }]
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports { an[3] }]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { an[4] }]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { an[5] }]
set_property -dict { PACKAGE_PIN K2  IOSTANDARD LVCMOS33 } [get_ports { an[6] }]
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports { an[7] }]


##Buttons
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports { cpu_reset  }]
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { btn_center }]
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { btn_up     }]
set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { btn_left   }]
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { btn_right  }]
set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { btn_down   }]


##Pmod Header JA
#set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports { JA[1]  }]
#set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { JA[2]  }]
#set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { JA[3]  }]
#set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { JA[4]  }]
#set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports { JA[7]  }]
#set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports { JA[8]  }]
#set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports { JA[9]  }]
#set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports { JA[10] }]


##Pmod Header JB
#set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports { JB[1]  }]
#set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { JB[2]  }]
#set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 } [get_ports { JB[3]  }]
#set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports { JB[4]  }]
#set_property -dict { PACKAGE_PIN E16 IOSTANDARD LVCMOS33 } [get_ports { JB[7]  }]
#set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports { JB[8]  }]
#set_property -dict { PACKAGE_PIN G13 IOSTANDARD LVCMOS33 } [get_ports { JB[9]  }]
#set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { JB[10] }]


##Pmod Header JC
#set_property -dict { PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports { JC[1]  }]
#set_property -dict { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports { JC[2]  }]
#set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports { JC[3]  }]
#set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS33 } [get_ports { JC[4]  }]
#set_property -dict { PACKAGE_PIN E7 IOSTANDARD LVCMOS33 } [get_ports { JC[7]  }]
#set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports { JC[8]  }]
#set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports { JC[9]  }]
#set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS33 } [get_ports { JC[10] }]


##Pmod Header JD
#set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { JD[1]  }]
#set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports { JD[2]  }]
#set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports { JD[3]  }]
#set_property -dict { PACKAGE_PIN G3 IOSTANDARD LVCMOS33 } [get_ports { JD[4]  }]
#set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports { JD[7]  }]
#set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports { JD[8]  }]
#set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports { JD[9]  }]
#set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS33 } [get_ports { JD[10] }]


##Pmod Header JXADC
#set_property -dict { PACKAGE_PIN A14 IOSTANDARD LVDS } [get_ports { XA_N[1] }]
#set_property -dict { PACKAGE_PIN A13 IOSTANDARD LVDS } [get_ports { XA_P[1] }]
#set_property -dict { PACKAGE_PIN A16 IOSTANDARD LVDS } [get_ports { XA_N[2] }]
#set_property -dict { PACKAGE_PIN A15 IOSTANDARD LVDS } [get_ports { XA_P[2] }]
#set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVDS } [get_ports { XA_N[3] }]
#set_property -dict { PACKAGE_PIN B16 IOSTANDARD LVDS } [get_ports { XA_P[3] }]
#set_property -dict { PACKAGE_PIN A18 IOSTANDARD LVDS } [get_ports { XA_N[4] }]
#set_property -dict { PACKAGE_PIN B18 IOSTANDARD LVDS } [get_ports { XA_P[4] }]


#VGA Connector
set_property -dict { PACKAGE_PIN A3  IOSTANDARD LVCMOS33 } [get_ports { vga_r[0] }]
set_property -dict { PACKAGE_PIN B4  IOSTANDARD LVCMOS33 } [get_ports { vga_r[1] }]
set_property -dict { PACKAGE_PIN C5  IOSTANDARD LVCMOS33 } [get_ports { vga_r[2] }]
set_property -dict { PACKAGE_PIN A4  IOSTANDARD LVCMOS33 } [get_ports { vga_r[3] }]
set_property -dict { PACKAGE_PIN C6  IOSTANDARD LVCMOS33 } [get_ports { vga_g[0] }]
set_property -dict { PACKAGE_PIN A5  IOSTANDARD LVCMOS33 } [get_ports { vga_g[1] }]
set_property -dict { PACKAGE_PIN B6  IOSTANDARD LVCMOS33 } [get_ports { vga_g[2] }]
set_property -dict { PACKAGE_PIN A6  IOSTANDARD LVCMOS33 } [get_ports { vga_g[3] }]
set_property -dict { PACKAGE_PIN B7  IOSTANDARD LVCMOS33 } [get_ports { vga_b[0] }]
set_property -dict { PACKAGE_PIN C7  IOSTANDARD LVCMOS33 } [get_ports { vga_b[1] }]
set_property -dict { PACKAGE_PIN D7  IOSTANDARD LVCMOS33 } [get_ports { vga_b[2] }]
set_property -dict { PACKAGE_PIN D8  IOSTANDARD LVCMOS33 } [get_ports { vga_b[3] }]
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports { vga_hs   }]
set_property -dict { PACKAGE_PIN B12 IOSTANDARD LVCMOS33 } [get_ports { vga_vs   }]


##Micro SD Connector
#set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }]; #IO_L14P_T2_SRCC_35 Sch=sd_reset
#set_property -dict { PACKAGE_PIN A1 IOSTANDARD LVCMOS33 } [get_ports { SD_CD }]; #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
#set_property -dict { PACKAGE_PIN B1 IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }]; #IO_L9P_T1_DQS_AD7P_35 Sch=sd_sck
#set_property -dict { PACKAGE_PIN C1 IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }]; #IO_L16N_T2_35 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; #IO_L16P_T2_35 Sch=sd_dat[0]
#set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; #IO_L18N_T2_35 Sch=sd_dat[1]
#set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; #IO_L18P_T2_35 Sch=sd_dat[2]
#set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; #IO_L14N_T2_SRCC_35 Sch=sd_dat[3]


##Accelerometer
#set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]
#set_property -dict { PACKAGE_PIN F14 IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]
#set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]
#set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN  }]
#set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]
#set_property -dict { PACKAGE_PIN C16 IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]


##Temperature Sensor
#set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }]
#set_property -dict { PACKAGE_PIN C15 IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }]
#set_property -dict { PACKAGE_PIN D13 IOSTANDARD LVCMOS33 } [get_ports { TMP_INT }]
#set_property -dict { PACKAGE_PIN B14 IOSTANDARD LVCMOS33 } [get_ports { TMP_CT  }]

##Omnidirectional Microphone
#set_property -dict { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports { M_CLK   }]
#set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { M_DATA  }]
#set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS33 } [get_ports { M_LRSEL }]


##PWM Audio Amplifier
#set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]; #IO_L4N_T0_15 Sch=aud_pwm
#set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]; #IO_L6P_T0_15 Sch=aud_sd


##USB-RS232 Interface
#set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN  }]
#set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]
#set_property -dict { PACKAGE_PIN D3 IOSTANDARD LVCMOS33 } [get_ports { UART_CTS     }]
#set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS33 } [get_ports { UART_RTS     }]

##USB HID (PS/2)
#set_property -dict { PACKAGE_PIN F4 IOSTANDARD LVCMOS33 } [get_ports { PS2_CLK  }]
#set_property -dict { PACKAGE_PIN B2 IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA }]


##SMSC Ethernet PHY
#set_property -dict { PACKAGE_PIN C9  IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC    }]
#set_property -dict { PACKAGE_PIN A9  IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO   }]
#set_property -dict { PACKAGE_PIN B3  IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN   }]
#set_property -dict { PACKAGE_PIN D9  IOSTANDARD LVCMOS33 } [get_ports { ETH_CRSDV  }]
#set_property -dict { PACKAGE_PIN C10 IOSTANDARD LVCMOS33 } [get_ports { ETH_RXERR  }]
#set_property -dict { PACKAGE_PIN C11 IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }]
#set_property -dict { PACKAGE_PIN D10 IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }]
#set_property -dict { PACKAGE_PIN B9  IOSTANDARD LVCMOS33 } [get_ports { ETH_TXEN   }]
#set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }]
#set_property -dict { PACKAGE_PIN A8  IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }]
#set_property -dict { PACKAGE_PIN D5  IOSTANDARD LVCMOS33 } [get_ports { ETH_REFCLK }]
#set_property -dict { PACKAGE_PIN B8  IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN   }]


##Quad SPI Flash
#set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]
#set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]
#set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]
#set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]
#set_property -dict { PACKAGE_PIN L13 IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN   }]














