import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts

Label{
    property ApplicationTheme mApplicationTheme

    text: "تنظیمات گیرنده"
    font: item.mApplicationTheme.fontFaHeaderBold
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.maximumHeight: 53
    Layout.minimumHeight: 44
    Material.foreground: item.mApplicationTheme.foreground
}
