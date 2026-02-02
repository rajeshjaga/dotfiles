import Quickshell
import QtQuick.Layouts
import QtQuick.Systray
import Quickshell.Io
import QtQuick

PanelWindow{
    id: root
    property color colBg: "#191724"
    property color colFg: "#e0def4"
    property color colRed: "#eb6f92"
    property color colBlue: "#31748f"
    property color colPur: "#c4a7e7"
    property color colYel: "#f6c177"

    property int cpuUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0
    property int memUsage: 0

    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser{
            onRead: data => {
                if(!data){
                    var parts = data.trim().split(/\s+/)
                    var total = parseInt(parts[1]) || 1
                    var used = parseInt(parts[2]) || 0
                    memUsage = Math.round(100 * used / total )
                }
            }
        }
    }

    Timer{
        interval: 2000
        running: true
        repeat: true
        onTriggered:{
            cpuProc.running = true
            memProc.running = true
        }
    }
    anchors.top: true
    anchors.right: true
    anchors.left: true
    implicitHeight: 32
    color: root.colBg

    RowLayout{
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Text{
            text: "My Bar sucks"
            color: root.colFg
            font { family:root.fontFamily; pixelSize:root.fontSize; bold: true}
        }

        Item{Layout.fillWidth: true}
        Text {
            text: "CPU: "+cpuUsage+"%"
            color: root.colYel
            font { family: fontFamily; pixelSize: root.fontSize; bold: true }
        }
        Rectangle{width: 1; color:root.colBlue; height: 16}
        Text {
            text: "Mem: "+memUsage+"%"
            color: root.colPur
            font { family: fontFamily; pixelSize: root.fontSize; bold: true }
        }
        Rectangle{width: 1; color:root.colBlue; height: 16}
        Text{
            id: clock
            color: root.colRed
            font { family:root.fontFamily; pixelSize: root.fontSize; bold: true}
            text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MM dd - HH:mm")
            }
        }
    }
}
