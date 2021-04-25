let socket = null;
    let o = document.getElementById("output");
    let userField = document.getElementById("username");

    window.onbeforeunload = function () {
        console.log("Leaving");
        let jsonData = {};
        jsonData["action"] = "left";
        socket.send(JSON.stringify(jsonData))
    }

    document.addEventListener("DOMContentLoaded", function () {
        socket = new ReconnectingWebSocket("wss://go-location-tracker.herokuapp.com/ws", null, {debug: true, reconectInterval: 3000});
        // socket = new ReconnectingWebSocket("wss://go-location-tracker.herokuapp.com/ws", null, {debug: true, reconectInterval: 3000});

        // const offline = `<span class="badge bg-danger">Not connected</span>`
        // const online = `<span class="badge bg-success">Connected</span>`
        // let statusDiv = document.getElementById("status");

        socket.onopen = () => {
            console.log("Successfully connected");
            // statusDiv.innerHTML = online;
        }

        socket.onclose = () => {
            console.log("connection closed");
            // statusDiv.innerHTML = offline;
        }

        socket.onerror = error => {
            console.log("there was an error");
            // statusDiv.innerHTML = offline;
        }

        socket.onmessage = msg => {
            let data = JSON.parse(msg.data);
            console.log("Action is", data.action);

            switch (data.action) {
                case 'user_created':
                    console.log('user created '+data.connected_users[0]['uid'])
                    
                    break;
                case "list_users":
                    let ul = document.getElementById("online_users");
                    while (ul.firstChild) ul.removeChild(ul.firstChild);

                    if (data.connected_users.length > 0) {
                        data.connected_users.forEach(function (item) {
                            let li = document.createElement("li");
                            li.appendChild(document.createTextNode(item['nick'] + ' - ' + item['uid']));
                            ul.appendChild(li);
                        })
                    }
                    break;
            }

        }


        userField.addEventListener("change", function () {
            console.log('create_user called')
            let jsonData = {};
            jsonData["action"] = "create_user";
            jsonData["user"] ={'nick': this.value};
            console.log('console data' + jsonData)
            socket.send(JSON.stringify(jsonData));
        })
    })