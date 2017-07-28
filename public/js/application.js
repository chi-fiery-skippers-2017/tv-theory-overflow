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
      $location.parents(".vote-container").siblings(".post-footer")
    })
  }



});
