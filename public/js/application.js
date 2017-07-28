$(document).ready(function() {

  $(".stable-parent").on("click", ".vote-option", function(){
    event.preventDefault();
    var $this = $(this);
    var voteOption = $this.attr("class");
    // console.log(voteOption)
    var url = $this.parents(".vote-container").attr("action")
    castVote(url, voteOption)
  })

  function castVote(url, voteOption) {
    promise = $.ajax({
      url: url,
      type: "POST",
      data: {type: voteOption}
    })
    promise.done(function(response){
      console.log(response)
    })
  }



});
