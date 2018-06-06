<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>

<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.container {
  width: 100%;
  height: 480px;
}

#learn-more {
  fill-opacity: 0;
  fill: #fff;
  stroke: #fff;
  stroke-width: 2;
  border-radius: 5px;
  stroke-linejoin: round;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
  cursor: pointer;
}
#learn-more:hover {
  fill-opacity: 1;
}
#learn-more:hover ~ .learn-more-text {
  fill: #005fa4;
}

.learn-more-text {
  font-family: 'Roboto';
  fill: #fff;
  pointer-events: none;
  font-size: 14px;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}

.center {
  fill: #005fa4;
}

.pointer {
  fill: #fff;
  stroke: #3b8fc0;
  stroke-width: 2;
}

.nav-copy {
  font-family: 'Roboto';
  fill: #fff;
  fill-opacity: 1;
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}
.nav-copy.changing {
  fill-opacity: 0;
}

.service {
  cursor: pointer;
}
.service text {
  font-size: 14px;
  font-family: 'Roboto';
  text-anchor: middle;
}
.service .icon-wrapper {
  -webkit-transform-origin: 50% 50%;
          transform-origin: 50% 50%;
}
.service .icon-wrapper, .service .icon-wrapper > * {
  -webkit-transition: all 250ms ease-in;
  transition: all 250ms ease-in;
}
.service circle {
  fill: #005fa4;
}
.service circle.shadow {
  fill-opacity: 0;
  -webkit-filter: url(#service-shadow);
          filter: url(#service-shadow);
}
.service use {
  fill: #fff;
}
.service text {
  fill: #4d4d4d;
}
.service.active .icon-wrapper, .service:hover .icon-wrapper {
  -webkit-transform: scale(1.15) translateY(-5px);
          transform: scale(1.15) translateY(-5px);
}
.service.active .icon-wrapper, .service.active .icon-wrapper > *, .service:hover .icon-wrapper, .service:hover .icon-wrapper > * {
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.service.active .icon-wrapper circle.shadow, .service:hover .icon-wrapper circle.shadow {
  fill-opacity: 0.4;
}
.service.active text, .service:hover text {
  fill: #005fa4;
  font-weight: bold;
}
</style>
</head>
<body>

<script src="js/jquery.min.js"></script>
<script src="js/TweenMax.min.js"></script>

<div class="container">
  <svg id="circle-nav-services" width="100%" height="100%" viewBox="0 0 650 550">
    <defs>
    <filter id="service-shadow" height="2" width="2" y="-.5" x="-.5">
      <feOffset result="offOut" in="SourceGraphic" dx="0" dy="5" />
      <feGaussianBlur result="blurOut" in="offOut" stdDeviation="12" />
      <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
    </filter>
  </defs>
  
    <symbol id="circle-nav-copy" viewBox="0 0 300 300">
      <defs>
        <style>
          .cls-1 {
            font-size: 28px;
            font-family: Roboto-Bold, Roboto;
            font-weight: 700;
          }

          .cls-2 {
            letter-spacing: -0.02em;
          }

          .cls-3 {
            letter-spacing: -0.01em;
          }

          .cls-4 {
            letter-spacing: -0.01em;
          }

          .cls-5 {
            font-size: 16px;
            font-family: Roboto-Regular, Roboto;
          }

          .cls-6 {
            letter-spacing: -0.01em;
          }

          .cls-7 {
            letter-spacing: -0.01em;
          }

          .cls-8 {
            letter-spacing: -0.02em;
          }

          .cls-9 {
            letter-spacing: -0.01em;
          }

          .cls-10 {
            letter-spacing: 0.01em;
          }

          .cls-11 {
            letter-spacing: -0.01em;
          }

          .cls-12 {
            letter-spacing: -0.04em;
          }

          .cls-13 {
            letter-spacing: -0.02em;
          }

          .cls-14 {
            letter-spacing: 0.01em;
          }

          .cls-15 {
            letter-spacing: -0.01em;
          }

          .cls-16 {
            letter-spacing: -0.06em;
          }

          .cls-17 {
            letter-spacing: -0.02em;
          }

          .cls-18 {
            letter-spacing: 0.01em;
          }

          .cls-19 {
            letter-spacing: 0.02em;
          }

          .cls-20 {
            letter-spacing: -0.01em;
          }

          .cls-21 {
            letter-spacing: -0.03em;
          }
        </style>
      </defs>
      <title>Artboard 1</title>
      <text class="cls-1" transform="translate(108 1865)">
	  
	  </text>
      <text class="cls-5" transform="translate(57 1930)">
	  TEST1
	  </text>
      <text class="cls-1" transform="translate(107 1566)">
	  TEST2
	  </text>
      <text class="cls-5" transform="translate(47 1636)">
	  TEST3
	  </text>
      <text class="cls-1" transform="translate(105 966)">
	  TEST4
	  </text>
      <text class="cls-5" transform="translate(65 1037)">
	  TEST5
	  </text>
      <text class="cls-1" transform="translate(104 666)">
	  TEST6
	  </text>
      <text class="cls-5" transform="translate(83 710)">
	  TEST7
	  </text>
      <text class="cls-1" transform="translate(102 65)">
	  
	  </text>
      <text class="cls-5" transform="translate(63 108)">
	  TEST9
	  </text>
      <text class="cls-1" transform="translate(103 365)">
	  TEST10
	  </text>
      <text class="cls-5" transform="translate(46 437)">
	  TEST11
	  </text>
      <text class="cls-1" transform="translate(106 1266)">
	  TEST12
	  </text>
      <text class="cls-5" transform="translate(47 1323)">
	  TEST13
	  </text>
    </symbol>
    <symbol id="industries" viewBox="0 0 512 512">
		
    </symbol>
    <symbol id="validation" viewBox="0 0 512 512">
	</symbol>
    <symbol id="engineering" viewBox="0 0 512 512">
	</symbol>
    <symbol id="management" viewBox="0 0 512 512">
	</symbol>
    <symbol id="manufacturing" viewBox="0 0 512 512">
	</symbol>
    <symbol id="technical" viewBox="0 0 512 512">
	</symbol>
    <symbol id="process" viewBox="0 0 512 512">
	</symbol>
    

    <svg x="150" y="0" width="350" height="350" viewBox="0 0 500 500">
      <linearGradient id="a" gradientUnits="userSpaceOnUse" x1="250.2542" y1="496.283" x2="250.2542" y2="-.2102">
        <stop offset="0" stop-color="#0F68A9"/>
        <stop offset="1" stop-color="#3DDEED" stop-opacity="0"/>
      </linearGradient>
      <path fill="url(#a)" d="M250.3 0c137 0 248.1 111.1 248.1 248.1S387.3 496.2 250.3 496.2 2.2 385.1 2.2 248.1 113.2 0 250.3 0C112.5 0 .8 111.7.8 249.5S112.5 499 250.3 499s249.5-111.7 249.5-249.5S388 0 250.3 0z"/>
    </svg>
    
    <g id="service-collection">
      <!-- this gets filled dynamically -->
    </g>
    <circle cx="325" cy="170" r="140" class="center"/>
    <use x="185" y="30" width="280" height="280" xlink:href="#circle-nav-copy" class="nav-copy"/>
   
  </svg>
</div>

<script>
"use strict";

var center = { x: 325, y: 175 };
var serv_dist = 250;
var pointer_dist = 172;
var pointer_time = 2;
var icon_size = 42;
var circle_radius = 38;
var text_top_margin = 18;
var tspan_delta = 16;

//name is used as the title for the bubble
//icon is the id of the corresponding svg symbol
var services_data = [{ name: "姓名", icon: "industries" }, { name: "ID", icon: "validation" }, { name: "邮箱", icon: "engineering" }, { name: "性别", icon: "management" }, { name: "联系方式", icon: "manufacturing" }, { name: "密码", icon: "technical" }, { name: "返回", icon: "process" }];

var services = document.getElementById("service-collection");
var nav_container = document.getElementById("circle-nav-services");
var symbol_copy = document.getElementById("circle-nav-copy");
var use_copy = document.querySelector("use.nav-copy");

//Keeps code DRY avoiding namespace for element creation
function createSVGElement(el) {
  return document.createElementNS("http://www.w3.org/2000/svg", el);
}

//Quick setup for multiple attributes
function setAttributes(el, options) {
  Object.keys(options).forEach(function (attr) {
    el.setAttribute(attr, options[attr]);
  });
}

//Service bubbles are created dynamically
function addService(serv, index) {
  var group = createSVGElement("g");
  group.setAttribute("class", "service serv-" + index);

  /* This group is needed to apply animations in
    the icon and its background at the same time */
  var icon_group = createSVGElement("g");
  icon_group.setAttribute("class", "icon-wrapper");

  var circle = createSVGElement("circle");
  setAttributes(circle, {
    r: circle_radius,
    cx: center.x,
    cy: center.y
  });
  var circle_shadow = circle.cloneNode();
  setAttributes(circle, {
    class: 'shadow'
  });
  icon_group.appendChild(circle_shadow);
  icon_group.appendChild(circle);

  var symbol = createSVGElement("use");
  setAttributes(symbol, {
    'x': center.x - icon_size / 2,
    'y': center.y - icon_size / 2,
    'width': icon_size,
    'height': icon_size
  });
  symbol.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#" + serv.icon);
  icon_group.appendChild(symbol);

  group.appendChild(icon_group);

  var text = createSVGElement("text");
  setAttributes(text, {
    x: center.x,
    y: center.y + circle_radius + text_top_margin
  });

  var tspan = createSVGElement("tspan");
  if (serv.name.indexOf('\n') >= 0) {

    var tspan2 = tspan.cloneNode();
    var name = serv.name.split('\n');
    jQuery(tspan).text(name[0]);
    jQuery(tspan2).text(name[1]);

    setAttributes(tspan2, {
      x: center.x,
      dy: tspan_delta
    });

    text.appendChild(tspan);
    text.appendChild(tspan2);
  } else {
    jQuery(tspan).text(serv.name);
    text.appendChild(tspan);
  }

  group.appendChild(text);
  services.appendChild(group);

  var service_bubble = jQuery(".serv-" + index);

  //Uses tween to look for right position
  twn_pivot_path.seek(index);
  TweenLite.set(service_bubble, {
    x: pivot_path.x,
    y: pivot_path.y,
    transformOrigin: "center center"
  });

  service_bubble.click(serviceClick);
}

//Creates pointer
function createPointer() {
  var service_pointer = createSVGElement("circle");

  setAttributes(service_pointer, {
    cx: center.x - pointer_dist,
    cy: center.y,
    r: 12,
    class: "pointer"
  });

  nav_container.appendChild(service_pointer);

  service_pointer = document.querySelector("svg .pointer");

  var pointer_circle = [{ x: 0, y: 0 }, { x: pointer_dist, y: pointer_dist }, { x: pointer_dist * 2, y: 0 }, { x: pointer_dist, y: -pointer_dist }, { x: 0, y: 0 }];

  twn_pointer_path.to(service_pointer, pointer_time, {
    bezier: {
      values: pointer_circle,
      curviness: 1.5 },
    ease: Power0.easeNone,
    transformOrigin: "center center"
  });
}

//Defines behavior for service bubbles
function serviceClick(ev) {

  //There's always an active service
  jQuery(".service.active").removeClass("active");

  var current = jQuery(ev.currentTarget);
  current.addClass("active");

  //There's a "serv-*" class for each bubble
  var current_class = current.attr("class").split(" ")[1];
  var class_index = current_class.split('-')[1];

  //Hides current text of the main bubble
  jQuery(use_copy).addClass("changing");

  //Sets pointer to the right position
  twn_pointer_path.tweenTo(class_index * (pointer_time / (2 * 6)));

  //After it's completely hidden, the text changes and becomes visible
  setTimeout(function () {
    var viewBoxY = 300 * class_index;
    symbol_copy.setAttribute("viewBox", "0 " + viewBoxY + " 300 300");
    jQuery(use_copy).removeClass("changing");
  }, 250);
}

//Array describes points for a whole circle in order to get
//the right curve
var half_circle = [{ x: -serv_dist, y: 0 }, { x: 0, y: serv_dist }, { x: serv_dist, y: 0 }, { x: 0, y: -serv_dist }, { x: -serv_dist, y: 0 }];

//A simple object is used in the tween to retrieve its values
var pivot_path = { x: half_circle[0].x, y: half_circle[0].y };

//The object is animated with a duration based on how many bubbles
//should be placed
var twn_pivot_path = TweenMax.to(pivot_path, 12, {
  bezier: {
    values: half_circle,
    curviness: 1.5
  },
  ease: Linear.easeNone
});

services_data.reduce(function (count, serv) {
  addService(serv, count);
  return ++count;
}, 0);

//The variable is modified inside the function
//but its also used later to toggle its class
var twn_pointer_path = new TimelineMax({ paused: true });
createPointer();

//Adding it immediately triggers a bug for the transform
setTimeout(function () {
  return jQuery("#service-collection .serv-0").addClass("active");
}, 200);</script>
</body>
</html>