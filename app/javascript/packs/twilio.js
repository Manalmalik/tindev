


btn = document.getElementById("connect-button")

btn.addEventListener('click', event => {
  event.preventDefault
  const { connect, createLocalTracks } = require('twilio-video');

  token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzc1NDQ1YWE4ZjliNGY0NTk1ZGFhMzVmNmZkZTYzM2RmLTE1OTg0Mzc1NzkiLCJpc3MiOiJTSzc1NDQ1YWE4ZjliNGY0NTk1ZGFhMzVmNmZkZTYzM2RmIiwic3ViIjoiQUM2MzhmZWIwODJiNjFkMzEzNjdlYmJiN2VmZjlhYTEwNyIsImV4cCI6MTU5ODQ0MTE3OSwiZ3JhbnRzIjp7ImlkZW50aXR5IjoidGluZGV2LXRlYW0iLCJ2aWRlbyI6e319fQ.adpXqPGaChA6IKu96nQSFKFMBFphiSKdzQOBuBj9y10'

  // connect(token, { name:'my-new-room' }).then(room => {
  //   console.log(`Successfully joined a Room: ${room}`);
  //   room.on('participantConnected', participant => {
  //     console.log(`A remote Participant connected: ${participant}`);
  //   });
  // }, error => {
  //   console.error(`Unable to connect to Room: ${error.message}`);
  // });

  // Option 1
  createLocalTracks({
    audio: true,
    video: { width: 640 }
  }).then(localTracks => {
    return connect(token, { name:'my-new-room' }).then(room => {
      console.log(`Successfully joined a Room: ${room.name}`);
      room.on('participantConnected', participant => {
        console.log(`A remote Participant connected: ${participant}`);
      });
    }, error => {
      console.error(`Unable to connect to Room: ${error.message}`);
    });
  })

  var Video = require('twilio-video');
  // Request audio and video tracks
  Video.createLocalTracks().then(function(localTracks) {
    var localMediaContainer = document.getElementById('local-media-container-id');
    localTracks.forEach(function(track) {
      localMediaContainer.appendChild(track.attach());
    });
  });

});




