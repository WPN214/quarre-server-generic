import QtQuick 2.12
import QtQuick.Window 2.12
import WPN114.Network 1.0 as WPN114
import WPN114.Midi 1.0 as WPNMIDI
import QtQuick.Controls 2.0
import "quarre-api"

Window
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    NetworkManager { id: net }

    Interaction
    {
        id: interaction_whip
        title: "test-interaction"
        module: "basics/GestureHammer.qml"
        description: "ceci est une description"

        mappings: QuMapping
        {
            source: "/gestures/whip/trigger"
            expression: function(v) {
                console.log("whip!!");
                midi_out.noteOn(0, Math.random()*20+40, 30)
            }
        }
    }

    WPNMIDI.MidiDevice
    {
        id: midi_out
        outVirtualPort: "quarre-midi-out"
    }

    Button
    {
        text: "send interaction"
        onPressed: interaction_whip.notify(10, 30);
    }

    Button
    {
        text: "begin interaction"
        onPressed: interaction_whip.begin();
        y: 50
    }

    Button
    {
        text: "end interaction"
        onPressed: interaction_whip.end();
        y: 100
    }






}
