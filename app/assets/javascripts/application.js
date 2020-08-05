// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

//ボードゲーム選択表示・非表示
$(document).on('turbolinks:load', function() {
    $('input[name="number"]:radio').change( function() {
    var radioval = $(this).val();
      if(radioval == 0){
        $('.blog-game1').addClass('blog-game1-ext');
        $('.blog-game2').removeClass('blog-game2-ext');
      } else if(radioval == 1){
        $('.blog-game2').addClass('blog-game2-ext');
        $('.blog-game1').removeClass('blog-game1-ext');
      } 
    });
  });

//投稿前の画像プレビュー
$(document).on('turbolinks:load', function(){
    $('#blog_image').on('change', function(e) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $(".image").attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files[0]);
    });
});

$(document).on('turbolinks:load', function(){
    $('#user_profile_image').on('change', function(e) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $(".profile_image").attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files[0]);
    });
});