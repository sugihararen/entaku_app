/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'src/application' // application.scss の読み込み
import 'src/users'       // users.scss の読み込み
import 'src/home'        //home.scssの読み込み
import 'src/sessions'   //sessions.scssの読み込み
import 'bootstrap/dist/js/bootstrap'
import $ from 'jquery'

//フラッシュメッセージ
$(function() {
    setTimeout(function(){
      $('.flash').fadeOut("slow")
    },800);
});
