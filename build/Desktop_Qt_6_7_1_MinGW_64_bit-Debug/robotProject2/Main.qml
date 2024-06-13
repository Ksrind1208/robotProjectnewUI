import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    property var curPosition: [1,0,0]
    property var curAngle: [0,0,0,0]
    id: root
    // w:1423
    // h:800
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Robot Project")


    Item {
        id: secondScreen
        visible: true
        anchors.fill: parent

        Rectangle{
            id:container
            color:"#003366"
            anchors.fill: parent

            Image {
                id: borderImage
                source: "file:///D:/File_code/Qt/backgroundColor.png"
                anchors.fill: parent
            }

            Rectangle{
                id:settingRectangle
                color:"#252525"
                x:4/1423*Screen.width
                y:4/800*Screen.height
                width: 470/1423*Screen.width
                height: 275/800*Screen.height
                border.color: "white"
                border.width: 1.5/1423*Screen.width
                radius: 10

                Column{
                    spacing: 30/800*Screen.height
                    x:30/1423*Screen.width
                    y:30/800*Screen.height

                    Row{
                        spacing:(20/(470/1423*Screen.width))*470/1423*Screen.width
                        Rectangle{
                            id:home
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasHome
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasHome.getContext("2d");
                                    var width = canvasHome.width;
                                    var height = canvasHome.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the house
                                    ctx.fillStyle = "#6C757D";
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions of the house (smaller size)
                                    var houseWidth = width / 3;
                                    var houseHeight = height / 3;
                                    var houseX = (width - houseWidth) / 2.5;
                                    var houseY = (height - houseHeight) / 1.5;

                                    // Calculate the dimensions of the roof
                                    var roofWidth = houseWidth * 2; // Base of the triangle is twice the width of the square
                                    var roofHeight = houseHeight; // Height of the roof is equal to the height of the square

                                    // Calculate the coordinates for the roof
                                    var roofX1 = (width - roofWidth) / 2;
                                    var roofY1 = houseY; // Top edge of the square

                                    // Draw the square base of the house
                                    ctx.strokeRect(houseX, houseY, houseWidth*1.4, houseHeight*1.2);

                                    // Draw the triangular roof
                                    ctx.beginPath();
                                    ctx.moveTo(roofX1, roofY1); // Left corner of the roof
                                    ctx.lineTo(roofX1 + roofWidth / 2, roofY1 - roofHeight); // Top of the roof
                                    ctx.lineTo(roofX1 + roofWidth, roofY1); // Right corner of the roof
                                    ctx.closePath();
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mouseHome
                                anchors.fill: parent
                                hoverEnabled:true

                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }

                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        home.color="black"
                                        shadowSetting.color="#6C757D"
                                    }else{
                                        home.color="#6C757D"
                                        shadowSetting.color="black"
                                    }
                                }
                                ToolTip {
                                    Text{
                                        id:textHome
                                        text:"Trở về vị trí gốc"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseHome.containsMouse
                                    x: mouseHome.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mouseHome.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textHome.implicitWidth+10
                                    height:textHome.implicitHeight+10
                                }
                            }


                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowSetting
                                width: home.width
                                height: home.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: home
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }

                        Rectangle{
                            id:moveJoint
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasJoint
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasJoint.getContext("2d");
                                    var width = canvasJoint.width;
                                    var height = canvasJoint.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the joint drawing
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions and positions for the joint drawing
                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;

                                    // Draw the lines
                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY - lineLength);
                                    ctx.stroke();

                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY + lineLength);
                                    ctx.stroke();

                                    // Draw the arc
                                    ctx.beginPath();
                                    ctx.arc(centerX - lineLength, centerY + lineLength, lineLength , 0, -Math.PI / 4, true);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mousemoveJoint
                                anchors.fill: parent
                                hoverEnabled:true

                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        moveJoint.color="black"
                                        shadowJoint.color="#6C757D"

                                    }else{
                                        moveJoint.color="#6C757D"
                                        shadowJoint.color="black"

                                    }
                                }

                                onClicked: {
                                    myBackend.turnOnLed();
                                    windowmoveJoint.visible=true
                                    secondScreen.visible=false
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveJoint
                                        text:"Di chuyển theo góc"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveJoint.containsMouse
                                    x: mousemoveJoint.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mousemoveJoint.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textmoveJoint.implicitWidth+10
                                    height:textmoveJoint.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowJoint
                                width: moveJoint.width
                                height: moveJoint.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: moveJoint
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }

                        Rectangle {
                            id: moveTCP
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color: "#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasTCP
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasTCP.getContext("2d");
                                    var width = canvasTCP.width;
                                    var height = canvasTCP.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the cube
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions of the cube (larger size)
                                    var cubeSize = Math.min(width, height) / 2;
                                    var startX = (width - cubeSize) / 3.2;
                                    var startY = (height - cubeSize) / 1.3;

                                    // Draw the front face of the cube
                                    ctx.beginPath();
                                    ctx.rect(startX, startY, cubeSize, cubeSize);
                                    ctx.stroke();

                                    // Draw the top face of the cube
                                    ctx.beginPath();
                                    ctx.moveTo(startX, startY);
                                    ctx.lineTo(startX + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize, startY);
                                    ctx.closePath();
                                    ctx.stroke();

                                    // Draw the side face of the cube
                                    ctx.beginPath();
                                    ctx.moveTo(startX + cubeSize, startY);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY + cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize, startY + cubeSize);
                                    ctx.closePath();
                                    ctx.stroke();

                                    // Draw the edges connecting the faces
                                    ctx.beginPath();
                                    ctx.moveTo(startX, startY + cubeSize);
                                    ctx.lineTo(startX + cubeSize / 2, startY + cubeSize / 2);
                                    ctx.stroke();

                                    ctx.beginPath();
                                    ctx.moveTo(startX + cubeSize/2, startY + cubeSize/2);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY +cubeSize / 2);
                                    ctx.stroke();

                                    ctx.beginPath();
                                    ctx.moveTo(startX +cubeSize/2, startY + cubeSize/2);
                                    ctx.lineTo(startX + cubeSize / 2, startY + cubeSize / 2-cubeSize);
                                    ctx.stroke();
                                }
                            }

                            MouseArea {
                                id: mousemoveTCP
                                anchors.fill: parent
                                hoverEnabled: true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onEntered: {
                                    moveTCP.color = "black"
                                    shadowTCP.color="#6C757D"

                                }

                                onExited: {
                                    moveTCP.color = "#6C757D"
                                    shadowTCP.color="black"

                                }

                                onClicked: {
                                    // Toggle visibility of windowmoveTCP
                                    myBackend.turnOffLed();
                                    windowmoveTCP.visible = true;
                                    secondScreen.visible = false; // Assuming secondScreen is your main screen
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveTCP
                                        text:"Di chuyển theo tọa độ"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveTCP.containsMouse
                                    x: mousemoveTCP.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mousemoveTCP.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textmoveTCP.implicitWidth+10
                                    height:textmoveTCP.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowTCP
                                width: moveTCP.width
                                height: moveTCP.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: moveTCP
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }


                        Rectangle{
                            id:moveSLI
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasSLI
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasSLI.getContext("2d");
                                    var width = canvasSLI.width;
                                    var height = canvasSLI.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the joint drawing
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions and positions for the joint drawing
                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;

                                    // Draw the lines
                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY - lineLength);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mousemoveSLI
                                anchors.fill: parent
                                hoverEnabled:true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        moveSLI.color="black"
                                        shadowSLI.color="#6C757D"

                                    }else{
                                        moveSLI.color="#6C757D"
                                        shadowSLI.color="black"

                                    }
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveSLI
                                        text:"Nội suy đường thẳng"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveSLI.containsMouse
                                    x: mousemoveSLI.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mousemoveSLI.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textmoveSLI.implicitWidth+10
                                    height:textmoveSLI.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowSLI
                                width: moveSLI.width
                                height: moveSLI.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: moveSLI
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }
                    }

                    Row{
                        spacing:(20/(470/1423*Screen.width))*470/1423*Screen.width
                        Rectangle{
                            id:moveCI
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasCI
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasCI.getContext("2d");
                                    var width = canvasCI.width;
                                    var height = canvasCI.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the joint drawing
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions and positions for the joint drawing
                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;

                                    // Draw the arc
                                    ctx.beginPath();
                                    ctx.arc(centerX , centerY , lineLength , 0, -2*Math.PI, true);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mousemoveCI
                                anchors.fill: parent
                                hoverEnabled:true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        moveCI.color="black"
                                        shadowCI.color="#6C757D"

                                    }else{
                                        moveCI.color="#6C757D"
                                        shadowCI.color="black"

                                    }
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveCI
                                        text:"Nội suy cung tròn"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveCI.containsMouse
                                    x: mousemoveCI.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mousemoveCI.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textmoveCI.implicitWidth+10
                                    height:textmoveCI.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowCI
                                width: moveCI.width
                                height: moveCI.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: moveCI
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }

                        Rectangle{
                            id:draganddrop
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasDragAndDrop
                                anchors.centerIn: parent
                                width: parent.width * 0.8
                                height: parent.height * 0.8

                                onPaint: {
                                    var ctx = getContext("2d");
                                    var width = canvasDragAndDrop.width;
                                    var height = canvasDragAndDrop.height;

                                    // Clear canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set styles
                                    ctx.strokeStyle = "white";
                                    ctx.fillStyle = "white";
                                    ctx.lineWidth = 3;

                                    // Calculate dimensions and position
                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var iconSize = Math.min(width, height) / 3;

                                    // Draw hand icon
                                    var handRadius = iconSize / 2;
                                    ctx.beginPath();
                                    ctx.arc(centerX, centerY - handRadius / 2, handRadius, 0, 2 * Math.PI);
                                    ctx.stroke();

                                    // Draw fingers
                                    ctx.beginPath();
                                    ctx.moveTo(centerX - handRadius / 2, centerY - handRadius / 0.5);
                                    ctx.lineTo(centerX - handRadius / 2, centerY - handRadius / 0.3);
                                    ctx.moveTo(centerX, centerY - handRadius / 0.55);
                                    ctx.lineTo(centerX, centerY - handRadius / 0.35);
                                    ctx.moveTo(centerX + handRadius / 2, centerY - handRadius / 0.5);
                                    ctx.lineTo(centerX + handRadius / 2, centerY - handRadius / 0.3);
                                    ctx.stroke();

                                    // Draw parallelogram below hand
                                    var parallelogramWidth = iconSize * 0.8; // Adjust the width of parallelogram
                                    var parallelogramHeight = parallelogramWidth * 0.6; // Adjust the height ratio here

                                    ctx.beginPath();
                                    ctx.moveTo(centerX - parallelogramWidth / 2, centerY + handRadius * 2);
                                    ctx.lineTo(centerX + parallelogramWidth / 2, centerY + handRadius * 2);
                                    ctx.lineTo(centerX + parallelogramWidth / 2 - parallelogramHeight, centerY + handRadius * 2 + parallelogramHeight);
                                    ctx.lineTo(centerX - parallelogramWidth / 2 - parallelogramHeight, centerY + handRadius * 2 + parallelogramHeight);
                                    ctx.closePath();
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mouseDragandDrop
                                anchors.fill: parent
                                hoverEnabled:true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        draganddrop.color="black"
                                        shadowdraganddrop.color="#6C757D"

                                    }else{
                                        draganddrop.color="#6C757D"
                                        shadowdraganddrop.color="black"

                                    }
                                }

                                onClicked: {
                                    myBackend.closeSerialPort();
                                    Qt.quit()
                                }
                                ToolTip {
                                    Text{
                                        id:textdraganddrop
                                        text:"Gắp thả vật"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseDragandDrop.containsMouse
                                    x: mouseDragandDrop.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mouseDragandDrop.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textdraganddrop.implicitWidth+10
                                    height:textdraganddrop.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowdraganddrop
                                width: draganddrop.width
                                height: draganddrop.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: draganddrop
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }

                        Rectangle{
                            id:simulation
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasSimulation
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasSimulation.getContext("2d");
                                    var width = canvasSimulation.width;
                                    var height = canvasSimulation.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the simulation icon
                                    ctx.strokeStyle = "white";
                                    ctx.fillStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions and position of the icon
                                    var iconSize = Math.min(width, height) / 2;
                                    var centerX = width / 2;
                                    var centerY = height / 2;

                                    // Draw a circle
                                    ctx.beginPath();
                                    ctx.arc(centerX, centerY, iconSize / 1.5, 0, 2 * Math.PI);
                                    ctx.stroke();

                                    // Draw an arrow inside the circle
                                    var arrowLength = iconSize / 2;
                                    ctx.beginPath();
                                    ctx.moveTo(centerX, centerY - arrowLength / 2);
                                    ctx.lineTo(centerX, centerY + arrowLength / 2);
                                    ctx.lineTo(centerX - arrowLength / 4, centerY + arrowLength / 4);
                                    ctx.moveTo(centerX, centerY + arrowLength / 2);
                                    ctx.lineTo(centerX + arrowLength / 4, centerY + arrowLength / 4);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mouseSimulation
                                anchors.fill: parent
                                hoverEnabled:true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        simulation.color="black"
                                        shadowSimulation.color="#6C757D"

                                    }else{
                                        simulation.color="#6C757D"
                                        shadowSimulation.color="black"

                                    }
                                }

                                onClicked: {
                                    console.log("Simulated");
                                }
                                ToolTip {
                                    Text{
                                        id:textSimulation
                                        text:"Khởi động lại mô phỏng"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseSimulation.containsMouse
                                    x: mouseSimulation.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mouseSimulation.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textSimulation.implicitWidth+10
                                    height:textSimulation.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowSimulation
                                width: simulation.width
                                height: simulation.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: simulation
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }

                        Rectangle{
                            id:quit
                            width: 88/1423*Screen.width
                            height: 88/800*Screen.height
                            color:"#6C757D"
                            radius: 10

                            Canvas {
                                id: canvasQuit
                                anchors.fill: parent
                                anchors.centerIn: parent
                                onPaint: {
                                    var ctx = canvasQuit.getContext("2d");
                                    var width = canvasQuit.width;
                                    var height = canvasQuit.height;

                                    // Clear the canvas
                                    ctx.clearRect(0, 0, width, height);

                                    // Set the styles for the joint drawing
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    // Calculate the dimensions and positions for the joint drawing
                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;

                                    // Draw the lines
                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY - lineLength);
                                    ctx.lineTo(centerX - lineLength, centerY - lineLength);
                                    ctx.lineTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY - lineLength);
                                    ctx.moveTo(centerX - lineLength, centerY - lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY + lineLength);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mouseQuit
                                anchors.fill: parent
                                hoverEnabled:true
                                property int mouseX: 0
                                property int mouseY: 0

                                onPositionChanged: {
                                    mouseX = mouse.x;
                                    mouseY = mouse.y;
                                }
                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        quit.color="black"
                                        shadowQuit.color="#6C757D"
                                    }else{
                                        quit.color="#6C757D"
                                        shadowQuit.color="black"
                                    }
                                }

                                onClicked: {
                                    Qt.quit()
                                }
                                ToolTip {
                                    Text{
                                        id:textQuit
                                        text:"Thoát chương trình"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseQuit.containsMouse
                                    x: mouseQuit.mouseX + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    y: mouseQuit.mouseY + 10 // Offset by 10 pixels to avoid overlapping with the cursor
                                    width:textQuit.implicitWidth+10
                                    height:textQuit.implicitHeight+10
                                }
                            }

                            // Hiệu ứng đổ bóng bằng một Rectangle mờ
                            Rectangle {
                                id:shadowQuit
                                width: quit.width
                                height: quit.height
                                radius: 10
                                color: "black"
                                opacity: 0.3
                                anchors.centerIn: quit
                                anchors.horizontalCenterOffset: 5
                                anchors.verticalCenterOffset: 5
                            }
                        }
                    }
                }
            }


            Rectangle {
                id: positionRectangle
                color: "#252525"
                x: 4 / 1423 * Screen.width
                y: settingRectangle.y + settingRectangle.height + 4 / 800 * Screen.height
                width: 470 / 1423 * Screen.width
                height: Screen.height - (settingRectangle.y + settingRectangle.height + 2 * 4 / 800 * Screen.height)
                border.color: "white"
                border.width: 1.5 / 1423 * Screen.width
                radius: 10

                Row{
                    x:0.15*positionRectangle.width
                    y:0.05*positionRectangle.height
                    spacing:0.3*positionRectangle.width

                    Text {
                        text: "Angle"
                        color: "white"
                        font.family: "Helvetica"
                        font.pointSize: 18
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        text: "Position"
                        color: "white"
                        font.family: "Helvetica"
                        font.pointSize: 18
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Row{
                    x:0.15*positionRectangle.width-40
                    y:0.05*positionRectangle.height+70
                    spacing:0.15*positionRectangle.width
                    Column{
                        spacing:0.1*positionRectangle.height
                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:q1
                                anchors.centerIn: parent
                                text: "Q1: "+curAngle[0]
                                color: "black"
                                font.pointSize: 20
                            }
                        }
                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:q2
                                anchors.centerIn: parent
                                text: "Q2: "+curAngle[1]
                                color: "black"
                                font.pointSize: 20
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:q3
                                anchors.centerIn: parent
                                text: "Q3: "+curAngle[2]
                                color: "black"
                                font.pointSize: 20
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:q4
                                anchors.centerIn: parent
                                text: "Q4: "+curAngle[3]
                                color: "black"
                                font.pointSize: 20
                            }
                        }
                    }

                    Column{
                        spacing:0.1*positionRectangle.height
                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:x
                                anchors.centerIn: parent
                                text: "x: "+curPosition[0]
                                color: "black"
                                font.pointSize: 20
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:y
                                anchors.centerIn: parent
                                text: "y: "+curPosition[1]
                                color: "black"
                                font.pointSize: 20
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Text {
                                id:z
                                anchors.centerIn: parent
                                text: "z: "+curPosition[2]
                                color: "black"
                                font.pointSize: 20
                            }
                        }
                    }
                }
            }

            Rectangle{
                id:simulationRectangle
                color:"#252525"
                x:settingRectangle.x+settingRectangle.width+4/1423*Screen.width
                y:4/800*Screen.height
                width: Screen.width-(settingRectangle.x+settingRectangle.width+4/1423*Screen.width+4/1423*Screen.width)
                height: 420/800*Screen.height
                border.color: "white"
                border.width: 1.5/1423*Screen.width
                radius: 10


            }

            Rectangle{
                id:controllRectangle
                color:"#252525"
                x:settingRectangle.x+settingRectangle.width+4/1423*Screen.width
                y:simulationRectangle.y+simulationRectangle.height+4/800*Screen.height
                width: Screen.width-(settingRectangle.x+settingRectangle.width+4/1423*Screen.width+4/1423*Screen.width)
                height: Screen.height-(simulationRectangle.y+simulationRectangle.height+2*4/800*Screen.height)
                border.color: "white"
                border.width: 1.5/1423*Screen.width
                radius: 10

                Row{
                    x:0.1*controllRectangle.width
                    y:0.05*controllRectangle.height
                    spacing:0.2*controllRectangle.width
                    Row{
                        spacing:0.15*controllRectangle.width
                        Text{
                            id:joy1_2
                            text: "JOY 1&2"
                            color: "white"
                            font.family: "Helvetica"
                            font.pointSize: 20
                            font.bold: true
                        }

                        Text{
                            id:joy3_4
                            text: "JOY 3&4"
                            color: "white"
                            font.family: "Helvetica"
                            font.pointSize: 20
                            font.bold: true
                        }
                    }

                    Text{
                        id:moveLast
                        text: "Move last step"
                        color: "white"
                        font.family: "Helvetica"
                        font.pointSize: 20
                        font.bold: true
                    }
                }
                Row{
                    x:0.1*controllRectangle.width-65
                    y:0.05*controllRectangle.height+joy1_2.implicitHeight+100
                    spacing:0.03*controllRectangle.width
                    Row{
                        spacing:0.08*controllRectangle.width
                        Canvas {
                            id: leftArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width

                            property color arrowColor: "white"
                            property string arrowText: "J1-"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(width, 0);
                                ctx.lineTo(0, height / 2);
                                ctx.lineTo(width, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();

                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2+5;
                                var centerY = height / 2;

                                ctx.fillText(arrowText, centerX, centerY);
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    leftArrow.arrowColor = "#FFCC99";
                                    leftArrow.requestPaint();
                                }

                                onExited: {
                                    leftArrow.arrowColor = "white";
                                    leftArrow.requestPaint();
                                }

                                onClicked: {
                                    console.log("Left arrow clicked");
                                }
                            }
                        }
                        Canvas {
                            id: rightArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J1+"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(0, 0);
                                ctx.lineTo(width, height / 2);
                                ctx.lineTo(0, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();

                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2-5;
                                var centerY = height / 2;

                                ctx.fillText(arrowText, centerX, centerY);
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    rightArrow.arrowColor = "#FFCC99";
                                    rightArrow.requestPaint();
                                }

                                onExited: {
                                    rightArrow.arrowColor = "white";
                                    rightArrow.requestPaint();
                                }

                                onClicked: {
                                    console.log("Right arrow clicked");
                                }
                            }
                        }
                    }

                    Row{
                        spacing:0.08*controllRectangle.width
                        Canvas {
                                id: leftArrow4
                                width: 0.08*controllRectangle.width
                                height: 0.08*controllRectangle.width
                                property color arrowColor: "white"
                                property string arrowText: "J4-"
                                property color textColor: "black" // Color of the text
                                onPaint: {
                                    var ctx = getContext("2d");
                                    ctx.clearRect(0, 0, width, height);

                                    ctx.beginPath();
                                    ctx.moveTo(width, 0);
                                    ctx.lineTo(0, height / 2);
                                    ctx.lineTo(width, height);
                                    ctx.closePath();

                                    ctx.fillStyle = arrowColor;
                                    ctx.fill();

                                    // Add the text
                                    ctx.fillStyle = textColor;
                                    ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                    ctx.textAlign = "center";
                                    ctx.textBaseline = "middle";

                                    // Calculate the center position of the triangle
                                    var centerX = width / 2+5;
                                    var centerY = height / 2;

                                    ctx.fillText(arrowText, centerX, centerY);
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true

                                    onEntered: {
                                        leftArrow4.arrowColor = "#FFCC99";
                                        leftArrow4.requestPaint();
                                    }

                                    onExited: {
                                        leftArrow4.arrowColor = "white";
                                        leftArrow4.requestPaint();
                                    }

                                    onClicked: {
                                        console.log("Left arrow clicked");
                                    }
                                }
                            }
                        Canvas {
                            id: rightArrow4
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J4+"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(0, 0);
                                ctx.lineTo(width, height / 2);
                                ctx.lineTo(0, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2-5;
                                var centerY = height / 2;

                                ctx.fillText(arrowText, centerX, centerY);

                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    rightArrow4.arrowColor = "#FFCC99";
                                    rightArrow4.requestPaint();
                                }

                                onExited: {
                                    rightArrow4.arrowColor = "white";
                                    rightArrow4.requestPaint();
                                }

                                onClicked: {
                                    console.log("Right arrow clicked");
                                }
                            }
                        }
                    }
                }
                Row{
                    x:0.1*controllRectangle.width-65+0.6*controllRectangle.width
                    y:0.05*controllRectangle.height+joy1_2.implicitHeight+100
                    spacing:0.08*controllRectangle.width
                    Canvas {
                            id: leftArrowLastStep
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "X-"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(width, 0);
                                ctx.lineTo(0, height / 2);
                                ctx.lineTo(width, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2+5;
                                var centerY = height / 2;

                                ctx.fillText(arrowText, centerX, centerY);
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    leftArrowLastStep.arrowColor = "#FFCC99";
                                    leftArrowLastStep.requestPaint();
                                }

                                onExited: {
                                    leftArrowLastStep.arrowColor = "white";
                                    leftArrowLastStep.requestPaint();
                                }

                                onClicked: {
                                    console.log("Up arrow clicked");
                                }
                            }
                        }
                    Canvas {
                        id: rightArrowLastStep
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "X+"
                        property color textColor: "black" // Color of the text
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            ctx.beginPath();
                            ctx.moveTo(0, 0);
                            ctx.lineTo(width, height / 2);
                            ctx.lineTo(0, height);
                            ctx.closePath();

                            ctx.fillStyle = arrowColor;
                            ctx.fill();

                            // Add the text
                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            // Calculate the center position of the triangle
                            var centerX = width / 2-5;
                            var centerY = height / 2;

                            ctx.fillText(arrowText, centerX, centerY);

                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                rightArrowLastStep.arrowColor = "#FFCC99";
                                rightArrowLastStep.requestPaint();
                            }

                            onExited: {
                                rightArrowLastStep.arrowColor = "white";
                                rightArrowLastStep.requestPaint();
                            }

                            onClicked: {
                                console.log("Up arrow clicked");
                            }
                        }
                    }
                }

                Row{
                    x:0.1*controllRectangle.width-65+0.08*controllRectangle.width
                    y:joy1_2.height+joy1_2.implicitHeight
                    spacing:0.19*controllRectangle.width
                    Canvas {
                            id: upArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J2+"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(width / 2, 0);
                                ctx.lineTo(0, height);
                                ctx.lineTo(width, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2;
                                var centerY = height / 2+20;

                                ctx.fillText(arrowText, centerX, centerY);
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    upArrow.arrowColor = "#FFCC99";
                                    upArrow.requestPaint();
                                }

                                onExited: {
                                    upArrow.arrowColor = "white";
                                    upArrow.requestPaint();
                                }

                                onClicked: {
                                    console.log("Up arrow clicked");
                                }
                            }
                        }
                    Canvas {
                            id: upArrow3
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J3+"
                            property color textColor: "black" // Color of the text
                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(width / 2, 0);
                                ctx.lineTo(0, height);
                                ctx.lineTo(width, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2;
                                var centerY = height / 2+20;

                                ctx.fillText(arrowText, centerX, centerY);
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    upArrow3.arrowColor = "#FFCC99";
                                    upArrow3.requestPaint();
                                }

                                onExited: {
                                    upArrow3.arrowColor = "white";
                                    upArrow3.requestPaint();
                                }

                                onClicked: {
                                    console.log("Up arrow clicked");
                                }
                            }
                        }
                    }
                Row{
                    x:0.1*controllRectangle.width-65+0.08*controllRectangle.width
                    y:joy1_2.height+joy1_2.implicitHeight+0.084*controllRectangle.width*2
                    spacing:0.19*controllRectangle.width
                    Canvas {
                            id: downArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J2-"
                            property color textColor: "black" // Color of the text

                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(0, 0);
                                ctx.lineTo(width, 0);
                                ctx.lineTo(width / 2, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2;
                                var centerY = height / 2-20;

                                ctx.fillText(arrowText, centerX, centerY);
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    downArrow.arrowColor = "#FFCC99";
                                    downArrow.requestPaint();
                                }

                                onExited: {
                                    downArrow.arrowColor = "white";
                                    downArrow.requestPaint();
                                }

                                onClicked: {
                                    console.log("Down arrow clicked");
                                }
                            }
                        }
                    Canvas {
                            id: downArrow3
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J4-"
                            property color textColor: "black" // Color of the text

                            onPaint: {
                                var ctx = getContext("2d");
                                ctx.clearRect(0, 0, width, height);

                                ctx.beginPath();
                                ctx.moveTo(0, 0);
                                ctx.lineTo(width, 0);
                                ctx.lineTo(width / 2, height);
                                ctx.closePath();

                                ctx.fillStyle = arrowColor;
                                ctx.fill();
                                // Add the text
                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                // Calculate the center position of the triangle
                                var centerX = width / 2;
                                var centerY = height / 2-20;

                                ctx.fillText(arrowText, centerX, centerY);
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true

                                onEntered: {
                                    downArrow3.arrowColor = "#FFCC99";
                                    downArrow3.requestPaint();
                                }

                                onExited: {
                                    downArrow3.arrowColor = "white";
                                    downArrow3.requestPaint();
                                }

                                onClicked: {
                                    console.log("Down arrow clicked");
                                }
                            }
                        }

                    }
                Canvas {
                        id: upArrowLastStep
                        x:0.1*controllRectangle.width-65+0.6*controllRectangle.width+0.08*controllRectangle.width
                        y:joy1_2.height+joy1_2.implicitHeight
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "Y+"
                        property color textColor: "black" // Color of the text
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            ctx.beginPath();
                            ctx.moveTo(width / 2, 0);
                            ctx.lineTo(0, height);
                            ctx.lineTo(width, height);
                            ctx.closePath();

                            ctx.fillStyle = arrowColor;
                            ctx.fill();
                            // Add the text
                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            // Calculate the center position of the triangle
                            var centerX = width / 2;
                            var centerY = height / 2+20;

                            ctx.fillText(arrowText, centerX, centerY);
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                upArrowLastStep.arrowColor = "#FFCC99";
                                upArrowLastStep.requestPaint();
                            }

                            onExited: {
                                upArrowLastStep.arrowColor = "white";
                                upArrowLastStep.requestPaint();
                            }

                            onClicked: {
                                console.log("Down arrow clicked");
                            }
                        }
                    }
                Canvas {
                        id: downArrowLastStep
                        x:0.1*controllRectangle.width-65+0.6*controllRectangle.width+0.08*controllRectangle.width
                        y:joy1_2.height+joy1_2.implicitHeight+0.084*controllRectangle.width*2
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "Y-"
                        property color textColor: "black" // Color of the text

                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            ctx.beginPath();
                            ctx.moveTo(0, 0);
                            ctx.lineTo(width, 0);
                            ctx.lineTo(width / 2, height);
                            ctx.closePath();

                            ctx.fillStyle = arrowColor;
                            ctx.fill();
                            // Add the text
                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            // Calculate the center position of the triangle
                            var centerX = width / 2;
                            var centerY = height / 2-20;

                            ctx.fillText(arrowText, centerX, centerY);
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                downArrowLastStep.arrowColor = "#FFCC99";
                                downArrowLastStep.requestPaint();
                            }

                            onExited: {
                                downArrowLastStep.arrowColor = "white";
                                downArrowLastStep.requestPaint();
                            }

                            onClicked: {
                                console.log("Down arrow clicked");
                            }
                        }
                    }
                Canvas {
                        id: upArrowLastStepZ
                        x:0.1*controllRectangle.width-65+0.6*controllRectangle.width+0.08*controllRectangle.width*3+10
                        y:joy1_2.height+joy1_2.implicitHeight+0.084*controllRectangle.width/2-5
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "Z+"
                        property color textColor: "black" // Color of the text
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            ctx.beginPath();
                            ctx.moveTo(width / 2, 0);
                            ctx.lineTo(0, height);
                            ctx.lineTo(width, height);
                            ctx.closePath();

                            ctx.fillStyle = arrowColor;
                            ctx.fill();
                            // Add the text
                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            // Calculate the center position of the triangle
                            var centerX = width / 2;
                            var centerY = height / 2+20;

                            ctx.fillText(arrowText, centerX, centerY);
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                upArrowLastStepZ.arrowColor = "#FFCC99";
                                upArrowLastStepZ.requestPaint();
                            }

                            onExited: {
                                upArrowLastStepZ.arrowColor = "white";
                                upArrowLastStepZ.requestPaint();
                            }

                            onClicked: {
                                console.log("Down arrow clicked");
                            }
                        }
                    }
                Canvas {
                        id: downArrowLastStepZ
                        x:0.1*controllRectangle.width-65+0.6*controllRectangle.width+0.08*controllRectangle.width*3+10
                        y:joy1_2.height+joy1_2.implicitHeight+0.084*controllRectangle.width*3/2+5
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "Z-"
                        property color textColor: "black" // Color of the text

                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, width, height);

                            ctx.beginPath();
                            ctx.moveTo(0, 0);
                            ctx.lineTo(width, 0);
                            ctx.lineTo(width / 2, height);
                            ctx.closePath();

                            ctx.fillStyle = arrowColor;
                            ctx.fill();
                            // Add the text
                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial"; // Adjust the font size and style as needed
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            // Calculate the center position of the triangle
                            var centerX = width / 2;
                            var centerY = height / 2-20;

                            ctx.fillText(arrowText, centerX, centerY);
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                downArrowLastStepZ.arrowColor = "#FFCC99";
                                downArrowLastStepZ.requestPaint();
                            }

                            onExited: {
                                downArrowLastStepZ.arrowColor = "white";
                                downArrowLastStepZ.requestPaint();
                            }

                            onClicked: {
                                console.log("Down arrow clicked");
                            }
                        }
                    }
            }
        }
    }
}
