const twilio = () => {

  const btn = document.getElementById("connect-button")
  const share = document.getElementById("share-button")
  const user_token = document.getElementById("user-token")
  if (btn) {
  const token_1 = user_token.innerHTML
// console.log(token_1)
  const { connect, LocalVideoTrack, createLocalTracks} = require('twilio-video');



  btn.addEventListener('click', event => {
    event.preventDefault
    //const { connect, createLocalTracks } = require('twilio-video');
  VideoCall()
    async function VideoCall(){


    // createLocalTracks({
    //   audio: true,
    //   video: { width: 640 }
    // }).then(localTracks => {
    //   return connect(token_1, { name:'my-new-room' }).then(room => {
    //     console.log(`Successfully joined a Room: ${room.name}`);
    //     room.on('participantConnected', participant => {
    //       console.log(`Participant "${participant.identity}" connected`);
    //       participant.tracks.forEach(publication => {
    //         if (publication.isSubscribed) {
    //           const track = publication.track;
    //           document.getElementById('remote-media-div').appendChild(track.attach());
    //         }
    //       });
    //       participant.on('trackSubscribed', track => {
    //         document.getElementById('remote-media-div').appendChild(track.attach());
    //       });
    //     });

    //     console.log(room.participants)
    //     room.participants.forEach(participant => {
    //       participant.tracks.forEach(publication => {
    //         if (publication.track) {
    //           document.getElementById('remote-media-div').appendChild(publication.track.attach());
    //         }
    //       });
    //       participant.on('trackSubscribed', track => {
    //         document.getElementById('remote-media-div').appendChild(track.attach());
    //       });
    //     });
    //   }, error => {
    //     console.error(`Unable to connect to Room: ${error.message}`);
    //   });
    // })


    const room = await connect(token_1, {
      audio: true,
      name: 'my-room-name',
      video: { width: 640}
    });

   // Connecting Participant
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

    // Remote Participant
    function RemoteParticipant(){
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
    }

      RemoteParticipant();

        var Video = require('twilio-video');
          // Request audio and video tracks
        Video.createLocalTracks().then(function(localTracks) {
            var localMediaContainer = document.getElementById('local-media-container-id');
            localTracks.forEach(function(track) {
            localMediaContainer.appendChild(track.attach());
          });
      });



      share.addEventListener('click', event => {
        async function startCapture() {
        const stream = await navigator.mediaDevices.getDisplayMedia();
        const screenTrack = new LocalVideoTrack(stream.getTracks()[0]);
        room.localParticipant.publishTrack(screenTrack);
      }
        startCapture();
      });
    }
  });
}



}
export { twilio }
