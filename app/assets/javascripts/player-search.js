$(document).ready(function() {
  var playerNames = $('input[data-player-search]').data('player-search');
  $('input[data-player-search]').typeahead({ source: playerNames });
});
