import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts

import QtQuick.Controls.impl

Button {
    id: checkableButton
    checkable: true
    checked: false

    property ApplicationTheme mApplicationTheme

   ToolTip.text: buttonText
   ToolTip.visible: {
       if(checkableButton.checked){
          null
       }else{
          hovered
       }
   }
   ToolTip.delay: 500
   ToolTip.timeout: 4000


    Layout.maximumWidth: checkableButton.checked ? leftPadding+ rightPadding + checkableButtonIcon.implicitWidth + checkableButtonText.implicitWidth : leftPadding+ rightPadding +  checkableButtonIcon.implicitWidth

    Behavior on Layout.maximumWidth {
        NumberAnimation { easing.type: Easing.InOutBack; duration: 400 } // Smoothly animate opacity
    }

    Material.background: checkableButton.checked ? mApplicationTheme.primary : "#00FFFFFF"


    Material.primary: mApplicationTheme.accent
    Material.accent: mApplicationTheme.primary
    Material.foreground: mApplicationTheme.foreground
    Material.roundedScale : Material.FullScale

    font: mApplicationTheme.fontEnBodyNormal

    icon.color:  mApplicationTheme.foreground
    // Text
    property string buttonText: "Button Text" // Text to display when checked
    contentItem: RowLayout {
        spacing: 5

        Image {
            id: checkableButtonIcon
            source: checkableButton.icon.source
            width: checkableButton.icon.width
            height: checkableButton.icon.height
            Layout.fillWidth: true
            Layout.minimumWidth: icon.width

        }
        Label {
            id: checkableButtonText
            text: checkableButton.buttonText
            opacity: checkableButton.checked ? 1 : 0 // Show/hide text based on checked state
            Layout.fillWidth: true
            Material.foreground: mApplicationTheme.foreground
            Behavior on opacity {
                NumberAnimation { duration: 200 } // Smoothly animate opacity
            }
        }
    }



    // Optional: Handle the checked state change
    onCheckedChanged: {
         checkableButtonText.opacity= checkableButton.checked ? 1 : 0
        Layout.maximumWidth= checkableButton.checked ? leftPadding+ rightPadding + checkableButtonIcon.implicitWidth + checkableButtonText.implicitWidth : leftPadding+ rightPadding +  checkableButtonIcon.implicitWidth

    }


}
