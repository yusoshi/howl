$(function() {
  // メールアドレスでサインアップできるフォームを作成
  $('.contents__options__new__link').on('click', function(e) {
    e.preventDefault();

    $('.contents__signin-up').remove();
    $('.contents__login-form').remove();
    $('.contents__options').remove();

    var upperContentRight = $('.contents');

    var form = $("<form class='new_user' id='new_user' action='/users' accept-charset='UTF-8' method='post'>");
    form.append("<input name='utf-8' type='hidden' value='✓'")
    form.append("<div class='form-group'>" + "<input placeholder='ユーザ名' class='form-control' type='text' name='user[name]' id='user_name'>");
    form.append("<div class='form-group'>" + "<input placeholder='パスワード' class='form-control' type='password' name='user[password]' id='user_password'>");
    form.append("<div class='terms-of-service-caution'>" + "<a href=''>注意事項</a>" + "に同意の上、「注意事項を確認して登録」ボタンを押してください。");

    var textRight = $("<div class='text-right'>");
    textRight.append("<div class='btn btn-link cancel' data-turbolinks='false'>キャンセル</div>");
    textRight.append("<input type='submit' name='commit' value='利用規約に同意して登録' class='btn btn-primary'>");

    form.append(textRight);

    upperContentRight.prepend(form);
  })

  // キャンセルされたら戻す
  $(document).on('click','.cancel', function() {
    location.reload();
  })

  // メールアドレスでのサインアップを非同期通信で行う
  $(document).on('submit', '#new_user', function(e) {
    e.preventDefault();
    var name = $('#user_name').val();
    var password = $('#user_password').val();

    $.ajax({
      type: 'POST',
      url: '/users.json',
      data: {
        user: {
          name: name,
          password: password
        }
      }
    })
    .done(function(data) {
      window.location.href = '/';
    })
    .fail(function() {
      alert('送信に失敗しました。');
    })
  })
})
