import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts

Button{
    property ApplicationTheme mApplicationTheme

    property bool isIconButton



    property bool isRTL : true
    Layout.preferredWidth:  isIconButton ? icon.width + leftPadding + rightPadding : Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                                                                              implicitContentWidth + leftPadding + rightPadding)

     property string buttonText_Tooltip
    ToolTip.text: buttonText_Tooltip
    ToolTip.visible: {
        if(buttonText_Tooltip !== ""){
           hovered
        }else{
           null
        }
    }
    ToolTip.delay: 500
    ToolTip.timeout: 4000

    Layout.fillHeight: true
    Layout.fillWidth: isIconButton ? false : true
    Layout.minimumWidth: icon.width + leftPadding + rightPadding

    Layout.minimumHeight: 44
    Layout.maximumHeight: 52

    Material.primary: mApplicationTheme.accent
    Material.accent: mApplicationTheme.primary
    Material.background:isIconButton? "transparent" : mApplicationTheme.primary
    Material.foreground: mApplicationTheme.foreground
    Material.roundedScale : Material.FullScale

    Material.elevation: mApplicationTheme.elevation
    font: isRTL ? mApplicationTheme.fontFaBodyNormal : mApplicationTheme.fontEnBodyNormal

    icon.name: "edit-cut"
    icon.color : Material.foreground
    padding: 10

    icon.width:icon.height
}

