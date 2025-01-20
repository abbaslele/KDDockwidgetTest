import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import com.kdab.dockwidgets 2.0 as KDDW
import QtQuick.Layouts
import QtCore

Window {
    width: 640
    height: 480
    visible: true
    visibility : Window.Maximized

    title: `${Application.name} (${Application.version})`

    Material.theme : mApplicationTheme.theme
    Material.background: mApplicationTheme.background
    Material.accent: mApplicationTheme.accent
    Material.primary: mApplicationTheme.primary
    Material.foreground: mApplicationTheme.foreground

    ApplicationTheme{
        id : mApplicationTheme
    }

    HomePage {
        id: uHomePage
        mApplicationTheme : mApplicationTheme
    }

    StackView {
        id: mStackView
        initialItem: uHomePage
        anchors.fill: parent
    }

}
