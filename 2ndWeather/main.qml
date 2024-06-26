import QtQuick
import QtQuick.Controls
import WeatherApp 1.0
import QtQuick.Layouts

Window
{
    visible: true
    height: 100
    width: 132

    Rectangle
    {
        id: weatherIconRect
        width: parent.width
        height: parent.height
        color: "#00000000"


        WeatherApi
        {
            id: weatherApi
        }

        RowLayout
        {
            id: weatherIconRow
            anchors.fill: parent
            spacing: 0

            Rectangle
            {
                id: imgContainer
                Layout.preferredWidth: 80
                Layout.preferredHeight:80
                color: "#00000000"

                Image
                {
                    id: weatherImg
                    anchors.fill: parent
                    anchors.left:parent.left
                    anchors.leftMargin: 5
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: textContainer
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "pink"

                Text {
                    id: weatherText
                    anchors.centerIn: parent
                    text: " "
                    font.pixelSize: Math.min(weatherIconRect.width, weatherIconRect.height) * 0.2
                    verticalAlignment: Qt.AlignVCenter
                    color: "#ffffff"
                }
            }
        }
        Component.onCompleted:
        {

            weatherApi.weatherInfoChanged.connect(updateWeatherInfo);
        }
        function updateWeatherInfo()
        {
            weatherText.text =  weatherApi.weatherInfo.temperature.toFixed(1) + "°C";
            weatherImg.source = "http://openweathermap.org/img/wn/" + weatherApi.weatherInfo.iconId + "@2x.png";
        }
    }
}
