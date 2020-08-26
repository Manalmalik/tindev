


btn = document.getElementById("connect-button")
user_token = document.getElementById("user-token")
token_1 = user_token.innerHTML
// console.log(token_1)

btn.addEventListener('click', event => {
  event.preventDefault
  const { connect, createLocalTracks } = require('twilio-video');

  createLocalTracks({
    audio: true,
    video: { width: 640 }
  }).then(localTracks => {
    return connect(token_1, { name:'my-new-room' }).then(room => {
      console.log(`Successfully joined a Room: ${room.name}`);
      room.on('participantConnected', participant => {
        console.log(`Participant "${participant.identity}" connected`);
        participant.tracks.forEach(publication => {
          if (publication.isSubscribed) {
            const track = publication.track;
            document.getElementById('remote-media-div').appendChild(track.attach());
          }
        });
        participant.on('trackSubscribed', track => {
          document.getElementById('remote-media-div').appendChild(track.attach());
        });
      });

      console.log(room.participants)
      room.participants.forEach(participant => {
        participant.tracks.forEach(publication => {
          if (publication.track) {
            document.getElementById('remote-media-div').appendChild(publication.track.attach());
          }
        });
       participant.on('trackSubscribed', track => {
          document.getElementById('remote-media-div').appendChild(track.attach());
        });
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




