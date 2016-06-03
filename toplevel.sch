<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FORM(1:0)" />
        <signal name="FORM(0)" />
        <signal name="FORM(1)" />
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_9(11:0)" />
        <signal name="XLXN_10" />
        <signal name="SPI_SCK" />
        <signal name="DAC_CS" />
        <signal name="SPI_MOSI" />
        <signal name="FREQ(16:0)" />
        <signal name="J18_IO4" />
        <signal name="J18_IO2" />
        <signal name="J18_IO3" />
        <signal name="J18_IO1" />
        <signal name="XLXN_30" />
        <signal name="DAC_CLR" />
        <signal name="LED0" />
        <signal name="SW0" />
        <signal name="SW1" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_68" />
        <signal name="ROT_A" />
        <signal name="ROT_B" />
        <signal name="ROT_CENTER" />
        <signal name="XLXN_70" />
        <signal name="LCD_E" />
        <signal name="LCD_RW" />
        <signal name="LCD_RS" />
        <signal name="LCD_DB(7:0)" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="Output" name="SPI_SCK" />
        <port polarity="Output" name="DAC_CS" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Output" name="J18_IO4" />
        <port polarity="Output" name="J18_IO2" />
        <port polarity="Output" name="J18_IO3" />
        <port polarity="Output" name="J18_IO1" />
        <port polarity="Output" name="DAC_CLR" />
        <port polarity="Output" name="LED0" />
        <port polarity="Input" name="SW0" />
        <port polarity="Input" name="SW1" />
        <port polarity="Input" name="ROT_A" />
        <port polarity="Input" name="ROT_B" />
        <port polarity="Input" name="ROT_CENTER" />
        <port polarity="Output" name="LCD_E" />
        <port polarity="Output" name="LCD_RW" />
        <port polarity="Output" name="LCD_RS" />
        <port polarity="Output" name="LCD_DB(7:0)" />
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
            <timestamp>2016-6-3T12:59:50</timestamp>
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-364" height="24" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
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
            <timestamp>2016-6-3T14:29:29</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-256" y2="-256" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-76" height="24" />
            <line x2="432" y1="-64" y2="-64" x1="368" />
        </blockdef>
        <block symbolname="dds" name="XLXI_2">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="FREQ(16:0)" name="freq(16:0)" />
            <blockpin signalname="FORM(1:0)" name="form(1:0)" />
            <blockpin signalname="XLXN_9(11:0)" name="amp(11:0)" />
        </block>
        <block symbolname="spi_driver" name="XLXI_1">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_10" name="rst" />
            <blockpin signalname="XLXN_9(11:0)" name="val(11:0)" />
            <blockpin signalname="SPI_SCK" name="sck" />
            <blockpin signalname="DAC_CS" name="cs" />
            <blockpin signalname="SPI_MOSI" name="mosi" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_10" name="G" />
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
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="XLXN_30" name="I" />
            <blockpin signalname="DAC_CLR" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_20">
            <blockpin signalname="XLXN_30" name="P" />
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
        <block symbolname="controller" name="XLXI_42">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_68" name="rst" />
            <blockpin signalname="XLXN_63" name="enc_err" />
            <blockpin signalname="FREQ(16:0)" name="freq_out(16:0)" />
            <blockpin signalname="ROT_CENTER" name="enc_btn" />
            <blockpin signalname="XLXN_64" name="enc_ce" />
            <blockpin signalname="XLXN_65" name="enc_updown" />
        </block>
        <block symbolname="rotary_dec" name="XLXI_43">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="ROT_A" name="A" />
            <blockpin signalname="ROT_B" name="B" />
            <blockpin signalname="XLXN_65" name="up_down" />
            <blockpin signalname="XLXN_64" name="ce" />
            <blockpin signalname="XLXN_63" name="error" />
        </block>
        <block symbolname="gnd" name="XLXI_44">
            <blockpin signalname="XLXN_68" name="G" />
        </block>
        <block symbolname="lcd_driver" name="XLXI_45">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_70" name="reset" />
            <blockpin name="new_character" />
            <blockpin name="new_pos" />
            <blockpin name="auto_incr_cursor" />
            <blockpin name="data(7:0)" />
            <blockpin signalname="LCD_E" name="lcd_en" />
            <blockpin signalname="LCD_RW" name="lcd_rw" />
            <blockpin signalname="LCD_RS" name="lcd_rs" />
            <blockpin signalname="LCD_DB(7:0)" name="lcd_db(7:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_46">
            <blockpin signalname="XLXN_70" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="2256" y="1520" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2848" y="1376" name="XLXI_1" orien="R0">
        </instance>
        <branch name="FORM(1:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2128" y="1488" type="branch" />
            <wire x2="2128" y1="1488" y2="1504" x1="2128" />
            <wire x2="2128" y1="1504" y2="1536" x1="2128" />
            <wire x2="2256" y1="1488" y2="1488" x1="2128" />
        </branch>
        <bustap x2="2032" y1="1504" y2="1504" x1="2128" />
        <bustap x2="2032" y1="1536" y2="1536" x1="2128" />
        <branch name="FORM(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="1504" type="branch" />
            <wire x2="1936" y1="1504" y2="1504" x1="1824" />
            <wire x2="2032" y1="1504" y2="1504" x1="1936" />
        </branch>
        <branch name="FORM(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1936" y="1568" type="branch" />
            <wire x2="1936" y1="1568" y2="1568" x1="1824" />
            <wire x2="2032" y1="1568" y2="1568" x1="1936" />
            <wire x2="2032" y1="1536" y2="1568" x1="2032" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="2256" y1="1360" y2="1360" x1="2224" />
        </branch>
        <branch name="XLXN_9(11:0)">
            <wire x2="2736" y1="1360" y2="1360" x1="2640" />
            <wire x2="2736" y1="1344" y2="1360" x1="2736" />
            <wire x2="2848" y1="1344" y2="1344" x1="2736" />
        </branch>
        <instance x="2576" y="1264" name="XLXI_7" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="2640" y1="1072" y2="1136" x1="2640" />
            <wire x2="2720" y1="1072" y2="1072" x1="2640" />
            <wire x2="2720" y1="1072" y2="1280" x1="2720" />
            <wire x2="2848" y1="1280" y2="1280" x1="2720" />
        </branch>
        <branch name="SPI_SCK">
            <wire x2="3264" y1="1216" y2="1216" x1="3232" />
            <wire x2="3392" y1="1216" y2="1216" x1="3264" />
            <wire x2="3264" y1="1136" y2="1216" x1="3264" />
            <wire x2="3392" y1="1136" y2="1136" x1="3264" />
        </branch>
        <branch name="DAC_CS">
            <wire x2="3264" y1="1280" y2="1280" x1="3232" />
            <wire x2="3392" y1="1280" y2="1280" x1="3264" />
            <wire x2="3264" y1="1248" y2="1280" x1="3264" />
            <wire x2="3616" y1="1248" y2="1248" x1="3264" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="3264" y1="1344" y2="1344" x1="3232" />
            <wire x2="3392" y1="1344" y2="1344" x1="3264" />
            <wire x2="3264" y1="1312" y2="1344" x1="3264" />
            <wire x2="3616" y1="1312" y2="1312" x1="3264" />
        </branch>
        <branch name="FREQ(16:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2075" y="1424" type="branch" />
            <wire x2="1904" y1="1088" y2="1088" x1="1664" />
            <wire x2="1904" y1="1088" y2="1424" x1="1904" />
            <wire x2="2256" y1="1424" y2="1424" x1="1904" />
        </branch>
        <instance x="3392" y="1168" name="XLXI_14" orien="R0" />
        <branch name="J18_IO4">
            <wire x2="3648" y1="1136" y2="1136" x1="3616" />
        </branch>
        <instance x="3616" y="1280" name="XLXI_15" orien="R0" />
        <instance x="3616" y="1344" name="XLXI_16" orien="R0" />
        <branch name="J18_IO2">
            <wire x2="3872" y1="1248" y2="1248" x1="3840" />
        </branch>
        <branch name="J18_IO3">
            <wire x2="3872" y1="1312" y2="1312" x1="3840" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="2832" y1="960" y2="960" x1="2784" />
            <wire x2="2832" y1="960" y2="1216" x1="2832" />
            <wire x2="2848" y1="1216" y2="1216" x1="2832" />
            <wire x2="2944" y1="960" y2="960" x1="2832" />
        </branch>
        <instance x="2944" y="992" name="XLXI_17" orien="R0" />
        <branch name="J18_IO1">
            <wire x2="3200" y1="960" y2="960" x1="3168" />
        </branch>
        <instance x="3136" y="1840" name="XLXI_19" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="3136" y1="1808" y2="1808" x1="3104" />
        </branch>
        <branch name="DAC_CLR">
            <wire x2="3392" y1="1808" y2="1808" x1="3360" />
        </branch>
        <instance x="3040" y="1808" name="XLXI_20" orien="R0" />
        <branch name="LED0">
            <wire x2="1872" y1="1648" y2="1648" x1="1824" />
        </branch>
        <instance x="1600" y="1536" name="XLXI_25" orien="R0" />
        <instance x="1600" y="1600" name="XLXI_26" orien="R0" />
        <branch name="SW0">
            <wire x2="1568" y1="1504" y2="1504" x1="1504" />
            <wire x2="1568" y1="1504" y2="1648" x1="1568" />
            <wire x2="1600" y1="1648" y2="1648" x1="1568" />
            <wire x2="1600" y1="1504" y2="1504" x1="1568" />
        </branch>
        <branch name="SW1">
            <wire x2="1600" y1="1568" y2="1568" x1="1504" />
        </branch>
        <instance x="1600" y="1680" name="XLXI_27" orien="R0" />
        <branch name="XLXN_63">
            <wire x2="1232" y1="1408" y2="1408" x1="912" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="1232" y1="1344" y2="1344" x1="912" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="1232" y1="1280" y2="1280" x1="912" />
        </branch>
        <iomarker fontsize="28" x="2224" y="1360" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="3392" y="1216" name="SPI_SCK" orien="R0" />
        <iomarker fontsize="28" x="3392" y="1280" name="DAC_CS" orien="R0" />
        <iomarker fontsize="28" x="3392" y="1344" name="SPI_MOSI" orien="R0" />
        <iomarker fontsize="28" x="3872" y="1248" name="J18_IO2" orien="R0" />
        <iomarker fontsize="28" x="3872" y="1312" name="J18_IO3" orien="R0" />
        <iomarker fontsize="28" x="3200" y="960" name="J18_IO1" orien="R0" />
        <iomarker fontsize="28" x="3648" y="1136" name="J18_IO4" orien="R0" />
        <iomarker fontsize="28" x="2784" y="960" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="3392" y="1808" name="DAC_CLR" orien="R0" />
        <iomarker fontsize="28" x="1872" y="1648" name="LED0" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1568" name="SW1" orien="R180" />
        <iomarker fontsize="28" x="1504" y="1504" name="SW0" orien="R180" />
        <instance x="1232" y="1440" name="XLXI_42" orien="R0">
        </instance>
        <branch name="CLK_50MHZ">
            <wire x2="1216" y1="880" y2="880" x1="1152" />
            <wire x2="1216" y1="880" y2="1088" x1="1216" />
            <wire x2="1232" y1="1088" y2="1088" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="1152" y="880" name="CLK_50MHZ" orien="R180" />
        <instance x="528" y="1440" name="XLXI_43" orien="R0">
        </instance>
        <branch name="ROT_A">
            <wire x2="528" y1="1344" y2="1344" x1="496" />
        </branch>
        <branch name="ROT_B">
            <wire x2="528" y1="1408" y2="1408" x1="496" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="528" y1="1280" y2="1280" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="1344" name="ROT_A" orien="R180" />
        <iomarker fontsize="28" x="496" y="1408" name="ROT_B" orien="R180" />
        <iomarker fontsize="28" x="496" y="1280" name="CLK_50MHZ" orien="R180" />
        <instance x="1040" y="1120" name="XLXI_44" orien="R0" />
        <branch name="XLXN_68">
            <wire x2="1184" y1="992" y2="992" x1="1104" />
            <wire x2="1184" y1="992" y2="1152" x1="1184" />
            <wire x2="1232" y1="1152" y2="1152" x1="1184" />
        </branch>
        <branch name="ROT_CENTER">
            <wire x2="1232" y1="1216" y2="1216" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1216" name="ROT_CENTER" orien="R180" />
        <instance x="1856" y="2176" name="XLXI_45" orien="R0">
        </instance>
        <branch name="CLK_50MHZ">
            <wire x2="1856" y1="1824" y2="1824" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1824" name="CLK_50MHZ" orien="R180" />
        <branch name="XLXN_70">
            <wire x2="1696" y1="1888" y2="1920" x1="1696" />
            <wire x2="1856" y1="1888" y2="1888" x1="1696" />
        </branch>
        <instance x="1632" y="2048" name="XLXI_46" orien="R0" />
        <branch name="LCD_E">
            <wire x2="2304" y1="1824" y2="1824" x1="2288" />
            <wire x2="2320" y1="1824" y2="1824" x1="2304" />
        </branch>
        <branch name="LCD_RW">
            <wire x2="2304" y1="1920" y2="1920" x1="2288" />
            <wire x2="2320" y1="1920" y2="1920" x1="2304" />
        </branch>
        <branch name="LCD_RS">
            <wire x2="2304" y1="2016" y2="2016" x1="2288" />
            <wire x2="2320" y1="2016" y2="2016" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1824" name="LCD_E" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1920" name="LCD_RW" orien="R0" />
        <iomarker fontsize="28" x="2320" y="2016" name="LCD_RS" orien="R0" />
        <branch name="LCD_DB(7:0)">
            <wire x2="2304" y1="2112" y2="2112" x1="2288" />
            <wire x2="2320" y1="2112" y2="2112" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2320" y="2112" name="LCD_DB(7:0)" orien="R0" />
    </sheet>
</drawing>