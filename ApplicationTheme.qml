// theme.qml
import QtQuick 2.15
import QtQuick.Controls.Material 2.15

QtObject {

    property int fontBodySize: 9
    property int fontHeaderSize: 11
    property int bordeRadius: 8
    property int bordeMargin: 4
    property int layoutSpacing: 8 // Ensure this property exists
    property int defaultMargin: 6
    property int elevation: 2


    property bool isThemeDark: false



    // Use the Theme singleton properties
    property var theme :  isThemeDark ? Material.Dark : Material.Light
    property var background: isThemeDark ? "#072C00" : "#F9F9F9"
    property var accent: isThemeDark ? "#403030" : "#D6EFD8"
    property var primary: isThemeDark ? "#42855B" : "#90B77D"
    property var foreground: isThemeDark ? "#EDEDED" : "#1C1B1F"


    /// English Font
    property string fontEnFamily: "Noto Sans"
    property font fontEnBold: Qt.font({
        family: fontEnFamily,
        pointSize: fontBodySize,
        bold: true
    })
    property font fontEnBodyNormal: Qt.font({
        family: fontEnFamily,
        pointSize: fontBodySize,
        bold: false
    })



    /// Persian Font
    property string fontFaFamily: "IRANSans"
    property font fontFaTitleBold: Qt.font({
        family: fontFaFamily,
        pointSize: 18,
        bold: true
    })
    property font fontFaHeaderBold: Qt.font({
        family: fontFaFamily,
        pointSize: fontHeaderSize,
        bold: true
    })
    property font fontFaBodyNormal: Qt.font({
        family: fontFaFamily,
        pointSize: fontBodySize,
        bold: false
    })
    property font fontFaBodyBold: Qt.font({
        family: fontFaFamily,
        pointSize: fontBodySize,
        bold: true
    })


}
