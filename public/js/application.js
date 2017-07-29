$(document).ready(function() {

  $(".stable-parent").on("click", ".vote-option", function(){
    event.preventDefault();
    var $this = $(this);
    var voteOption = $this.attr("class");
    // console.log(voteOption)
    var url = $this.parents(".vote-container").attr("action")
    castVote(url, voteOption, $this)
  })

  function castVote(url, voteOption, $location) {
    promise = $.ajax({
      url: url,
      type: "POST",
      data: {type: voteOption}
    })
    promise.done(function(response){
      // console.log(response)
      $location.parents(".vote-container").siblings(".post-footer").children(".points").text(response)
    })
  }

  $('#new-ans-form').on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var myUrl = $form.attr("action");
    var myData = $form.serialize();

    $.ajax({
      url: myUrl,
      type: 'POST',
      data: myData,
    })
    .done(function(response) {
      $('#question-answers-list').append(response);
      $('#new-ans-form').children().first().val("");
    })
    .fail(function( jqXHR, textStatus ) {
      alert( "Request failed: " + textStatus );
    })
  })

});
