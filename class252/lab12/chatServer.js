var net = require('net');
var eol = require('os').EOL;

var srvr = net.createServer();
var clientList = [];

srvr.on('connection', function(client) {
  client.name = client.remoteAddress + ':' + client.remotePort;
  client.write('Welcome, ' + client.name + eol);
  clientList.push(client);

  client.on('data', function(data) {
    broadcast(data, client);
  });
});

function broadcast(data, client) {
  for (var i in clientList) {
		//1) Typing '\list' will list the names of all other users.
		if(data.toString().includes("\\list")){
			if (client === clientList[i]){
				for (var ii in clientList){
					if(client!==clientList[ii]){
						clientList[i].write(clientList[ii].name+eol);
					}
	  		}
			}
		}
		//2) Typing '\rename <newname>' will let the user specify a new name for himself/herself.
		else if(data.toString().includes("\\rename")){
			if (client === clientList[i]){
				dataArray = data.toString().split(" ");
				name=dataArray[1].replace("\r\n","");
				clientList[i].name=name;
			}
		}
		//3) Typing '\private <name> <msg>' will send a message only to the specified user.
		else if(data.toString().includes("\\private")){
			dataArray = data.toString().split(" ");
			console.log(dataArray);
			
			for (var ii in clientList){
				if(clientList[ii].name===dataArray[1]){
					clientList[ii].write(clientList[1].name + " says " + dataArray[2]);
				}
			}
		}
		else{
			if (client !== clientList[i]){
				clientList[i].write(client.name + " says " + data);
			}
		}
  }
}

srvr.listen(9002);






























