import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts

TextField{

    property ApplicationTheme mApplicationTheme

    property bool isRTL

    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.maximumHeight: 53
    Layout.minimumHeight: 44
    Material.containerStyle :Material.Outlined
    Material.primary: mApplicationTheme.accent
    Material.accent: mApplicationTheme.primary
    Material.foreground: mApplicationTheme.foreground
    font: isRTL ? mApplicationTheme.fontFaBodyNormal : mApplicationTheme.fontEnBodyNormal
    horizontalAlignment:isRTL ? Text.AlignRight :Text.AlignLeft

}
