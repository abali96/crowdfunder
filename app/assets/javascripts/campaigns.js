$( document ).ready(function() {
  $('form').on('cocoon:before-insert', function(e, insertedItem) {
    var i = $('.nested-fields').length;
    var rewardCounterSpan = $(insertedItem).find('.reward-counter');
    rewardCounterSpan.html(i + 1);
  });

  $( ".rewards" )
    .hover(function() {
      $( this )
        .toggleClass( "active" )
    });

});