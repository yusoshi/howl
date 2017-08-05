$(function() {
  $("#good-button").on("click", function(){
    event.preventDefault();
    var goodsSum = $("#goods-sum");
    var url = location.href;
    var goodId = $('#good_id').val();
    good_function(goodId, $(this), goodsSum);
  });

  function good_function(id, button, sum) {
    var current_url = location.href;

    if (button.hasClass("decrement")){
      $.ajax({
        url: current_url + '/goods/' + id + '.json',
        type: 'delete',
        data: { article_id: id}
      })
      .done(function(data){
        button.removeClass("decrement").addClass("increment");
        sum.text(data["count"]);
      })
      .fail(function() {
        alert('いいねの取り消しに失敗しました。');
      })
    } else {
      $.ajax({
        url: current_url + "/goods.json",
        type: "post",
        data: { article_id: id }
      })
      .done(function(data){
        button.removeClass("increment").addClass("decrement");
        sum.text(data['count']);
      })
      .fail(function() {
        alert('いいねに失敗しました。');
      });
    }
  }
});
