$(function() {
  // ユーザー名とパスワードの入力フォーム
  $('.contents__options__new__link').on('click', function(e) {
    e.preventDefault();

    $('.contents__signin-up').remove();
    $('.contents__login-form').remove();
    $('.contents__options').remove();
    $('.alert').remove();

    var upperContentRight = $('.contents');

    var form = $("<form class='new_user_sign-up' id='new_user_sign-up' action='/users' accept-charset='UTF-8' method='post'>");
    form.append("<input type='hidden' name='authenticity_token' value=" + AUTH_TOKEN + ">");
    form.append("<input name='utf-8' type='hidden' value='✓'")
    form.append("<div class='form-group'>" + "<input placeholder='ユーザ名' class='form-control' type='text' name='user[name]' id='user_name'>");
    form.append("<div class='form-group'>" + "<input placeholder='パスワード' class='form-control' type='password' name='user[password]' id='user_password'>");
    form.append("<div class='terms-of-service-caution'>" + "<a href=''>注意事項</a>" + "に同意の上、「登録」ボタンを押してください。");

    var textRight = $("<div class='text-right'>");
    textRight.append("<div class='btn btn-link cancel' data-turbolinks='false'>キャンセル</div>");
    textRight.append("<input type='submit' name='commit' value='登録' class='btn btn-primary'>");

    form.append(textRight);

    upperContentRight.prepend(form);
  })

  // キャンセルされたら戻す
  $(document).on('click','.cancel', function() {
    location.reload();
  })

  // 非同期通信
  $(document).on('submit', '#new_user-sign-up', function(e) {
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
