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
      console.log(response)
      $location.parents(".vote-container").siblings(".post-footer").children(".points").text(response)
    })
  }

  $('#new-ans-form').on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var myUrl = $form.attr("action");
    var myType = $form.attr("method")
    var myData = $form.serialize();

    $.ajax({
      url: myUrl,
      type: myType,
      data: myData
    })
    .done(function(response) {
      $('#question-answers-list').append(response);
      $('#new-ans-form').children().first().val("");
    })
    .fail(function( jqXHR, textStatus ) {
      alert( "Request failed: " + textStatus );
    })
  })

  $('.post-comment').find('.new-post-button').on("click", function() {
    $button = $(this);
    $.ajax({
      url: $button.val()
    })
      .done(function(response) {
        $button.replaceWith(response);
    })
      .fail(function(jqXHR, msg, error) {
        alert(error + ": " + jqXHR.responseText);
    })
  })

  $('.post-comment').on("submit", "form", function() {
    event.preventDefault();
    $form = $(this);
    $.ajax({
      url: $form.attr("action"),
      method: "POST",
      data: $form.serialize()
    })
      .done(function(response) {
        $form.closest('.post-comment').siblings('.comment-list').append(response);
        $form.find('#comment_content').val("");
      })
      .fail(function(jqXHR, msg, error) {
        alert(error + ": " + jqXHR.responseText);
      })
  })


  $('a.best-answer-button').on("click", function() {
    event.preventDefault();
    var url = $(this).attr("href");
    var id = $(this).attr("id");
    console.log(url)
    $.ajax({
      url: url,
      method: "POST",
      data: {answerId: id}
    })
    .done(function(response) {

    });
  });

});
