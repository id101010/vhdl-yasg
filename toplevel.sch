<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FORM(1:0)" />
        <signal name="FORM(0)">
        </signal>
        <signal name="FORM(1)">
        </signal>
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_9(11:0)" />
        <signal name="XLXN_10" />
        <signal name="SPI_SCK" />
        <signal name="DAC_CS" />
        <signal name="SPI_MOSI" />
        <signal name="FREQ(16:0)" />
        <signal name="FREQ(15:0)" />
        <signal name="J18_IO4" />
        <signal name="J18_IO2" />
        <signal name="J18_IO3" />
        <signal name="J18_IO1" />
        <signal name="XLXN_30" />
        <signal name="DAC_CLR" />
        <signal name="LED0" />
        <signal name="SW0" />
        <signal name="SW1" />
        <signal name="XLXN_40" />
        <signal name="FREQ(16)" />
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
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
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
        <block symbolname="spi_driver" name="XLXI_1">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_10" name="rst" />
            <blockpin signalname="XLXN_9(11:0)" name="val(11:0)" />
            <blockpin signalname="SPI_SCK" name="sck" />
            <blockpin signalname="DAC_CS" name="cs" />
            <blockpin signalname="SPI_MOSI" name="mosi" />
        </block>
        <block symbolname="dds" name="XLXI_2">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="FREQ(16:0)" name="freq(16:0)" />
            <blockpin signalname="FORM(1:0)" name="form(1:0)" />
            <blockpin signalname="XLXN_9(11:0)" name="amp(11:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_10" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_10">
            <blockpin signalname="FREQ(16)" name="G" />
        </block>
        <block symbolname="constant" name="XLXI_3">
            <attr value="03E8" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="FREQ(15:0)" name="O" />
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
        <block symbolname="vcc" name="XLXI_20">
            <blockpin signalname="XLXN_30" name="P" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="XLXN_30" name="I" />
            <blockpin signalname="DAC_CLR" name="O" />
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
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="976" y="992" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1568" y="848" name="XLXI_1" orien="R0">
        </instance>
        <branch name="FORM(1:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="848" y="960" type="branch" />
            <wire x2="848" y1="960" y2="976" x1="848" />
            <wire x2="848" y1="976" y2="1008" x1="848" />
            <wire x2="976" y1="960" y2="960" x1="848" />
        </branch>
        <bustap x2="752" y1="976" y2="976" x1="848" />
        <bustap x2="752" y1="1008" y2="1008" x1="848" />
        <branch name="FORM(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="656" y="976" type="branch" />
            <wire x2="656" y1="976" y2="976" x1="544" />
            <wire x2="752" y1="976" y2="976" x1="656" />
        </branch>
        <branch name="FORM(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="656" y="1040" type="branch" />
            <wire x2="656" y1="1040" y2="1040" x1="544" />
            <wire x2="752" y1="1040" y2="1040" x1="656" />
            <wire x2="752" y1="1008" y2="1040" x1="752" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="976" y1="832" y2="832" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="832" name="CLK_50MHZ" orien="R180" />
        <branch name="XLXN_9(11:0)">
            <wire x2="1456" y1="832" y2="832" x1="1360" />
            <wire x2="1456" y1="816" y2="832" x1="1456" />
            <wire x2="1568" y1="816" y2="816" x1="1456" />
        </branch>
        <instance x="1296" y="736" name="XLXI_7" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="1360" y1="544" y2="608" x1="1360" />
            <wire x2="1440" y1="544" y2="544" x1="1360" />
            <wire x2="1440" y1="544" y2="752" x1="1440" />
            <wire x2="1568" y1="752" y2="752" x1="1440" />
        </branch>
        <branch name="SPI_SCK">
            <wire x2="1984" y1="688" y2="688" x1="1952" />
            <wire x2="2112" y1="688" y2="688" x1="1984" />
            <wire x2="1984" y1="608" y2="688" x1="1984" />
            <wire x2="2112" y1="608" y2="608" x1="1984" />
        </branch>
        <branch name="DAC_CS">
            <wire x2="1984" y1="752" y2="752" x1="1952" />
            <wire x2="2112" y1="752" y2="752" x1="1984" />
            <wire x2="1984" y1="720" y2="752" x1="1984" />
            <wire x2="2336" y1="720" y2="720" x1="1984" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="1984" y1="816" y2="816" x1="1952" />
            <wire x2="2112" y1="816" y2="816" x1="1984" />
            <wire x2="1984" y1="784" y2="816" x1="1984" />
            <wire x2="2336" y1="784" y2="784" x1="1984" />
        </branch>
        <branch name="FREQ(16:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="795" y="896" type="branch" />
            <wire x2="624" y1="816" y2="864" x1="624" />
            <wire x2="624" y1="864" y2="896" x1="624" />
            <wire x2="976" y1="896" y2="896" x1="624" />
        </branch>
        <bustap x2="528" y1="816" y2="816" x1="624" />
        <bustap x2="528" y1="864" y2="864" x1="624" />
        <branch name="FREQ(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="464" y="864" type="branch" />
            <wire x2="464" y1="864" y2="864" x1="352" />
            <wire x2="528" y1="864" y2="864" x1="464" />
        </branch>
        <instance x="352" y="768" name="XLXI_10" orien="R0" />
        <instance x="208" y="832" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2112" y="640" name="XLXI_14" orien="R0" />
        <iomarker fontsize="28" x="2112" y="688" name="SPI_SCK" orien="R0" />
        <branch name="J18_IO4">
            <wire x2="2368" y1="608" y2="608" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2112" y="752" name="DAC_CS" orien="R0" />
        <iomarker fontsize="28" x="2112" y="816" name="SPI_MOSI" orien="R0" />
        <instance x="2336" y="752" name="XLXI_15" orien="R0" />
        <instance x="2336" y="816" name="XLXI_16" orien="R0" />
        <branch name="J18_IO2">
            <wire x2="2592" y1="720" y2="720" x1="2560" />
        </branch>
        <iomarker fontsize="28" x="2592" y="720" name="J18_IO2" orien="R0" />
        <branch name="J18_IO3">
            <wire x2="2592" y1="784" y2="784" x1="2560" />
        </branch>
        <iomarker fontsize="28" x="2592" y="784" name="J18_IO3" orien="R0" />
        <branch name="CLK_50MHZ">
            <wire x2="1552" y1="432" y2="432" x1="1504" />
            <wire x2="1552" y1="432" y2="688" x1="1552" />
            <wire x2="1568" y1="688" y2="688" x1="1552" />
            <wire x2="1664" y1="432" y2="432" x1="1552" />
        </branch>
        <instance x="1664" y="464" name="XLXI_17" orien="R0" />
        <branch name="J18_IO1">
            <wire x2="1920" y1="432" y2="432" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1920" y="432" name="J18_IO1" orien="R0" />
        <iomarker fontsize="28" x="2368" y="608" name="J18_IO4" orien="R0" />
        <iomarker fontsize="28" x="1504" y="432" name="CLK_50MHZ" orien="R180" />
        <instance x="1856" y="1312" name="XLXI_19" orien="R0" />
        <branch name="XLXN_30">
            <wire x2="1856" y1="1280" y2="1280" x1="1824" />
        </branch>
        <branch name="DAC_CLR">
            <wire x2="2112" y1="1280" y2="1280" x1="2080" />
        </branch>
        <iomarker fontsize="28" x="2112" y="1280" name="DAC_CLR" orien="R0" />
        <instance x="1760" y="1280" name="XLXI_20" orien="R0" />
        <branch name="LED0">
            <wire x2="592" y1="1120" y2="1120" x1="544" />
        </branch>
        <iomarker fontsize="28" x="592" y="1120" name="LED0" orien="R0" />
        <instance x="320" y="1008" name="XLXI_25" orien="R0" />
        <instance x="320" y="1072" name="XLXI_26" orien="R0" />
        <branch name="SW0">
            <wire x2="288" y1="976" y2="976" x1="224" />
            <wire x2="288" y1="976" y2="1120" x1="288" />
            <wire x2="320" y1="1120" y2="1120" x1="288" />
            <wire x2="320" y1="976" y2="976" x1="288" />
        </branch>
        <branch name="SW1">
            <wire x2="320" y1="1040" y2="1040" x1="224" />
        </branch>
        <instance x="320" y="1152" name="XLXI_27" orien="R0" />
        <iomarker fontsize="28" x="224" y="1040" name="SW1" orien="R180" />
        <iomarker fontsize="28" x="224" y="976" name="SW0" orien="R180" />
        <branch name="FREQ(16)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="512" y="736" type="branch" />
            <wire x2="416" y1="624" y2="640" x1="416" />
            <wire x2="512" y1="624" y2="624" x1="416" />
            <wire x2="512" y1="624" y2="736" x1="512" />
            <wire x2="512" y1="736" y2="816" x1="512" />
            <wire x2="528" y1="816" y2="816" x1="512" />
        </branch>
    </sheet>
</drawing>