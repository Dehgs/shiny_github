$(document).ready(function() {
  setTimeout(function() {
    var navbar = document.getElementsByClassName("navbar navbar-default navbar-static-top navbar-inverse")[0];
    var logo = document.createElement("a");
    logo.setAttribute("href", "https://www.tpk.govt.nz/en");
    logo.setAttribute("target", "_blank");
    logo.innerHTML = \'<img class="logo" style="content:url(tpk_logo.svg);height:50px;top:5px;right:15px;position:absolute;">\';
    navbar.appendChild(logo);
  }, 20);
});