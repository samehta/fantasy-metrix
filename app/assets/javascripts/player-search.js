$(document).ready(function() {
  var playerNames = $('input[data-player-search]').data('player-search');
  $('input[data-player-search]').typeahead({ source: playerNames });
});

function getPlayer() {
  // See jQuery val() docs: https://api.jquery.com/val/
  // Get the player name from the search input field:
  var playerName = $('input[data-player-search]').val();

  // Convert the player name to the slug form:
  var slug = playerName.toLowerCase().replace(' ', '-');

  // Request new URL in browser
  var urlPath = '/nfl_players/' + slug;
  window.location.href = urlPath;

  // Return false to stop <form> from doing its default
  // behaviour of HTTP POST-ing the form fields:
  return false;
}
