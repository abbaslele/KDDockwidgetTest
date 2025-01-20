import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtCore

Pane {
    id: item
    property ApplicationTheme mApplicationTheme
    Material.background: mApplicationTheme.accent

    Component.onCompleted: {
        readReciverSettings()
        readSaveSettings()
        readScanSettings()
    }



    Settings {
        id: settings
        category: "Iniformat"
    }

    ScrollView{
        id: scrollView
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        ColumnLayout{
            id: uMainColumn
            spacing: mApplicationTheme.layoutSpacing
            anchors.margins: mApplicationTheme.bordeMargin
            clip: true
            width: scrollView.availableWidth

            LayoutItemProxy { target: uReciverSettingsGroup }
            ToolSeparator{
                orientation: Qt.Horizontal
                Layout.fillWidth: true
            }
            LayoutItemProxy { target: uSaveSettingsGroup }
            ToolSeparator{
                orientation: Qt.Horizontal
                Layout.fillWidth: true
            }
            LayoutItemProxy { target: uScanSettingsGroup }
        }
    }

    GroupBox{
        id: uReciverSettingsGroup
        title: "تنظیمات گیرنده"
        font: mApplicationTheme.fontFaHeaderBold
        Layout.fillWidth: true
        ColumnLayout{
            spacing: mApplicationTheme.layoutSpacing
            anchors.fill: parent
            anchors.margins: mApplicationTheme.defaultMargin
            LayoutItemProxy { target: uReciverHeader_Label;visible: false  }
            ToolSeparator{
                orientation: Qt.Horizontal
                Layout.fillWidth: true
                visible: false
            }
            LayoutItemProxy { target: uMode_TextField }
            LayoutItemProxy { target: uCenterFreq_TextField }
            LayoutItemProxy { target: uSpan_TextField }
            LayoutItemProxy { target: uRBW_TextField }
            LayoutItemProxy { target: uVBW_TextField }
            LayoutItemProxy { target: uRefLevel_TextField }
            LayoutItemProxy { target: uWindow_TextField }
            LayoutItemProxy { target: uDetector_TextField }
            LayoutItemProxy { target: uReciverSettingsSave_Button }
        }

    }

    GroupBox{
        id: uSaveSettingsGroup
        title: "تنظیمات ذخیره"
        Layout.fillWidth: true
        font: mApplicationTheme.fontFaHeaderBold
        ColumnLayout{
            spacing: mApplicationTheme.layoutSpacing
            anchors.fill: parent
            anchors.margins: mApplicationTheme.defaultMargin
            LayoutItemProxy { target: uSaveHeader_Label ;visible: false }
            ToolSeparator{
                orientation: Qt.Horizontal
                Layout.fillWidth: true
                ;visible: false
            }
            LayoutItemProxy { target: uFreq_TextField }
            LayoutItemProxy { target: uLevel_TextField }
            LayoutItemProxy { target: uSR_TextField }
            LayoutItemProxy { target: uFFTLen_TextField }
            LayoutItemProxy { target: uBW_TextField }
            LayoutItemProxy { target: uTimeSpan_TextField }
            LayoutItemProxy { target: uSaveSettingsSave_Button }
        }

    }

    GroupBox{
        id: uScanSettingsGroup
        title: "تنظیمات پایش"
        Layout.fillWidth: true
        font: mApplicationTheme.fontFaHeaderBold
        ColumnLayout{
            spacing: mApplicationTheme.layoutSpacing
            anchors.fill: parent
            anchors.margins: mApplicationTheme.defaultMargin
            LayoutItemProxy { target: uScanHeader_Label ;visible: false }
            ToolSeparator{
                orientation: Qt.Horizontal
                Layout.fillWidth: true
                visible: false
            }
            LayoutItemProxy { target: uStart_TextField }
            LayoutItemProxy { target: uStop_TextField }
            LayoutItemProxy { target: uStep_TextField }

            LayoutItemProxy { target: uScanSettingsSave_Button }
        }

    }

    //! ReciverSettings
    CustomHeaderLabel{
        id: uReciverHeader_Label
        text: "تنظیمات گیرنده"
        visible: false
        mApplicationTheme : item.mApplicationTheme
    }

    CustomTextField{
        id: uMode_TextField
        placeholderText: qsTr("حالت")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme
    }

    CustomTextField{
        id: uCenterFreq_TextField
        placeholderText: qsTr("فرکانس مرکزی")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme


    }

    CustomTextField{
        id: uSpan_TextField
        placeholderText: qsTr("Span")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme


    }

    CustomTextField{
        id: uRBW_TextField
        placeholderText: qsTr("RBW")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uVBW_TextField
        placeholderText: qsTr("VBW")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme


    }

    CustomTextField{
        id: uRefLevel_TextField
        placeholderText: qsTr("Ref Level")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uWindow_TextField
        placeholderText: qsTr("Window")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme


    }

    CustomTextField{
        id: uDetector_TextField
        placeholderText: qsTr("Detector")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomButton{
        id: uReciverSettingsSave_Button
        text: "اعمال تنظیمات"
        isIconButton: false
        icon.source: "../Assets/Icons/keyboard_return.svg"
        mApplicationTheme : item.mApplicationTheme
        onClicked: saveReciverSettings()
    }

    function saveReciverSettings(){
        settings.setValue("Mode" , uMode_TextField.text)
        settings.setValue("CenterFreq" , uCenterFreq_TextField.text)
        settings.setValue("Span" , uSpan_TextField.text)
        settings.setValue("RBW" , uRBW_TextField.text)
        settings.setValue("VBW" , uVBW_TextField.text)
        settings.setValue("RefLevel" , uRefLevel_TextField.text)
        settings.setValue("Window" , uWindow_TextField.text)
        settings.setValue("Detector" , uDetector_TextField.text)
    }

    function readReciverSettings(){
        uMode_TextField.text = settings.value("Mode" , "")
        uCenterFreq_TextField.text = settings.value("CenterFreq" ,"" )
        uSpan_TextField.text = settings.value("Span" ,"" )
        uRBW_TextField.text = settings.value("RBW" ,"" )
        uVBW_TextField.text = settings.value("VBW" , "")
        uRefLevel_TextField.text = settings.value("RefLevel" , "")
        uWindow_TextField.text = settings.value("Window" , "")
        uDetector_TextField.text = settings.value("Detector" , "")
    }

    //! SaveSettings
    CustomHeaderLabel{
        id: uSaveHeader_Label
        text: "تنظیمات ذخیره سازی"
        visible: false
        mApplicationTheme : item.mApplicationTheme
    }

    CustomTextField{
        id: uFreq_TextField
        placeholderText: qsTr("فرکانس")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uLevel_TextField
        placeholderText: qsTr("Level")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uSR_TextField
        placeholderText: qsTr("SR")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uFFTLen_TextField
        placeholderText: qsTr("FFT Length")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uBW_TextField
        placeholderText: qsTr("BW")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uTimeSpan_TextField
        placeholderText: qsTr("زمان ذخیره")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme

    }

    CustomButton{
        id: uSaveSettingsSave_Button
        text: "اعمال تنظیمات"
        isIconButton: false

        mApplicationTheme : item.mApplicationTheme
        icon.source: "../Assets/Icons/keyboard_return.svg"

        onClicked: saveSaveSettings()
    }


    function saveSaveSettings(){
        settings.setValue("SaveFreq" , uFreq_TextField.text)
        settings.setValue("SaveLevel" , uLevel_TextField.text)
        settings.setValue("SR" , uSR_TextField.text)
        settings.setValue("FFTLen" , uFFTLen_TextField.text)
        settings.setValue("BW" , uBW_TextField.text)
        settings.setValue("SaveTimeSpan" , uTimeSpan_TextField.text)
    }

    function readSaveSettings(){
        uFreq_TextField.text = settings.value("SaveFreq" , "")
        uLevel_TextField.text = settings.value("SaveLevel" ,"" )
        uSR_TextField.text = settings.value("SR" ,"" )
        uFFTLen_TextField.text = settings.value("FFTLen" ,"" )
        uBW_TextField.text = settings.value("BW" , "")
        uTimeSpan_TextField.text = settings.value("SaveTimeSpan" , "")
    }


    //! ScanSettings
    CustomHeaderLabel{
        id: uScanHeader_Label
        text: "تنظیمات پایش"
        visible: false
        mApplicationTheme : item.mApplicationTheme
    }

    CustomTextField{
        id: uStart_TextField
        placeholderText: qsTr("شروع")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uStop_TextField
        placeholderText: qsTr("پایان")
        isRTL : true
        mApplicationTheme : item.mApplicationTheme

    }

    CustomTextField{
        id: uStep_TextField
        placeholderText: qsTr("Step")
        isRTL : false
        mApplicationTheme : item.mApplicationTheme

    }

    CustomButton{
        id: uScanSettingsSave_Button
        text: "اعمال تنظیمات"
        isIconButton: false
        icon.source: "../Assets/Icons/keyboard_return.svg"
        mApplicationTheme : item.mApplicationTheme
        onClicked: saveScanSettings()
    }

    function saveScanSettings(){
        settings.setValue("Start" , uStart_TextField.text)
        settings.setValue("Stop" , uStop_TextField.text)
        settings.setValue("Step" , uStep_TextField.text)
    }

    function readScanSettings(){
        uStart_TextField.text = settings.value("Start" , "")
        uStop_TextField.text = settings.value("Stop" ,"" )
        uStep_TextField.text = settings.value("Step" ,"" )
    }

}

