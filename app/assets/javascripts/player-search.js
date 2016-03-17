$(document).ready(function() {
  var playerNames = $('input[data-player-search]').data('player-search');
  $('input[data-player-search]').typeahead({ source: playerNames });
});

function getPlayer() {
  // See jQuery val() docs: https://api.jquery.com/val/
  // Get the player name from the search input field:
  var playerName = $('input[data-player-search]').val();

  var playerNames = $('input[data-player-search]').data('player-search');

  if (playerNames.indexOf(playerName) < 0) {
    // player not found
    var flashHtml = '<div class="alert alert-warning text-center">' + 
      '<button type="button" class="close" data-dismiss="alert">&times;</button>' +
      'Player does not exist. Please try again.' + '</div>';
    $('body').prepend(flashHtml);
    // refresh page after 2 seconds
    console.log("before set-timeout")
    setTimeout(function() {
      console.log("pre-load")
      window.location.reload();
      console.log("after load")
    }, 2000);

  } else {
    // Convert the player name to the slug form:
    var slug = playerName.toLowerCase().replace(' ', '-');

    // Request new URL in browser
    var urlPath = '/nfl/players/' + slug;
    window.location.href = urlPath;
  }

  // Return false to stop <form> from doing its default
  // behaviour of HTTP POST-ing the form fields:
  return false;
}