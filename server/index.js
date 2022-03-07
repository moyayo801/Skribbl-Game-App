const express = require("express");
var http = require("http");
const app = express();
const port = process.env.Port || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const Room = require('./models/Room');
var io = require("socket.io")(server);
const getWord = require('./api/getWord');

app.use(express.json());


const DB = 'mongodb+srv://moyayo:yayo801yayo@cluster0.rt5p5.mongodb.net/myFirstDatabase?retryWrites=true&w=majority';

mongoose.connect(DB).then(()=>{
    console.log('Connection Succesful');
}).catch((e)=>{
    console.log(e);

})

io.on('connection', (socket)=>{
    console.log('connected');
    socket.on("create-game", async ({ nickname, name, occupancy, maxRounds })=>{
        try {
            const existingRoom = await Room.findOne({ name });
      if (existingRoom) {
        socket.emit("notCorrectGame", "Room with that name already exists");
        return;
            }
            let room = new Room();
      const word = getWord();
      room.word = word;
      room.name = name;
      room.occupancy = occupancy;
      room.maxRounds = maxRounds;
      let player = {
        socketID: socket.id,
        nickname,
        isPartyLeader: true,
      };
      room.players.push(player);
      room = await room.save();
      socket.join(name);
      io.to(name).emit("updateRoom", room);
    } catch (err) {
      console.log(err);
    }
  });


  socket.on('join-game', async({nickname, name}) =>{
    try {
      let room = await Room.findOne({name});
      if (!room) {
        socket.emit("notCorrectGame", "Please enter a valid room name");
        return;
      }
      if (room.isJoin) {
        let player ={
          socketID: socket.id,
          nickname,
        }
        room.players.push(player);
        socket.join(name);

        if (room.players.length === room.occupancy) {
          room.isJoin = false;
        }
        room.turn = room.players[room.turnIndex];
        room = await room.save();
        io.to(name).emit("updateRoom", room);
      }else{
        socket.emit("notCorrectGame", "Game in Progress try later");
      }
    } catch (err) {
      console.log(err);
      
    }
  });
  socket.on('paint', ({details, roomName}) =>{
    io.to(roomName).emit('points', {details: details});
  })
});

server.listen(port, "0.0.0.0", () => {
   console.log('Server started and running on port'+ port);
})










