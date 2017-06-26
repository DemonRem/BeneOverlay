/* Copyright (C) 2017 Benjamin Isbarn.

   This file is part of BeneOverlay.

   BeneOverlay is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   BeneOverlay is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with BeneOverlay.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

BOItem {
    id: root

    property alias checked: value_checkbox.checked

    implicitWidth: value_checkbox.implicitWidth + Math.max(label_text.implicitWidth + label_text.anchors.leftMargin, description_text.implicitWidth + description_text.anchors.leftMargin)
    implicitHeight: Math.max(value_checkbox.implicitHeight, label_text.implicitHeight + description_text.implicitHeight)

    Switch {
        id: value_checkbox

        anchors {left: parent.left; top: parent.top; bottom: parent.bottom}
        padding: 0
        checked: root.data_ref.data

        Binding {
            target: root.data_ref
            property: "data"
            value: value_checkbox.checked
        }
    }

    Text {
        id: label_text

        anchors {left: value_checkbox.right; top: parent.top; right: parent.right; bottom: value_checkbox.verticalCenter; leftMargin: 8; bottomMargin: 2}
        text: root.label
        font.pointSize: 11
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignBottom
    }

    Text {
        id: description_text

        anchors {left: value_checkbox.right; top: value_checkbox.verticalCenter; right: parent.right; bottom: parent.bottom; leftMargin: 8; topMargin: 2}
        text: root.description
        color: Material.hintTextColor
        wrapMode: Text.WordWrap
    }
}
