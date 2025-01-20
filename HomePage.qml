import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import com.kdab.dockwidgets 2.0 as KDDW
import QtQuick.Layouts

Item {
    id: item
    property ApplicationTheme mApplicationTheme

    ColumnLayout{
        id: l1
        spacing: mApplicationTheme.layoutSpacing
        anchors.fill: parent
        LayoutItemProxy { target: navBar }
        LayoutItemProxy { target: u_DockArea }

    }

    // Component.onCompleted: {
    //     uSweepMode_Button.checked= true
    // }

    Pane{
        id: navBar
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.maximumHeight: 80
        Layout.margins: mApplicationTheme.bordeMargin
        Material.primary: mApplicationTheme.primary
        Material.background: mApplicationTheme.accent
        Material.foreground: mApplicationTheme.foreground
        Material.roundedScale : Material.MediumScale
        Material.elevation: mApplicationTheme.elevation

        font: mApplicationTheme.fontEnBodyNormal

        RowLayout{
            spacing: mApplicationTheme.layoutSpacing
            anchors.fill: parent

            LayoutItemProxy { target: uAppIcon }
            LayoutItemProxy { target: uConnection_Button }
            LayoutItemProxy { target: uUserControl_Button }
            LayoutItemProxy { target: uSettings_Button }
            LayoutItemProxy { target: uHistory_Button }
            LayoutItemProxy { target: uReport_Button }
            LayoutItemProxy { target: uLogout_Button}
            ToolSeparator{}
            LayoutItemProxy { target: uLayout_MenuBar }
            LayoutItemProxy { target: uTheme_Button }
            ToolSeparator{}
            LayoutItemProxy { target: uSweepMode_Button}
            LayoutItemProxy { target: uMapMode_Button }
            LayoutItemProxy { target: uMultiBandMode_Button }
            ToolSeparator{}
            LayoutItemProxy { target: uPlayPause_Button }
            LayoutItemProxy { target: uFiller_Rectangel }

        }

        CustomButton{
            id: uConnection_Button
            text: "Disconnect"
            isIconButton: false
            Layout.maximumWidth: icon.width + leftPadding  +implicitContentWidth
            mApplicationTheme : item.mApplicationTheme
            Material.background: Material.DeepOrange
            icon.source: "../Assets/Icons/error_outline.svg"

        }
        
        
        CustomButton{
            id: uUserControl_Button
            isIconButton: true
            buttonText_Tooltip : "User Settings"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/supervisor_account.svg"
        }

        CustomButton{
            id: uSettings_Button
            isIconButton: true
            buttonText_Tooltip : "Settings"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/settings_fill.svg"

        }

        CustomButton{
            id: uHistory_Button
            isIconButton: true
            buttonText_Tooltip : "History"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/history.svg"
        }

        CustomButton{
            id: uReport_Button
            isIconButton: true
            buttonText_Tooltip : "Report"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/assignment.svg"
        }

        CustomButton{
            id: uLogout_Button
            isIconButton: true
            buttonText_Tooltip : "Logout"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/logout.svg"
        }

        // CustomButton{
        //     id: uLayout_Button
        //     isIconButton: true
        //     buttonText_Tooltip : "Logout"
        //     mApplicationTheme : item.mApplicationTheme
        //     icon.source: "../Assets/Icons/view_compact.svg"
        // }

        MenuBar {
            id: uLayout_MenuBar
            Menu {
                icon.source: "../Assets/Icons/view_compact.svg"
                icon.name: "edit-cut"
                title: qsTr("&Layout")
                Menu{
                    title: qsTr("&Save")
                    Action {
                        text: qsTr("Save Sweep layout")
                        onTriggered: {
                            layoutSaver.saveToFile("SweepLayout.json");
                        }
                    }

                    Action {
                        text: qsTr("Save Map layout")
                        onTriggered: {
                            layoutSaver.saveToFile("MapLayout.json");
                        }
                    }

                    Action {
                        text: qsTr("Save Multiband layout")
                        onTriggered: {
                            layoutSaver.saveToFile("MultibandLayout.json");
                        }
                    }
                }

                Menu{
                    title: qsTr("&Restore")

                    Action {
                        text: qsTr("Restore Factory layout")
                        onTriggered: {
                            layoutSaver.restoreFromFile("SweepLayout.json");
                        }
                    }

                    Action {
                        text: qsTr("Restore Sweep layout")
                        onTriggered: {
                            uSweepMode_Button.checked= true
                        }
                    }

                    Action {
                        text: qsTr("Restore Map layout")
                        onTriggered: {
                            uMapMode_Button.checked= true

                        }
                    }

                    Action {
                        text: qsTr("Restore Multiband layout")
                        onTriggered: {
                            uMultiBandMode_Button.checked= true

                        }
                    }
                }

                Action {
                    text: qsTr("&Close All")
                    onTriggered: {
                        _kddwDockRegistry.clear();
                    }
                }

                MenuSeparator { }

                Action {
                    text: qsTr("&Model")
                    onTriggered: {
                        u_DockArea.addDockWidget(uModels_DockWidget, KDDW.KDDockWidgets.Location_OnRight, null, Qt.size(300, 500));
                    }
                }

                Action {
                    text: qsTr("&Settings")
                    onTriggered: {
                        u_DockArea.addDockWidget(uReciverSetting_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(300, 500));
                    }
                }

                Menu{
                    title: qsTr("&Views")
                    Action{
                        text: qsTr("Setting")
                        onTriggered: {
                            u_DockArea.addDockWidget(dock1, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));

                        }
                    }

                    Action{
                        text: qsTr("dock6")
                        onTriggered: {
                            u_DockArea.addDockWidget(uReciverSetting_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));

                        }
                    }
                }

                MenuSeparator { }

                Action { text: qsTr("&Quit")
                    onTriggered: {
                        Qt.quit();
                    }
                }

            }
        }


        CustomButton{
            id: uTheme_Button
            isIconButton: true
            buttonText_Tooltip : "Theme"
            mApplicationTheme: item.mApplicationTheme
            icon.source: "../Assets/Icons/light_mode.svg"
            onClicked: {
                if(item.mApplicationTheme.isThemeDark){
                    icon.source = "../Assets/Icons/light_mode.svg"
                    item.mApplicationTheme.isThemeDark = false
                }else{
                    icon.source = "../Assets/Icons/dark_mode_fill.svg"
                    item.mApplicationTheme.isThemeDark = true
                }
            }
        }

        CustomCheckedButton{
            id: uSweepMode_Button
            buttonText : "Sweep Mode"
            Layout.fillWidth: true
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/sort.svg"
            icon.color:  mApplicationTheme.foreground
            onCheckedChanged: {
                if(uSweepMode_Button.checked){
                    uMapMode_Button.checked = false
                    uMultiBandMode_Button.checked = false
                    layoutSaver.restoreFromFile("SweepLayout.json");
                }
            }
        }

        CustomCheckedButton{
            id: uMapMode_Button
            buttonText : "Map Mode"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/location_pin.svg"
            icon.color:  mApplicationTheme.foreground
            onCheckedChanged: {
                if(uMapMode_Button.checked){
                    uSweepMode_Button.checked = false
                    uMultiBandMode_Button.checked = false
                    layoutSaver.restoreFromFile("MapLayout.json");

                }
            }
        }

        CustomCheckedButton{
            id: uMultiBandMode_Button
            buttonText : "MultiBand Mode"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/workspaces_filled.svg"
            icon.color:  mApplicationTheme.foreground
            onCheckedChanged: {
                if(uMultiBandMode_Button.checked){
                    uMapMode_Button.checked = false
                    uSweepMode_Button.checked = false
                    layoutSaver.restoreFromFile("MultibandLayout.json");

                }
            }
        }

        CustomButton{
            id: uPlayPause_Button
            Material.background: "#00FFFFFF"
            Layout.maximumWidth: height
            buttonText_Tooltip : "Play/Pause"
            mApplicationTheme : item.mApplicationTheme
            icon.source: "../Assets/Icons/play_circle_filled.svg"

        }

        Rectangle{
            id: uFiller_Rectangel
            color: "#00FFFFFF"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Image {
            id: uAppIcon
            Layout.fillHeight: true
            fillMode: Image.PreserveAspectFit
            source: "../Assets/Icons/Shahab.svg"
        }
    }

    KDDW.DockingArea {
        id: u_DockArea
        // Each main layout needs a unique id
        uniqueName: "MainLayout-1"
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.fill: parent

        Component.onCompleted: {
            addDockWidget(uMainChart_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uWaterfallChart_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uModels_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMap_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uOnlineReport_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uPolar_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMultiChart1_2GHz_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMultiChart2_4GHz_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMultiChart4_8GHz_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMultiChart8_12GHz_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uMultiChart12_18GHz_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
            addDockWidget(uReciverSetting_DockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(500, 500));
        }

        KDDW.DockWidget {
            id: uMainChart_DockWidget
            uniqueName: "uMainChart"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Main Chart"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }


        KDDW.DockWidget {
            id: uWaterfallChart_DockWidget
            uniqueName: "uWaterfall"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Waterfall"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uModels_DockWidget
            uniqueName: "uModels"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Models"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uOnlineReport_DockWidget
            uniqueName: "uOnlineReport"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

            }
        }

        KDDW.DockWidget {
            id: uMap_DockWidget
            uniqueName: "uMap"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Map"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uPolar_DockWidget
            uniqueName: "uPolar"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Polar"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uMultiChart1_2GHz_DockWidget
            uniqueName: "Multi Chart 1_2 GHz"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Multi Chart 1-2 GHz"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }


        KDDW.DockWidget {
            id: uMultiChart2_4GHz_DockWidget
            uniqueName: "Multi Chart 2_4 GHz"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Multi Chart 2-4 GHz"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uMultiChart4_8GHz_DockWidget
            uniqueName: "Multi Chart 4_8 GHz"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Multi Chart 4-8 GHz"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uMultiChart8_12GHz_DockWidget
            uniqueName: "Multi Chart 8_12 GHz"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Multi Chart 8-12 GHz"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget {
            id: uMultiChart12_18GHz_DockWidget
            uniqueName: "Multi Chart 12_18 GHz"
            Pane {
                Material.background: mApplicationTheme.accent
                anchors.fill: parent

                Label{
                    text: "Multi Chart 12-18 GHz"
                    font: mApplicationTheme.fontEnBold
                    anchors.centerIn: parent
                }
            }
        }

        KDDW.DockWidget{
            id: uReciverSetting_DockWidget
            uniqueName: "Reciver Settings"
            Material.background: mApplicationTheme.background
            ReceiverSettingControl{
                mApplicationTheme: item.mApplicationTheme
            }
        }

        KDDW.LayoutSaver {
            id: layoutSaver
        }
    }



}
