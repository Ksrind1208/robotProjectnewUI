import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Data 1.0
import Data1 1.0
Window {
    id: root
    // w:1423
    // h:800
    width: Screen.width
    height: Screen.height
    visible: true
    property QtObject curPosition: QtObject { property double x: 0.01; property double y: 7.33; property double z: 7.46 }
    property QtObject curAngle: QtObject { property double q1: 90; property double q2: 20; property double q3: 65; property double q4: 5 }
    title: qsTr("Robot Project")

    Item {
        id: secondScreen
        visible: true
        anchors.fill: parent

        Rectangle{
            id:container
            color:"#003366"
            anchors.fill: parent

            // Image {
            //     id: borderImage
            //     source: "file:///D:/File_code/Qt/backgroundColor.png"
            //     anchors.fill: parent
            // }

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

                                    ctx.clearRect(0, 0, width, height);

                                    ctx.fillStyle = "#6C757D";
                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;

                                    var houseWidth = width / 3;
                                    var houseHeight = height / 3;
                                    var houseX = (width - houseWidth) / 2.5;
                                    var houseY = (height - houseHeight) / 1.5;

                                    var roofWidth = houseWidth * 2;
                                    var roofHeight = houseHeight;


                                    var roofX1 = (width - roofWidth) / 2;
                                    var roofY1 = houseY;


                                    ctx.strokeRect(houseX, houseY, houseWidth*1.4, houseHeight*1.2);


                                    ctx.beginPath();
                                    ctx.moveTo(roofX1, roofY1);
                                    ctx.lineTo(roofX1 + roofWidth / 2, roofY1 - roofHeight);
                                    ctx.lineTo(roofX1 + roofWidth, roofY1);
                                    ctx.closePath();
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mouseHome
                                anchors.fill: parent
                                hoverEnabled:true

                                property int mouseX1: 0
                                property int mouseY1: 0

                                onPositionChanged: (mouse)=>{
                                    mouseX1=mouse.x;
                                    mouseY1=mouse.y;
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
                                    x: mouseHome.mouseX1 + 10
                                    y: mouseHome.mouseY1 + 10
                                    width:textHome.implicitWidth+10
                                    height:textHome.implicitHeight+10
                                }

                                onClicked: {
                                    //myRobot.writeToSerialPort("home:");
                                    //serialPort.writeToSerialPort("home:");
                                    //myRobot.writeToSerialPort("home:");
                                    myRobot.home("home:");

                                    //myRobot.writeToSerialPort("q:90;20;50;5");
                                    myRobot.khongGianKhop(90,20,65,5,curAngle,curPosition);
                                    // myRobot.khongGianThaoTac(8, 0, 0, curAngle, curPosition);

                                    // console.log(myRobot.l1+"/"+myRobot.l2+"/"+myRobot.l3);
                                    // console.log(root.curAngle.q1+"/"+root.curAngle.q2.toFixed(2)+"/"+root.curAngle.q3+"/"+root.curAngle.q4);
                                }
                            }



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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;


                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;


                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY - lineLength);
                                    ctx.stroke();

                                    ctx.beginPath();
                                    ctx.moveTo(centerX - lineLength, centerY + lineLength);
                                    ctx.lineTo(centerX + lineLength, centerY + lineLength);
                                    ctx.stroke();


                                    ctx.beginPath();
                                    ctx.arc(centerX - lineLength, centerY + lineLength, lineLength , 0, -Math.PI / 4, true);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mousemoveJoint
                                anchors.fill: parent
                                hoverEnabled:true

                                property int mouseX2: 0
                                property int mouseY2: 0

                                onPositionChanged: (mouse)=>{
                                    mouseX2=mouse.x;
                                    mouseY2=mouse.y;
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
                                    windowmoveJoint.visible=true
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveJoint
                                        text:"Di chuyển theo góc"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveJoint.containsMouse
                                    x: mousemoveJoint.mouseX2 + 10
                                    y: mousemoveJoint.mouseY2 + 10
                                    width:textmoveJoint.implicitWidth+10
                                    height:textmoveJoint.implicitHeight+10
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;


                                    var cubeSize = Math.min(width, height) / 2;
                                    var startX = (width - cubeSize) / 3.2;
                                    var startY = (height - cubeSize) / 1.3;


                                    ctx.beginPath();
                                    ctx.rect(startX, startY, cubeSize, cubeSize);
                                    ctx.stroke();


                                    ctx.beginPath();
                                    ctx.moveTo(startX, startY);
                                    ctx.lineTo(startX + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize, startY);
                                    ctx.closePath();
                                    ctx.stroke();


                                    ctx.beginPath();
                                    ctx.moveTo(startX + cubeSize, startY);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY - cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize + cubeSize / 2, startY + cubeSize / 2);
                                    ctx.lineTo(startX + cubeSize, startY + cubeSize);
                                    ctx.closePath();
                                    ctx.stroke();


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

                                property int mouseX3: 0
                                property int mouseY3: 0
                                onPositionChanged: (mouse)=>{
                                    mouseX3=mouse.x;
                                    mouseY3=mouse.y;
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

                                    windowmoveTCP.visible = true;
                                }
                                ToolTip {
                                    Text{
                                        id:textmoveTCP
                                        text:"Di chuyển theo tọa độ"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mousemoveTCP.containsMouse
                                    x: mousemoveTCP.mouseX3 + 10
                                    y: mousemoveTCP.mouseY3 + 10
                                    width:textmoveTCP.implicitWidth+10
                                    height:textmoveTCP.implicitHeight+10
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;


                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;


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

                                property int mouseX4: 0
                                property int mouseY4: 0

                                onPositionChanged: (mouse)=>{
                                    mouseX4=mouse.x;
                                    mouseY4=mouse.y;
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
                                    x: mousemoveSLI.mouseX4 + 10
                                    y: mousemoveSLI.mouseY4 + 10
                                    width:textmoveSLI.implicitWidth+10
                                    height:textmoveSLI.implicitHeight+10
                                }

                                onClicked: {
                                    windowmoveSLI.visible=true;
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;


                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;


                                    ctx.beginPath();
                                    ctx.arc(centerX , centerY , lineLength , 0, -2*Math.PI, true);
                                    ctx.stroke();
                                }
                            }

                            MouseArea{
                                id:mousemoveCI
                                anchors.fill: parent
                                hoverEnabled:true

                                property int mouseX5: 0
                                property int mouseY5: 0
                                onPositionChanged: (mouse)=>{
                                    mouseX5=mouse.x;
                                    mouseY5=mouse.y;
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
                                    x: mousemoveCI.mouseX5 + 10
                                    y: mousemoveCI.mouseY5 + 10
                                    width:textmoveCI.implicitWidth+10
                                    height:textmoveCI.implicitHeight+10
                                }

                                onClicked: {
                                    windowmoveCI.visible=true;
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.fillStyle = "white";
                                    ctx.lineWidth = 3;


                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var iconSize = Math.min(width, height) / 3;

                                    var handRadius = iconSize / 2;
                                    ctx.beginPath();
                                    ctx.arc(centerX, centerY - handRadius / 2, handRadius, 0, 2 * Math.PI);
                                    ctx.stroke();


                                    ctx.beginPath();
                                    ctx.moveTo(centerX - handRadius / 2, centerY - handRadius / 0.5);
                                    ctx.lineTo(centerX - handRadius / 2, centerY - handRadius / 0.3);
                                    ctx.moveTo(centerX, centerY - handRadius / 0.55);
                                    ctx.lineTo(centerX, centerY - handRadius / 0.35);
                                    ctx.moveTo(centerX + handRadius / 2, centerY - handRadius / 0.5);
                                    ctx.lineTo(centerX + handRadius / 2, centerY - handRadius / 0.3);
                                    ctx.stroke();


                                    var parallelogramWidth = iconSize * 0.8;
                                    var parallelogramHeight = parallelogramWidth * 0.6;

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

                                property int mouseX6: 0
                                property int mouseY6: 0
                                onPositionChanged: (mouse)=>{
                                    mouseX6=mouse.x;
                                    mouseY6=mouse.y;
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
                                    windowDragandDrop.visible=true;
                                }
                                ToolTip {
                                    Text{
                                        id:textdraganddrop
                                        text:"Gắp thả vật"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseDragandDrop.containsMouse
                                    x: mouseDragandDrop.mouseX6 + 10
                                    y: mouseDragandDrop.mouseY6 + 10
                                    width:textdraganddrop.implicitWidth+10
                                    height:textdraganddrop.implicitHeight+10
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.fillStyle = "white";
                                    ctx.lineWidth = 2;


                                    var iconSize = Math.min(width, height) / 2;
                                    var centerX = width / 2;
                                    var centerY = height / 2;


                                    ctx.beginPath();
                                    ctx.arc(centerX, centerY, iconSize / 1.5, 0, 2 * Math.PI);
                                    ctx.stroke();

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

                                property int mouseX7: 0
                                property int mouseY7: 0
                                onPositionChanged: (mouse)=>{
                                    mouseX7=mouse.x;
                                    mouseY7=mouse.y;
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
                                    windowTeaching.visible=true;
                                }
                                ToolTip {
                                    Text{
                                        id:textSimulation
                                        text:"Teaching"
                                        color:"black"
                                        font.pointSize: 24
                                    }
                                    visible: mouseSimulation.containsMouse
                                    x: mouseSimulation.mouseX7 + 10
                                    y: mouseSimulation.mouseY7 + 10
                                    width:textSimulation.implicitWidth+10
                                    height:textSimulation.implicitHeight+10
                                }
                            }


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


                                    ctx.clearRect(0, 0, width, height);


                                    ctx.strokeStyle = "white";
                                    ctx.lineWidth = 2;


                                    var centerX = width / 2;
                                    var centerY = height / 2;
                                    var lineLength = Math.min(width, height) / 3;


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

                                property int mouseX8: 0
                                property int mouseY8: 0
                                onPositionChanged: (mouse)=>{
                                    mouseX8=mouse.x;
                                    mouseY8=mouse.y;
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
                                    x: mouseQuit.mouseX8 + 10
                                    y: mouseQuit.mouseY8 + 10
                                    width:textQuit.implicitWidth+10
                                    height:textQuit.implicitHeight+10
                                }
                            }


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
                            Row{
                                spacing:5
                                anchors.centerIn: parent
                                Text {
                                    text: "Q1:"
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:q1
                                    text: root.curAngle.q1
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }

                        }
                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "Q2: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:q2
                                    text: root.curAngle.q2
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "Q3: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:q3
                                    text:curAngle.q3
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "Q4: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:q4
                                    text: root.curAngle.q4
                                    color: "black"
                                    font.pointSize: 20
                                }
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
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "x: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:x
                                    text: root.curPosition.x
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "y: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:y
                                    text: root.curPosition.y
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }
                        }

                        Rectangle {
                            width: 0.3*positionRectangle.width
                            height: 0.08*positionRectangle.height
                            border.color: "white"
                            border.width: 2/1423*Screen.width
                            radius: 5
                            Row{
                                spacing: 5
                                anchors.centerIn: parent
                                Text {
                                    text: "z: "
                                    color: "black"
                                    font.pointSize: 20
                                }
                                Text {
                                    id:z
                                    text: root.curPosition.z
                                    color: "black"
                                    font.pointSize: 20
                                }
                            }
                        }

                        // Rectangle{
                        //     id:save
                        //     width: 88/1423*Screen.width
                        //     height: 88/800*Screen.height
                        //     color:"#6C757D"
                        //     radius: 10
                        //     Text{
                        //         text:"SAVE"
                        //         color:"white"
                        //         font.pointSize: 24
                        //         anchors.centerIn: parent
                        //     }

                        //     MouseArea{
                        //         id:mouseSave
                        //         anchors.fill: parent
                        //         hoverEnabled:true

                        //         property int mouseX9: 0
                        //         property int mouseY9: 0

                        //         onPositionChanged: (mouse)=>{
                        //             mouseX9=mouse.x;
                        //             mouseY9=mouse.y;
                        //         }

                        //         onHoveredChanged: {
                        //             if(containsMouse==true){
                        //                 save.color="black"
                        //                 shadowSave.color="#6C757D"
                        //             }else{
                        //                 save.color="#6C757D"
                        //                 shadowSave.color="black"
                        //             }
                        //         }
                        //         ToolTip {
                        //             Text{
                        //                 id:textSave
                        //                 text:"Lưu vị trí hiện tại"
                        //                 color:"black"
                        //                 font.pointSize: 24
                        //             }
                        //             visible: mouseSave.containsMouse
                        //             x: mouseSave.mouseX9 + 10
                        //             y: mouseSave.mouseY9 + 10
                        //             width:textSave.implicitWidth+10
                        //             height:textSave.implicitHeight+10
                        //         }

                        //         onClicked: {

                        //         }
                        //     }



                        //     Rectangle {
                        //         id:shadowSave
                        //         width: save.width
                        //         height: save.height
                        //         radius: 10
                        //         color: "black"
                        //         opacity: 0.3
                        //         anchors.centerIn: save
                        //         anchors.horizontalCenterOffset: 5
                        //         anchors.verticalCenterOffset: 5
                        //     }
                        // }
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
                property real curAngleQ1: root.curAngle.q1
                property real curAngleQ2: root.curAngle.q2
                property real curAngleQ3: root.curAngle.q3
                property real curPositionX: root.curPosition.x
                property real curPositionY: root.curPosition.y
                property real curPositionZ: root.curPosition.z


                Canvas {
                    id: yOzCanvas
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width / 2 - 5

                    onPaint: {
                        var ctx = yOzCanvas.getContext("2d");
                        ctx.clearRect(0, 0, yOzCanvas.width, yOzCanvas.height);


                        ctx.strokeStyle = "white";
                        ctx.lineWidth = 2;


                        ctx.beginPath();
                        ctx.moveTo(0, yOzCanvas.height / 2);
                        ctx.lineTo(yOzCanvas.width, yOzCanvas.height / 2);
                        ctx.stroke();


                        ctx.beginPath();
                        ctx.moveTo(yOzCanvas.width / 2, 0);
                        ctx.lineTo(yOzCanvas.width / 2, yOzCanvas.height);
                        ctx.stroke();


                        ctx.fillStyle = "white";


                        var stepY = (yOzCanvas.width) / 40;
                        for (var j = -18; j <= 18; j += 2) {
                            var y = yOzCanvas.width / 2 + j * stepY;
                            ctx.beginPath();
                            ctx.moveTo(y, yOzCanvas.height / 2 - 3);
                            ctx.lineTo(y, yOzCanvas.height / 2 + 3);
                            ctx.stroke();

                            if (j !== 0) {
                                ctx.fillText(j.toString(), y - 5, yOzCanvas.height / 2 + 15);
                            }
                        }


                        var stepZ = yOzCanvas.height / 40;
                        for (var i = -18; i <= 18; i += 2) {
                            var z = yOzCanvas.height / 2 - i * stepZ;
                            ctx.beginPath();
                            ctx.moveTo(yOzCanvas.width / 2 - 3, z);
                            ctx.lineTo(yOzCanvas.width / 2 + 3, z);
                            ctx.stroke();

                            if (i !== 0) {
                                ctx.fillText(i.toString(), yOzCanvas.width / 2 + 10, z + 5);
                            }
                        }



                        ctx.strokeStyle = "red";
                        ctx.lineWidth=30;
                        ctx.beginPath();
                        ctx.moveTo(yOzCanvas.width / 2, yOzCanvas.height / 2);
                        ctx.lineTo(yOzCanvas.width / 2, yOzCanvas.height / 2 -stepZ * 6.5);
                        ctx.stroke();

                        ctx.strokeStyle = "green";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo(yOzCanvas.width / 2, yOzCanvas.height / 2 -stepZ * 6.5);
                        ctx.lineTo(yOzCanvas.width / 2+stepZ*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.sin(root.curAngle.q1*Math.PI/180), yOzCanvas.height / 2 -stepZ * 6.5-8*stepZ*Math.sin((90-root.curAngle.q2)*Math.PI/180));
                        ctx.stroke();

                        ctx.strokeStyle = "blue";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo(yOzCanvas.width / 2+stepZ*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.sin(root.curAngle.q1*Math.PI/180), yOzCanvas.height / 2 -stepZ * 6.5-8*stepZ*Math.sin((90-root.curAngle.q2)*Math.PI/180));
                        ctx.lineTo(yOzCanvas.width/2+stepZ*root.curPosition.y, yOzCanvas.height/2-stepZ*(root.curPosition.z));
                        ctx.stroke();

                        ctx.strokeStyle = "yellow";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo(yOzCanvas.width/2+stepZ*root.curPosition.y, yOzCanvas.height/2-stepZ*root.curPosition.z);
                        ctx.lineTo(yOzCanvas.width/2+stepZ*root.curPosition.y+15, yOzCanvas.height/2-stepZ*root.curPosition.z);
                        ctx.stroke();
                    }

                    Component.onCompleted: {
                        yOzCanvas.requestPaint();
                    }
                }



                Canvas {
                    id: xOyCanvas
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: parent.width / 2 -5

                    property real curAngleQ11: root.curAngle.q1
                    property real curPositionXX:root.curPosition.x
                    property real curPositionYY: root.curPosition.y
                    onPaint: {
                        var ctx = xOyCanvas.getContext("2d");
                        ctx.clearRect(0, 0, xOyCanvas.width, xOyCanvas.height);


                        ctx.strokeStyle = "white";
                        ctx.lineWidth = 2;


                        ctx.beginPath();
                        ctx.moveTo(0, xOyCanvas.height / 2);
                        ctx.lineTo(xOyCanvas.width, xOyCanvas.height / 2);
                        ctx.stroke();


                        ctx.beginPath();
                        ctx.moveTo(xOyCanvas.width / 2, 0);
                        ctx.lineTo(xOyCanvas.width / 2, xOyCanvas.height);
                        ctx.stroke();


                        ctx.fillStyle = "white";


                        var stepY = (xOyCanvas.width) / 40;
                        for (var j = -18; j <= 18; j += 2) {
                            var y = xOyCanvas.width / 2 + j * stepY;
                            ctx.beginPath();
                            ctx.moveTo(y, xOyCanvas.height / 2 - 3);
                            ctx.lineTo(y, xOyCanvas.height / 2 + 3);
                            ctx.stroke();

                            if (j !== 0) {
                                ctx.fillText(j.toString(), y - 5, xOyCanvas.height / 2 + 15);
                            }
                        }


                        var stepX = xOyCanvas.height / 40;
                        for (var i = 18; i >= -18; i -= 2) {
                            var x = xOyCanvas.height/2 + i * stepX;
                            ctx.beginPath();
                            ctx.moveTo(xOyCanvas.width / 2 - 3, x);
                            ctx.lineTo(xOyCanvas.width / 2 + 3, x);
                            ctx.stroke();

                            if (i !== 0) {
                                ctx.fillText(i.toString(), xOyCanvas.width / 2 + 10, x + 5);
                            }
                        }

                        ctx.beginPath();
                        ctx.fillStyle = "red";
                        ctx.moveTo(xOyCanvas.width/2,xOyCanvas.height/2);
                        ctx.arc(xOyCanvas.width/2,xOyCanvas.height/2,2*stepY*0.75,0,-2*Math.PI,true);
                        ctx.lineTo(xOyCanvas.width/2,xOyCanvas.height/2);
                        ctx.fill();

                        ctx.strokeStyle = "green";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo(xOyCanvas.width/2,xOyCanvas.height/2);
                        ctx.lineTo((yOzCanvas.width / 2+stepX*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.sin(root.curAngle.q1*Math.PI/180)),yOzCanvas.height/2+stepX*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.cos(root.curAngle.q1*Math.PI/180));
                        ctx.stroke();

                        ctx.strokeStyle = "blue";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo((yOzCanvas.width / 2+stepX*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.sin(root.curAngle.q1*Math.PI/180)),yOzCanvas.height/2+stepX*8*Math.cos(Math.PI*(90-root.curAngle.q2)/180)*Math.cos(root.curAngle.q1*Math.PI/180));
                        ctx.lineTo(xOyCanvas.width/2+stepX*root.curPosition.y,xOyCanvas.height/2+stepX*root.curPosition.x);
                        ctx.stroke();

                        ctx.strokeStyle = "yellow";
                        ctx.lineWidth=15;
                        ctx.beginPath();
                        ctx.moveTo(xOyCanvas.width/2+stepX*root.curPosition.y,xOyCanvas.height/2+stepX*root.curPosition.x);
                        ctx.lineTo(xOyCanvas.width/2+stepX*root.curPosition.y+15,xOyCanvas.height/2+stepX*root.curPosition.x);
                        ctx.stroke();

                    }

                    Component.onCompleted: {
                        xOyCanvas.requestPaint();
                    }
                }

                onCurAngleQ1Changed: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }
                onCurAngleQ2Changed: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }
                onCurAngleQ3Changed: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }
                onCurPositionXChanged: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }
                onCurPositionYChanged: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }
                onCurPositionZChanged: {
                    xOyCanvas.requestPaint();
                    yOzCanvas.requestPaint();
                }

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
                    y:0.05*controllRectangle.height+joy1_2.implicitHeight+95
                    spacing:0.03*controllRectangle.width
                    Row{
                        spacing:0.08*controllRectangle.width
                        Canvas {
                            id: leftArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width

                            property color arrowColor: "white"
                            property string arrowText: "J1-"
                            property color textColor: "black"
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


                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    if((Number(root.curAngle.q1)-10)<0){
                                        console.log(Number(root.curAngle.q1)-10<0);
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+0+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(0,Number(root.curAngle.q2),Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                    }else{
                                        serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1)-10)+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1)-10,Number(root.curAngle.q2),Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                        console.log("Left arrow clicked");
                                    }
                                }
                            }
                        }
                        Canvas {
                            id: rightArrow
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J1+"
                            property color textColor: "black"
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


                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    if((Number(root.curAngle.q1)+10)>180){
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+180+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(180,Number(root.curAngle.q2),Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                    }else{
                                        serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1)+10)+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1)+10,Number(root.curAngle.q2),Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                        console.log("Right arrow clicked");
                                    }
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
                                property color textColor: "black"
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


                                    ctx.fillStyle = textColor;
                                    ctx.font = "bold 35px Arial";
                                    ctx.textAlign = "center";
                                    ctx.textBaseline = "middle";


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
                                        serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+5);
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),Number(root.curAngle.q3),5,curAngle,curPosition);
                                    }
                                }
                            }
                        Canvas {
                            id: rightArrow4
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J4+"
                            property color textColor: "black"
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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

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
                                    serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+Number(root.curAngle.q2)+";"+Number(root.curAngle.q3)+";"+90);
                                    myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),Number(root.curAngle.q3),90,curAngle,curPosition);

                                }
                            }
                        }
                    }
                }
                Row{
                    x:0.1*controllRectangle.width-65+0.6*controllRectangle.width
                    y:0.05*controllRectangle.height+joy1_2.implicitHeight+95
                    spacing:0.08*controllRectangle.width
                    Canvas {
                            id: leftArrowLastStep
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "Y-"
                            property color textColor: "black"
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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    myRobot.khongGianThaoTac(Number(root.curPosition.x),Number(root.curPosition.y)-1,Number(root.curPosition.z),curAngle,curPosition);
                                    //serialPort.writeToSerialPort("kg:"+(Number(root.curPosition.x))+";"+(Number(root.curPosition.y)-1)+";"+Number(root.curPosition.z));
                                    serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
                                    console.log("left arrow clicked");
                                }
                            }
                        }
                    Canvas {
                        id: rightArrowLastStep
                        width: 0.08*controllRectangle.width
                        height: 0.08*controllRectangle.width
                        property color arrowColor: "white"
                        property string arrowText: "Y+"
                        property color textColor: "black"
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


                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";


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
                                myRobot.khongGianThaoTac(Number(root.curPosition.x),Number(root.curPosition.y)+1,Number(root.curPosition.z),curAngle,curPosition);
                                //serialPort.writeToSerialPort("kg:"+(Number(root.curPosition.x))+";"+(Number(root.curPosition.y)+1)+";"+Number(root.curPosition.z));
                                serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
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
                            property color textColor: "black"
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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

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
                                    if((Number(root.curAngle.q2)-10)<0){
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+0+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),0,Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                    }else{
                                        serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1))+";"+(Number(root.curAngle.q2)-10)+";"+Number(root.curAngle.q3)+";"+(Number(root.curAngle.q4)));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2)-10,Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                        console.log("Up arrow clicked");
                                    }
                                }
                            }
                        }
                    Canvas {
                            id: upArrow3
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J3+"
                            property color textColor: "black"
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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    if((Number(root.curAngle.q3)+10)>140){
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+Number(root.curAngle.q2)+";"+140+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),140,Number(root.curAngle.q4),curAngle,curPosition);

                                    }else{
                                        serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1))+";"+(Number(root.curAngle.q2))+";"+(Number(root.curAngle.q3)+10)+";"+(Number(root.curAngle.q4)));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),Number(root.curAngle.q3)+10,Number(root.curAngle.q4),curAngle,curPosition);
                                        console.log("Up arrow clicked");
                                    }
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
                            property color textColor: "black"

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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    if((Number(root.curAngle.q2)+10)>90){
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+90+";"+Number(root.curAngle.q3)+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),90,Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);

                                    }else{
                                        serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1))+";"+(Number(root.curAngle.q2)+10)+";"+(Number(root.curAngle.q3))+";"+(Number(root.curAngle.q4)));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2)+10,Number(root.curAngle.q3),Number(root.curAngle.q4),curAngle,curPosition);
                                        console.log("Down arrow clicked");
                                    }
                                }
                            }
                        }
                    Canvas {
                            id: downArrow3
                            width: 0.08*controllRectangle.width
                            height: 0.08*controllRectangle.width
                            property color arrowColor: "white"
                            property string arrowText: "J3-"
                            property color textColor: "black"

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

                                ctx.fillStyle = textColor;
                                ctx.font = "bold 35px Arial";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";


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
                                    if((Number(root.curAngle.q3)-10)<0){
                                        errormoveAngle.visible=true;
                                        serialPort.writeToSerialPort("q:"+Number(root.curAngle.q1)+";"+Number(root.curAngle.q2)+";"+10+";"+Number(root.curAngle.q4));
                                        myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),10,Number(root.curAngle.q4),curAngle,curPosition);

                                    }
                                    serialPort.writeToSerialPort("q:"+(Number(root.curAngle.q1))+";"+(Number(root.curAngle.q2))+";"+(Number(root.curAngle.q3)-10)+";"+(Number(root.curAngle.q4)));
                                    myRobot.khongGianKhop(Number(root.curAngle.q1),Number(root.curAngle.q2),Number(root.curAngle.q3)-10,Number(root.curAngle.q4),curAngle,curPosition);

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
                        property string arrowText: "X-"
                        property color textColor: "black"
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

                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";


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
                                myRobot.khongGianThaoTac(Number(root.curPosition.x)-1,Number(root.curPosition.y),Number(root.curPosition.z),curAngle,curPosition);
                                //serialPort.writeToSerialPort("kg:"+(Number(root.curPosition.x)-1)+";"+(Number(root.curPosition.y))+";"+Number(root.curPosition.z));
                                serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
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
                        property string arrowText: "X+"
                        property color textColor: "black"

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

                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";


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
                                myRobot.khongGianThaoTac(Number(root.curPosition.x)+1,Number(root.curPosition.y),Number(root.curPosition.z),curAngle,curPosition);
                               //serialPort.writeToSerialPort("kg:"+(Number(root.curPosition.x)+1)+";"+(Number(root.curPosition.y))+";"+Number(root.curPosition.z));
                                serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
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
                        property color textColor: "black"
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

                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

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
                                myRobot.khongGianThaoTac(Number(root.curPosition.x),Number(root.curPosition.y),Number(root.curPosition.z)+1,curAngle,curPosition);
                                //serialPort.writeToSerialPort("kg:"+Number(root.curPosition.x)+";"+Number(root.curPosition.y)+";"+(Number(root.curPosition.z)+1));
                                serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
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
                        property color textColor: "black"

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

                            ctx.fillStyle = textColor;
                            ctx.font = "bold 35px Arial";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";


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
                                myRobot.khongGianThaoTac(Number(root.curPosition.x),Number(root.curPosition.y),Number(root.curPosition.z)-1,curAngle,curPosition);
                                //serialPort.writeToSerialPort("kg:"+Number(root.curPosition.x)+";"+Number(root.curPosition.y)+";"+(Number(root.curPosition.z)-1));
                                serialPort.writeToSerialPort("q:"+root.curAngle.q1+";"+root.curAngle.q2+";"+root.curAngle.q3+";"+root.curAngle.q4);
                                console.log("Down arrow clicked");
                            }
                        }
                    }
            }
        }
    }

    Window {
        id: windowmoveJoint
        visible: false
        width: 800/1423*Screen.width
        height:750/800*Screen.height
        Rectangle {
            width: 800/1423*Screen.width
            height: 750/800*Screen.height
            radius: 10
            color: "white"
            border.color: "gray"
            border.width: 2/1423*Screen.width
            anchors.centerIn: parent


            Rectangle {
                width: 800/1423*Screen.width
                height: 750/800*Screen.height
                radius: 10
                color: "black"
                opacity: 0.2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 5
                anchors.verticalCenterOffset: 5
            }

            Column {
                spacing: 40/800*Screen.height
                anchors.centerIn: parent
                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Q1:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        property string valueQ1: ""
                        id: q1Field
                        placeholderText: "Enter Q1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                        onTextChanged: {
                            valueQ1=q1Field.text;
                            if(Number(valueQ1)>=0 && Number(valueQ1)<=180 ){
                                textQ1.color="green"
                            }else{
                                textQ1.color="red"
                            }
                        }
                    }
                    Text{
                        id:textQ1
                        text:"0<=Q1<=180"
                        color:"green";
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 25
                    }

                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Q2:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: q2Field
                        property string valueQ2: ""
                        placeholderText: "Enter Q2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                        onTextChanged: {
                            valueQ2=q2Field.text;
                            if(Number(valueQ2)>=0 && Number(valueQ2)<=90){
                                textQ2.color="green"
                            }else{
                                textQ2.color="red";
                            }
                        }
                    }
                    Text{
                        id:textQ2
                        text:"0<=Q2<=90"
                        color:"green";
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 25
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Q3:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: q3Field
                        property string valueQ3: ""
                        placeholderText: "Enter Q3"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                        onTextChanged: {
                            valueQ3=q3Field.text;
                            if(Number(valueQ3)>=55 && Number(valueQ3)<=155){
                                textQ3.color="green"
                            }else{
                                textQ3.color="red";
                            }
                        }
                    }
                    Text{
                        id:textQ3
                        text:"55<=Q3<=155"
                        color:"red";
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 25
                    }

                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Q4:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: q4Field
                        property string valueQ4: ""
                        placeholderText: "Enter Q4"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                        onTextChanged: {
                            valueQ4=q4Field.text;
                            if(Number(valueQ4)>=5 && Number(valueQ4)<=90){
                                textQ4.color="green"
                            }else{
                                textQ4.color="red";
                            }
                        }
                    }
                    Text{
                        id:textQ4
                        text:"5<=Q4<=90"
                        color:"red";
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 25
                    }

                }

                Button {
                    text: "Move"
                    font.pixelSize: 40
                    width: 240/1423*Screen.width
                    height: 100/800*Screen.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: "#0076AE"
                        radius: 10
                    }
                    contentItem: Text {
                        text: "Move"
                        color: "white"
                        font.pixelSize: 40
                        font.bold: true
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        if(Number(q1Field.valueQ1)>=0&&Number(q1Field.valueQ1)<=180){
                            if(Number(q2Field.valueQ2)>=0&&Number(q2Field.valueQ2)<=90){
                                if(Number(q3Field.valueQ3)>=55&&Number(q3Field.valueQ3)<=155){
                                    if(Number(q4Field.valueQ4)>=5&&Number(q4Field.valueQ4)<=90){
                                        serialPort.writeToSerialPort("q:"+q1Field.text+";"+q2Field.text+";"+q3Field.text+";"+q4Field.text);
                                        myRobot.khongGianKhop(Number(q1Field.text),Number(q2Field.text),Number(q3Field.text),Number(q4Field.text),curAngle,curPosition)
                                        console.log("q:"+q1Field.text+";"+q2Field.text+";"+q3Field.text+";"+q4Field.text);
                                        windowmoveJoint.visible = false;
                                        secondScreen.visible = true;
                                    }else{
                                        errorAngle.visible=true;
                                    }
                                }else{
                                    errorAngle.visible=true;
                                }
                            }else{
                                errorAngle.visible=true;
                            }
                        }else{
                            errorAngle.visible=true;
                        }
                    }
                }
            }
        }
        Rectangle {
            id: errorAngle
            width: 400 / 1423 * Screen.width
            height: 200 / 800 * Screen.height
            radius: 10
            color: "white"
            border.color: "darkred"
            border.width: 2
            anchors.centerIn: parent
            visible: false

            Column {
                spacing: 20 / 800 * Screen.height
                anchors.centerIn: parent

                Text {
                    text: "Sai góc nhập, vui lòng nhập lại."
                    font.pixelSize: 30
                    font.bold: true
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Button {
                    text: "Nhập lại"
                    font.pixelSize: 24
                    width: 150 / 1423 * Screen.width
                    height: 50 / 800 * Screen.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: "blue"
                        radius: 10
                    }
                    contentItem: Text {
                        text: "Nhập lại"
                        color: "white"
                        font.pixelSize: 24
                        font.bold: true
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        errorAngle.visible = false
                    }
                }
            }
        }

    }
    Window {
        id: windowmoveTCP
        visible: false
        width:800/1423*Screen.width
        height:600/800*Screen.height
        Rectangle {
            width: 800/1423*Screen.width
            height: 600/800*Screen.height
            radius: 10
            color: "white"
            border.color: "gray"
            border.width: 2/1423*Screen.width
            anchors.centerIn: parent


            Rectangle {
                width: 800/1423*Screen.width
                height: 600/800*Screen.height
                radius: 10
                color: "black"
                opacity: 0.2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 5
                anchors.verticalCenterOffset: 5
            }

            Column {
                spacing: 40/800*Screen.height
                anchors.centerIn: parent

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "X:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: xField
                        placeholderText: "Enter X"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Y:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: yField
                        placeholderText: "Enter Y"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Z:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: zField
                        placeholderText: "Enter Z"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Button {
                    text: "Move"
                    font.pixelSize: 40
                    width: 240/1423*Screen.width
                    height: 100/800*Screen.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: "#0076AE"
                        radius: 10
                    }
                    contentItem: Text {
                        text: "Move"
                        color: "white"
                        font.pixelSize: 40
                        font.bold: true
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        serialPort.writeToSerialPort("kg:"+Number(xField.text)+";"+Number(yField.text)+";"+Number(zField.text));
                        myRobot.khongGianThaoTac(Number(xField.text),Number(yField.text),Number(zField.text),curAngle,curPosition);
                        console.log("kg:"+Number(xField.text)+";"+Number(yField.text)+";"+Number(zField.text));
                        windowmoveTCP.visible = false;
                        secondScreen.visible = true;
                    }
                }
            }
        }
    }

    Window {
        id: windowmoveSLI
        visible: false
        width:800/1423*Screen.width*1.3
        height:600/800*Screen.height*1.3
        Rectangle {
            width: 800/1423*Screen.width*1.3
            height: 600/800*Screen.height*1.3
            radius: 10
            color: "white"
            border.color: "gray"
            border.width: 2/1423*Screen.width
            anchors.centerIn: parent


            Rectangle {
                width: 800/1423*Screen.width*1.3
                height: 600/800*Screen.height*1.3
                radius: 10
                color: "black"
                opacity: 0.2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 5
                anchors.verticalCenterOffset: 5
            }

            Column {
                spacing: 40/800*Screen.height
                anchors.centerIn: parent

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "X:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: x1Field
                        placeholderText: "Enter X1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }

                    TextField {
                        id: x2Field
                        placeholderText: "Enter X2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Y:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: y1Field
                        placeholderText: "Enter Y1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: y2Field
                        placeholderText: "Enter Y2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Z:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: z1Field
                        placeholderText: "Enter Z"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: z2Field
                        placeholderText: "Enter Z2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Button {
                    text: "Move"
                    font.pixelSize: 40
                    width: 240/1423*Screen.width
                    height: 100/800*Screen.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: "#0076AE"
                        radius: 10
                    }
                    contentItem: Text {
                        text: "Move"
                        color: "white"
                        font.pixelSize: 40
                        font.bold: true
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        serialPort.writeToSerialPort("line:"+Number(x1Field.text)+";"+Number(y1Field.text)+";"+Number(z1Field.text)+";"+Number(x2Field.text)+";"+Number(y2Field.text)+";"+Number(z2Field.text));
                        myRobot.khongGianThaoTac(Number(x2Field.text),Number(y2Field.text),Number(z2Field.text),curAngle,curPosition);
                        // console.log("kg:"+Number(xField.text)+";"+Number(yField.text)+";"+Number(zField.text));
                        windowmoveSLI.visible = false;
                        // secondScreen.visible = true;
                    }
                }
            }
        }
    }

    Window {
        id: windowmoveCI
        visible: false
        width:800/1423*Screen.width*1.8
        height:600/800*Screen.height*1.5
        Rectangle {
            width: 800/1423*Screen.width*1.8
            height: 600/800*Screen.height*1.5
            radius: 10
            color: "white"
            border.color: "gray"
            border.width: 2/1423*Screen.width
            anchors.centerIn: parent


            Rectangle {
                width: 800/1423*Screen.width*1.8
                height: 600/800*Screen.height*1.5
                radius: 10
                color: "black"
                opacity: 0.2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 5
                anchors.verticalCenterOffset: 5
            }

            Column {
                spacing: 40/800*Screen.height
                anchors.centerIn: parent

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "X:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: x3Field
                        placeholderText: "Enter X1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }

                    TextField {
                        id: x4Field
                        placeholderText: "Enter X2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: x7Field
                        placeholderText: "Enter X3"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Y:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: y3Field
                        placeholderText: "Enter Y1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: y4Field
                        placeholderText: "Enter Y2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: y7Field
                        placeholderText: "Enter Y3"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Z:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: z3Field
                        placeholderText: "Enter Z1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: z4Field
                        placeholderText: "Enter Z2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: z7Field
                        placeholderText: "Enter Z3"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Button {
                    text: "Move"
                    font.pixelSize: 40
                    width: 240/1423*Screen.width
                    height: 100/800*Screen.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: "#0076AE"
                        radius: 10
                    }
                    contentItem: Text {
                        text: "Move"
                        color: "white"
                        font.pixelSize: 40
                        font.bold: true
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: {
                        serialPort.writeToSerialPort("circle:"+Number(x3Field.text)+";"+Number(y3Field.text)+";"+Number(z3Field.text)+";"+Number(x4Field.text)+";"+Number(y4Field.text)+";"+Number(z4Field.text)+";"+Number(x7Field.text)+";"+Number(y7Field.text)+";"+Number(z7Field.text));
                        myRobot.khongGianThaoTac(Number(x7Field.text),Number(y7Field.text),Number(z7Field.text),curAngle,curPosition);
                        // console.log("kg:"+Number(xField.text)+";"+Number(yField.text)+";"+Number(zField.text));
                        windowmoveCI.visible = false;
                        // secondScreen.visible = true;
                    }
                }
            }
        }
    }

    Window {
        id: windowDragandDrop
        visible: false
        width:800/1423*Screen.width*1.3
        height:600/800*Screen.height*1.3
        Rectangle {
            width: 800/1423*Screen.width*1.3
            height: 600/800*Screen.height*1.3
            radius: 10
            color: "white"
            border.color: "gray"
            border.width: 2/1423*Screen.width
            anchors.centerIn: parent


            Rectangle {
                width: 800/1423*Screen.width*1.3
                height: 600/800*Screen.height*1.3
                radius: 10
                color: "black"
                opacity: 0.2
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 5
                anchors.verticalCenterOffset: 5
            }

            Column {
                spacing: 40/800*Screen.height
                anchors.centerIn: parent

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "X:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: x5Field
                        text:""
                        placeholderText: "Enter X1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }

                    TextField {
                        id: x6Field
                        text:""
                        placeholderText: "Enter X2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Y:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: y5Field
                        text:""
                        placeholderText: "Enter Y1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: y6Field
                        text:""
                        placeholderText: "Enter Y2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 40/1423*Screen.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        text: "Z:"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#0076AE"
                    }
                    TextField {
                        id: z5Field
                        text:""
                        placeholderText: "Enter Z1"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                    TextField {
                        id: z6Field
                        text:""
                        placeholderText: "Enter Z2"
                        font.pixelSize: 40
                        width: 400/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#E8EAF6"
                            radius: 10
                            border.color: "#0076AE"
                        }
                    }
                }

                Row {
                    spacing: 200/1423*Screen.width
                    x:170
                    Button {
                        text: "SAVE 1"
                        font.pixelSize: 40
                        width: 240/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#0076AE"
                            radius: 10
                        }
                        contentItem: Text {
                            text: "SAVE 1"
                            color: "white"
                            font.pixelSize: 40
                            font.bold: true
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            x5Field.text=x.text;
                            y5Field.text=y.text;
                            z5Field.text=z.text;
                        }
                    }
                    Button {
                        text: "SAVE 2"
                        font.pixelSize: 40
                        width: 240/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#0076AE"
                            radius: 10
                        }
                        contentItem: Text {
                            text: "SAVE 2"
                            color: "white"
                            font.pixelSize: 40
                            font.bold: true
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            x6Field.text=x.text;
                            y6Field.text=y.text;
                            z6Field.text=z.text;
                        }
                    }
                }
                Row {
                    spacing: 200/1423*Screen.width
                    x:405

                    Button {
                        text: "START"
                        font.pixelSize: 40
                        width: 240/1423*Screen.width
                        height: 100/800*Screen.height
                        background: Rectangle {
                            color: "#0076AE"
                            radius: 10
                        }
                        contentItem: Text {
                            text: "START"
                            color: "white"
                            font.pixelSize: 40
                            font.bold: true
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            serialPort.writeToSerialPort("gap:"+x5Field.text+";"+y5Field.text+";"+z5Field.text+";"+x6Field.text+";"+y6Field.text+";"+z6Field.text);
                            myRobot.khongGianKhop(90,20,50,5,curAngle,curPosition);
                            //myRobot.gap(Number(x5Field.text),Number(y5Field.text),Number(z5Field.text),Number(x6Field.text),Number(y6Field.text),Number(z6Field.text),curAngle,curPosition);
                            windowDragandDrop.visible=false;
                        }
                    }
                }
            }
        }
    }

    Window {
        id: windowTeaching
        visible: false
        width: 800
        height: 600
        color: "white"


        property var curAngle: {
            "q1": "Angle 1",
            "q2": "Angle 2",
            "q3": "Angle 3",
            "q4": "Angle 4"
        }
        ListModel {
            id: textListModel
        }


        Column {
            anchors.centerIn: parent
            spacing: 10


            Rectangle {
                width: parent.width
                height: 2
                color: "gray"
            }


            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: 5
                    Text {
                        text: "Q1"
                        color: "black"
                        font.pointSize: 20
                    }
                    Text {
                        id: q1Teaching
                        text: root.curAngle.q1
                        color: "black"
                        font.pointSize: 20
                    }
                }

                Column {
                    spacing: 5
                    Text {
                        text: "Q2"
                        color: "black"
                        font.pointSize: 20
                    }
                    Text {
                        id: q2Teaching
                        text: root.curAngle.q2
                        color: "black"
                        font.pointSize: 20
                    }
                }

                Column {
                    spacing: 5
                    Text {
                        text: "Q3"
                        color: "black"
                        font.pointSize: 20
                    }
                    Text {
                        id: q3Teaching
                        text: root.curAngle.q3
                        color: "black"
                        font.pointSize: 20
                    }
                }

                Column {
                    spacing: 5
                    Text {
                        text: "Q4"
                        color: "black"
                        font.pointSize: 20
                    }
                    Text {
                        id: q4Teaching
                        text: root.curAngle.q4
                        color: "black"
                        font.pointSize: 20
                    }
                }
            }


            Rectangle {
                width: parent.width
                height: 2
                color: "gray"
            }


            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "Lưu điểm"
                    onClicked: {
                        textListModel.append({
                            "text": root.curAngle.q1 + ", " + root.curAngle.q2 + ", " + root.curAngle.q3 + ", " + root.curAngle.q4
                        });
                    }
                    width: 120
                    height: 40
                    font.pixelSize: 16
                }
                Button {
                    text: "Xóa điểm vừa thêm"
                    onClicked: {
                        if (textListModel.count > 0) {
                            textListModel.remove(textListModel.count - 1);
                        }
                    }
                    width: 120
                    height: 40
                    font.pixelSize: 16
                }
                Button {
                    text: "Move"
                    width: 120
                    height: 40
                    font.pixelSize: 16
                    onClicked: {
                        var dataToSend = "";
                        for (var i = 0; i < textListModel.count; ++i) {
                            var angleSet = textListModel.get(i).text.split(",");
                            var q1 = angleSet[0].trim();
                            var q2 = angleSet[1].trim();
                            var q3 = angleSet[2].trim();
                            var q4 = angleSet[3].trim();
                            dataToSend += q1 + ";" + q2 + ";" + q3 + ";" + q4 + ";";
                            if(i==textListModel.count-1){
                                dataToSend += q1 + ";" + q2 + ";" + q3 + ";" + q4;
                            }
                        }
                        console.log("teaching:"+dataToSend);
                        serialPort.writeToSerialPort("teaching:"+dataToSend);
                        myRobot.khongGianKhop(90,20,50,5,curAngle,curPosition);
                    }
                }
                Button {
                    text: "Stop"
                    onClicked: {
                        serialPort.writeToSerialPort("stop:");
                    }
                    width: 120
                    height: 40
                    font.pixelSize: 16
                }
            }


            Rectangle {
                width: parent.width
                height: 2
                color: "gray"
            }


            ListView {
                width: parent.width
                height: 200
                model: textListModel
                clip: true
                delegate: Rectangle {
                    width: parent.width
                    height: 40
                    border.color: "black"
                    Text {
                        text: model.text
                        color: "black"
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }




    Rectangle {
        id: errormoveAngle
        width: 400 / 1423 * Screen.width
        height: 200 / 800 * Screen.height
        radius: 10
        color: "white"
        border.color: "darkred"
        border.width: 2
        anchors.centerIn: parent
        visible: false

        Column {
            spacing: 20 / 800 * Screen.height
            anchors.centerIn: parent

            Text {
                text: "Đã đi đến góc giới hạn."
                font.pixelSize: 30
                font.bold: true
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                text: "Đóng"
                font.pixelSize: 24
                width: 150 / 1423 * Screen.width
                height: 50 / 800 * Screen.height
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: "blue"
                    radius: 10
                }
                contentItem: Text {
                    text: "Đóng"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    errormoveAngle.visible = false
                }
            }
        }
    }

}
