/**
 * main.js
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014, Codrops
 * http://www.codrops.com
 */
!function(){function e(){n()}function n(){d.addEventListener("click",t),u&&u.addEventListener("click",t),o.addEventListener("click",function(e){var n=e.target;i&&n!==d&&t()})}function t(){i?classie.remove(c,"show-menu"):classie.add(c,"show-menu"),i=!i}var c=document.body,o=document.querySelector(".content-wrap"),d=document.getElementById("open-button"),u=document.getElementById("close-button"),i=!1;e()}();