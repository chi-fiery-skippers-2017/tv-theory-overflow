$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
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
    .fail(function(response) {
      $('#answer-new').prepend(response);
    })
  })

});
