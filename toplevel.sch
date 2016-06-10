<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FORM(1:0)" />
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_9(11:0)" />
        <signal name="SPI_SCK" />
        <signal name="DAC_CS" />
        <signal name="SPI_MOSI" />
        <signal name="FREQ(16:0)" />
        <signal name="J18_IO4" />
        <signal name="J18_IO2" />
        <signal name="J18_IO3" />
        <signal name="J18_IO1" />
        <signal name="ROT_A" />
        <signal name="ROT_B" />
        <signal name="ROT_CENTER" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="LCD_busy" />
        <signal name="LCD_RS" />
        <signal name="LCD_E" />
        <signal name="XLXN_176" />
        <signal name="LCD_DB(7:0)" />
        <signal name="LCD_RW" />
        <signal name="XLXN_30" />
        <signal name="DAC_CLR" />
        <signal name="XLXN_179" />
        <signal name="XLXN_180(7:0)" />
        <signal name="XLXN_193(1:0)" />
        <signal name="FORM(1)" />
        <signal name="LED0" />
        <signal name="SW0" />
        <signal name="SW1" />
        <signal name="FORM(0)" />
        <signal name="BTN_EAST" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="Output" name="SPI_SCK" />
        <port polarity="Output" name="DAC_CS" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Output" name="J18_IO4" />
        <port polarity="Output" name="J18_IO2" />
        <port polarity="Output" name="J18_IO3" />
        <port polarity="Output" name="J18_IO1" />
        <port polarity="Input" name="ROT_A" />
        <port polarity="Input" name="ROT_B" />
        <port polarity="Input" name="ROT_CENTER" />
        <port polarity="Output" name="LCD_RS" />
        <port polarity="Output" name="LCD_E" />
        <port polarity="Output" name="LCD_DB(7:0)" />
        <port polarity="Output" name="LCD_RW" />
        <port polarity="Output" name="DAC_CLR" />
        <port polarity="Output" name="LED0" />
        <port polarity="Input" name="SW0" />
        <port polarity="Input" name="SW1" />
        <port polarity="Input" name="BTN_EAST" />
        <blockdef name="spi_driver">
            <timestamp>2016-5-20T8:33:2</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="dds">
            <timestamp>2016-5-20T8:58:58</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="controller">
            <timestamp>2016-6-10T7:49:11</timestamp>
            <rect width="416" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="544" y1="-480" y2="-480" x1="480" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <rect width="64" x="480" y="-364" height="24" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <rect width="64" x="480" y="-300" height="24" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
        </blockdef>
        <blockdef name="rotary_dec">
            <timestamp>2016-5-23T16:56:27</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="lcd_driver">
            <timestamp>2016-6-6T19:34:31</timestamp>
            <rect width="288" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
            <line x2="416" y1="-208" y2="-208" x1="352" />
            <line x2="416" y1="-128" y2="-128" x1="352" />
            <rect width="64" x="352" y="-60" height="24" />
            <line x2="416" y1="-48" y2="-48" x1="352" />
        </blockdef>
        <block symbolname="dds" name="XLXI_2">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="FREQ(16:0)" name="freq(16:0)" />
            <blockpin signalname="FORM(1:0)" name="form(1:0)" />
            <blockpin signalname="XLXN_9(11:0)" name="amp(11:0)" />
        </block>
        <block symbolname="spi_driver" name="XLXI_1">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="BTN_EAST" name="rst" />
            <blockpin signalname="XLXN_9(11:0)" name="val(11:0)" />
            <blockpin signalname="SPI_SCK" name="sck" />
            <blockpin signalname="DAC_CS" name="cs" />
            <blockpin signalname="SPI_MOSI" name="mosi" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="SPI_SCK" name="I" />
            <blockpin signalname="J18_IO4" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="DAC_CS" name="I" />
            <blockpin signalname="J18_IO2" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="SPI_MOSI" name="I" />
            <blockpin signalname="J18_IO3" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="CLK_50MHZ" name="I" />
            <blockpin signalname="J18_IO1" name="O" />
        </block>
        <block symbolname="rotary_dec" name="XLXI_43">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="ROT_A" name="A" />
            <blockpin signalname="ROT_B" name="B" />
            <blockpin signalname="XLXN_77" name="up_down" />
            <blockpin signalname="XLXN_78" name="ce" />
            <blockpin signalname="XLXN_79" name="error" />
        </block>
        <block symbolname="lcd_driver" name="XLXI_88">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="BTN_EAST" name="reset" />
            <blockpin signalname="XLXN_176" name="new_character" />
            <blockpin signalname="XLXN_179" name="new_pos" />
            <blockpin signalname="XLXN_180(7:0)" name="data(7:0)" />
            <blockpin signalname="LCD_busy" name="busy" />
            <blockpin signalname="LCD_E" name="lcd_en" />
            <blockpin signalname="LCD_RS" name="lcd_rs" />
            <blockpin signalname="LCD_DB(7:0)" name="lcd_db(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_51">
            <blockpin signalname="LCD_RW" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="XLXN_30" name="I" />
            <blockpin signalname="DAC_CLR" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_20">
            <blockpin signalname="XLXN_30" name="P" />
        </block>
        <block symbolname="controller" name="XLXI_89">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="BTN_EAST" name="rst" />
            <blockpin signalname="XLXN_79" name="enc_err" />
            <blockpin signalname="LCD_busy" name="lcd_busy" />
            <blockpin signalname="FORM(1:0)" name="form(1:0)" />
            <blockpin signalname="ROT_CENTER" name="enc_btn" />
            <blockpin signalname="XLXN_78" name="enc_ce" />
            <blockpin signalname="XLXN_77" name="enc_updown" />
            <blockpin signalname="XLXN_176" name="lcd_newchar" />
            <blockpin signalname="XLXN_179" name="lcd_newpos" />
            <blockpin signalname="XLXN_180(7:0)" name="lcd_data(7:0)" />
            <blockpin signalname="FREQ(16:0)" name="freq_out(16:0)" />
        </block>
        <block symbolname="buf" name="XLXI_25">
            <blockpin signalname="SW0" name="I" />
            <blockpin signalname="FORM(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_26">
            <blockpin signalname="SW1" name="I" />
            <blockpin signalname="FORM(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_27">
            <blockpin signalname="SW0" name="I" />
            <blockpin signalname="LED0" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2944" y="2192" name="XLXI_2" orien="R0">
        </instance>
        <instance x="3536" y="2048" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK_50MHZ">
            <wire x2="2944" y1="2032" y2="2032" x1="2912" />
        </branch>
        <branch name="XLXN_9(11:0)">
            <wire x2="3424" y1="2032" y2="2032" x1="3328" />
            <wire x2="3424" y1="2016" y2="2032" x1="3424" />
            <wire x2="3536" y1="2016" y2="2016" x1="3424" />
        </branch>
        <branch name="SPI_SCK">
            <wire x2="3952" y1="1888" y2="1888" x1="3920" />
            <wire x2="4080" y1="1888" y2="1888" x1="3952" />
            <wire x2="3952" y1="1808" y2="1888" x1="3952" />
            <wire x2="4080" y1="1808" y2="1808" x1="3952" />
        </branch>
        <branch name="DAC_CS">
            <wire x2="3952" y1="1952" y2="1952" x1="3920" />
            <wire x2="4080" y1="1952" y2="1952" x1="3952" />
            <wire x2="3952" y1="1920" y2="1952" x1="3952" />
            <wire x2="4304" y1="1920" y2="1920" x1="3952" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="3952" y1="2016" y2="2016" x1="3920" />
            <wire x2="4080" y1="2016" y2="2016" x1="3952" />
            <wire x2="3952" y1="1984" y2="2016" x1="3952" />
            <wire x2="4304" y1="1984" y2="1984" x1="3952" />
        </branch>
        <branch name="FREQ(16:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2763" y="2096" type="branch" />
            <wire x2="2592" y1="1536" y2="1536" x1="2336" />
            <wire x2="2592" y1="1536" y2="2096" x1="2592" />
            <wire x2="2944" y1="2096" y2="2096" x1="2592" />
        </branch>
        <instance x="4080" y="1840" name="XLXI_14" orien="R0" />
        <branch name="J18_IO4">
            <wire x2="4336" y1="1808" y2="1808" x1="4304" />
        </branch>
        <instance x="4304" y="1952" name="XLXI_15" orien="R0" />
        <instance x="4304" y="2016" name="XLXI_16" orien="R0" />
        <branch name="J18_IO2">
            <wire x2="4560" y1="1920" y2="1920" x1="4528" />
        </branch>
        <branch name="J18_IO3">
            <wire x2="4560" y1="1984" y2="1984" x1="4528" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="3520" y1="1632" y2="1632" x1="3472" />
            <wire x2="3520" y1="1632" y2="1888" x1="3520" />
            <wire x2="3536" y1="1888" y2="1888" x1="3520" />
            <wire x2="3632" y1="1632" y2="1632" x1="3520" />
        </branch>
        <instance x="3632" y="1664" name="XLXI_17" orien="R0" />
        <branch name="J18_IO1">
            <wire x2="3888" y1="1632" y2="1632" x1="3856" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="1792" y1="1344" y2="1344" x1="1776" />
        </branch>
        <branch name="ROT_A">
            <wire x2="1136" y1="1600" y2="1600" x1="1056" />
        </branch>
        <branch name="ROT_B">
            <wire x2="1136" y1="1664" y2="1664" x1="1056" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="1136" y1="1536" y2="1536" x1="1056" />
        </branch>
        <branch name="ROT_CENTER">
            <wire x2="1792" y1="1472" y2="1472" x1="1760" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="1792" y1="1536" y2="1536" x1="1520" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="1792" y1="1600" y2="1600" x1="1520" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="1792" y1="1664" y2="1664" x1="1520" />
        </branch>
        <instance x="1136" y="1696" name="XLXI_43" orien="R0">
        </instance>
        <branch name="LCD_busy">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1024" type="branch" />
            <wire x2="784" y1="1024" y2="1728" x1="784" />
            <wire x2="1792" y1="1728" y2="1728" x1="784" />
            <wire x2="1648" y1="1024" y2="1024" x1="784" />
            <wire x2="3184" y1="1024" y2="1024" x1="1648" />
            <wire x2="3184" y1="1024" y2="1168" x1="3184" />
            <wire x2="3184" y1="1168" y2="1168" x1="3152" />
        </branch>
        <branch name="LCD_RS">
            <wire x2="3232" y1="1328" y2="1328" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="2912" y="2032" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="4080" y="1888" name="SPI_SCK" orien="R0" />
        <iomarker fontsize="28" x="4080" y="1952" name="DAC_CS" orien="R0" />
        <iomarker fontsize="28" x="4080" y="2016" name="SPI_MOSI" orien="R0" />
        <iomarker fontsize="28" x="4560" y="1920" name="J18_IO2" orien="R0" />
        <iomarker fontsize="28" x="4560" y="1984" name="J18_IO3" orien="R0" />
        <iomarker fontsize="28" x="3888" y="1632" name="J18_IO1" orien="R0" />
        <iomarker fontsize="28" x="4336" y="1808" name="J18_IO4" orien="R0" />
        <iomarker fontsize="28" x="3472" y="1632" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1600" name="ROT_A" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1664" name="ROT_B" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1536" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="1760" y="1472" name="ROT_CENTER" orien="R180" />
        <instance x="2736" y="1456" name="XLXI_88" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2656" y="1168" name="CLK_50MHZ" orien="R180" />
        <branch name="CLK_50MHZ">
            <wire x2="2736" y1="1168" y2="1168" x1="2656" />
        </branch>
        <branch name="XLXN_176">
            <wire x2="2480" y1="1344" y2="1344" x1="2336" />
            <wire x2="2480" y1="1296" y2="1344" x1="2480" />
            <wire x2="2736" y1="1296" y2="1296" x1="2480" />
        </branch>
        <branch name="LCD_DB(7:0)">
            <wire x2="3232" y1="1408" y2="1408" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3232" y="1248" name="LCD_E" orien="R0" />
        <branch name="LCD_E">
            <wire x2="3232" y1="1248" y2="1248" x1="3152" />
        </branch>
        <iomarker fontsize="28" x="3232" y="1328" name="LCD_RS" orien="R0" />
        <iomarker fontsize="28" x="3232" y="1408" name="LCD_DB(7:0)" orien="R0" />
        <instance x="4144" y="1264" name="XLXI_51" orien="R0" />
        <branch name="LCD_RW">
            <wire x2="4240" y1="1072" y2="1072" x1="4208" />
            <wire x2="4208" y1="1072" y2="1136" x1="4208" />
        </branch>
        <iomarker fontsize="28" x="4240" y="1072" name="LCD_RW" orien="R0" />
        <instance x="3952" y="2224" name="XLXI_19" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="3952" y1="2192" y2="2192" x1="3920" />
        </branch>
        <branch name="DAC_CLR">
            <wire x2="4208" y1="2192" y2="2192" x1="4176" />
        </branch>
        <instance x="3856" y="2192" name="XLXI_20" orien="R0" />
        <iomarker fontsize="28" x="4208" y="2192" name="DAC_CLR" orien="R0" />
        <branch name="XLXN_179">
            <wire x2="2480" y1="1408" y2="1408" x1="2336" />
            <wire x2="2480" y1="1360" y2="1408" x1="2480" />
            <wire x2="2736" y1="1360" y2="1360" x1="2480" />
        </branch>
        <branch name="XLXN_180(7:0)">
            <wire x2="2480" y1="1472" y2="1472" x1="2336" />
            <wire x2="2480" y1="1424" y2="1472" x1="2480" />
            <wire x2="2736" y1="1424" y2="1424" x1="2480" />
        </branch>
        <instance x="1792" y="1824" name="XLXI_89" orien="R0">
        </instance>
        <bustap x2="1472" y1="2064" y2="2064" x1="1568" />
        <bustap x2="1472" y1="2000" y2="2000" x1="1568" />
        <instance x="1040" y="2032" name="XLXI_25" orien="R0" />
        <instance x="1040" y="2096" name="XLXI_26" orien="R0" />
        <instance x="1040" y="2176" name="XLXI_27" orien="R0" />
        <branch name="FORM(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="2064" type="branch" />
            <wire x2="1376" y1="2064" y2="2064" x1="1264" />
            <wire x2="1472" y1="2064" y2="2064" x1="1376" />
        </branch>
        <branch name="LED0">
            <wire x2="1312" y1="2144" y2="2144" x1="1264" />
        </branch>
        <branch name="SW0">
            <wire x2="1008" y1="2000" y2="2000" x1="944" />
            <wire x2="1008" y1="2000" y2="2144" x1="1008" />
            <wire x2="1040" y1="2144" y2="2144" x1="1008" />
            <wire x2="1040" y1="2000" y2="2000" x1="1008" />
        </branch>
        <branch name="SW1">
            <wire x2="1040" y1="2064" y2="2064" x1="944" />
        </branch>
        <branch name="FORM(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="2000" type="branch" />
            <wire x2="1376" y1="2000" y2="2000" x1="1264" />
            <wire x2="1472" y1="2000" y2="2000" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1312" y="2144" name="LED0" orien="R0" />
        <iomarker fontsize="28" x="944" y="2064" name="SW1" orien="R180" />
        <iomarker fontsize="28" x="944" y="2000" name="SW0" orien="R180" />
        <branch name="FORM(1:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1568" y="1792" type="branch" />
            <wire x2="1792" y1="1792" y2="1792" x1="1568" />
            <wire x2="1568" y1="1792" y2="2160" x1="1568" />
            <wire x2="2944" y1="2160" y2="2160" x1="1568" />
        </branch>
        <branch name="BTN_EAST">
            <wire x2="1792" y1="1408" y2="1408" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1408" name="BTN_EAST" orien="R180" />
        <iomarker fontsize="28" x="1776" y="1344" name="CLK_50MHZ" orien="R180" />
        <branch name="BTN_EAST">
            <wire x2="2736" y1="1232" y2="1232" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2704" y="1232" name="BTN_EAST" orien="R180" />
        <branch name="BTN_EAST">
            <wire x2="3536" y1="1952" y2="1952" x1="3504" />
        </branch>
        <iomarker fontsize="28" x="3504" y="1952" name="BTN_EAST" orien="R180" />
    </sheet>
</drawing>