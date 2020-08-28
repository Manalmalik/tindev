const twilio = () => {

  const btn = document.getElementById("connect-button")
  const share = document.getElementById("share-button")
  const endCall = document.getElementById("end-button")
  const user_token = document.getElementById("user-token")

  if (btn) {
  const token_1 = user_token.innerHTML
  const { connect, LocalVideoTrack, createLocalTracks} = require('twilio-video');

  btn.addEventListener('click', event => {
    event.preventDefault
    VideoCall()
      async function VideoCall(){

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

        endCall.addEventListener('click', event => {
          room.localParticipant.tracks.forEach(publication => {
            const attachedElements = publication.track.detach();
            attachedElements.forEach(element => element.remove());
          });

          room.disconnect();
          window.location.replace("/");
        });
      }
    });


}



}
export { twilio }
