import QtQuick

Window {
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

                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        home.color="black"
                                        shadowSetting.color="#6C757D"
                                        textHome.color="white"
                                    }else{
                                        home.color="#6C757D"
                                        shadowSetting.color="black"
                                        textHome.color="white"
                                    }
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

                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        moveSLI.color="black"
                                        shadowSLI.color="#6C757D"

                                    }else{
                                        moveSLI.color="#6C757D"
                                        shadowSLI.color="black"

                                    }
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

                                onHoveredChanged: {
                                    if(containsMouse==true){
                                        moveCI.color="black"
                                        shadowCI.color="#6C757D"

                                    }else{
                                        moveCI.color="#6C757D"
                                        shadowCI.color="black"

                                    }
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
                id: controllRectangle
                color: "#252525"
                x: 4 / 1423 * Screen.width
                y: settingRectangle.y + settingRectangle.height + 4 / 800 * Screen.height
                width: 470 / 1423 * Screen.width
                height: Screen.height - (settingRectangle.y + settingRectangle.height + 2 * 4 / 800 * Screen.height)
                border.color: "white"
                border.width: 1.5 / 1423 * Screen.width
                radius: 10

                Text{
                    id:joy1
                    text: "JOY 1"
                    color: "white"
                    x:0.15*controllRectangle.width
                    y:0.05*controllRectangle.height
                    font.family: "Helvetica"
                    font.pointSize: 20
                    font.bold: true
                }

                Canvas {
                        id: leftArrow
                        width: 0.15*controllRectangle.width
                        height: 0.15*controllRectangle.height
                        x: joy1.x+joy1.implicitWidth/2-leftArrow.width-10
                        y:joy1.y+joy1.implicitHeight+10
                        property color arrowColor: "white"

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
                        }
                }
            }


            Rectangle{
                id:positionRectangle
                color:"#252525"
                x:settingRectangle.x+settingRectangle.width+4/1423*Screen.width
                y:simulationRectangle.y+simulationRectangle.height+4/800*Screen.height
                width: Screen.width-(settingRectangle.x+settingRectangle.width+4/1423*Screen.width+4/1423*Screen.width)
                height: Screen.height-(simulationRectangle.y+simulationRectangle.height+2*4/800*Screen.height)
                border.color: "white"
                border.width: 1.5/1423*Screen.width
                radius: 10
            }
        }
    }
}
