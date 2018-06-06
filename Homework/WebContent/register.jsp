<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<style type="text/css">
.content{
	width:1340px;
	height:500px;
	margin:10px auto;
}
.Register-header{
	width: 100%;
    height:70px;
	font-size:48px;
	font-family:"华文行楷";
	padding-top:40px;
}
.Register-body{
	height:500px;
	margin:10px 350px 60px 350px;
	border-radius:6px;
}
.Register-input-box{
    width: 100%;
	margin:40px 50px 30px 75px;
}
.Register-input-box input{
	border-radius:6px;
	width:500px;
	height:50px;
	border:1px solid #CCC;
}

.Register-input-box input:hover{
    border: 1px solid #0FC;
}

.Register-input-box input:after{
    border: 1px solid #0FC;
}
.Register-button-box{
	margin-top: 18px;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
    display: inline-block;
}
.Register-button-box button{
    background-color: #0CF;
    color: #ffffff;
    font-size: 16px;
    width: 386px;
    height: 40px;
    margin-left: 18px;
    border: 1px solid #0FF;
    border-radius: 4px;
}

.Register-button-box button:hover{
    background-color: #0CF;
}

.Register-button-box button:active{
    background-color: #0FF;
}
canvas {
  background-color: #eee;
  display: block;
  margin: 0 auto;
  z-index:-1;
  position:absolute;
}
</style>
</head>
<body bgcolor="#eeeeee">
<canvas id="sakura"></canvas>
<div class="content">
	<div class="Register-header" align="center">书有汇用户注册</div>
    <div class="Register-body">
    	<form action="RegisterServlet" method="POST">
	    	<div class="Register-input-box">
	        	<input type="text" placeholder="请输入注册账号" name="UserName" />
	        </div>
	        <div class="Register-input-box">
	        	<input type="text" placeholder="请输入ID" name="UserID" />
	        </div>
	        <div class="Register-input-box">
	        	<input type="password" placeholder="请输入密码" name="Password_Fir" />
	        </div>
	        <div class="Register-button-box" align="center">
	        	<button type="submit">Register</button>
	        </div>
        </form>
    </div>
    </div>
</div>

</body>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
</style>

<!-- sakura shader -->
<script id="sakura_point_vsh" type="x-shader/x_vertex">
uniform mat4 uProjection;
uniform mat4 uModelview;
uniform vec3 uResolution;
uniform vec3 uOffset;
uniform vec3 uDOF; //x:focus distance, y:focus radius, z:max radius
uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

attribute vec3 aPosition;
attribute vec3 aEuler;
attribute vec2 aMisc; //x:size, y:fade

varying vec3 pposition;
varying float psize;
varying float palpha;
varying float pdist;

//varying mat3 rotMat;
varying vec3 normX;
varying vec3 normY;
varying vec3 normZ;
varying vec3 normal;

varying float diffuse;
varying float specular;
varying float rstop;
varying float distancefade;

void main(void) {
 // Projection is based on vertical angle
 vec4 pos = uModelview * vec4(aPosition + uOffset, 1.0);
 gl_Position = uProjection * pos;
 gl_PointSize = aMisc.x * uProjection[1][1] / -pos.z * uResolution.y * 0.5;

 pposition = pos.xyz;
 psize = aMisc.x;
 pdist = length(pos.xyz);
 palpha = smoothstep(0.0, 1.0, (pdist - 0.1) / uFade.z);

 vec3 elrsn = sin(aEuler);
 vec3 elrcs = cos(aEuler);
 mat3 rotx = mat3(
 1.0, 0.0, 0.0,
 0.0, elrcs.x, elrsn.x,
 0.0, -elrsn.x, elrcs.x
 );
 mat3 roty = mat3(
 elrcs.y, 0.0, -elrsn.y,
 0.0, 1.0, 0.0,
 elrsn.y, 0.0, elrcs.y
 );
 mat3 rotz = mat3(
 elrcs.z, elrsn.z, 0.0, 
 -elrsn.z, elrcs.z, 0.0,
 0.0, 0.0, 1.0
 );
 mat3 rotmat = rotx * roty * rotz;
 normal = rotmat[2];

 mat3 trrotm = mat3(
 rotmat[0][0], rotmat[1][0], rotmat[2][0],
 rotmat[0][1], rotmat[1][1], rotmat[2][1],
 rotmat[0][2], rotmat[1][2], rotmat[2][2]
 );
 normX = trrotm[0];
 normY = trrotm[1];
 normZ = trrotm[2];

 const vec3 lit = vec3(0.6917144638660746, 0.6917144638660746, -0.20751433915982237);

 float tmpdfs = dot(lit, normal);
 if(tmpdfs < 0.0) {
 normal = -normal;
 tmpdfs = dot(lit, normal);
 }
 diffuse = 0.4 + tmpdfs;

 vec3 eyev = normalize(-pos.xyz);
 if(dot(eyev, normal) > 0.0) {
 vec3 hv = normalize(eyev + lit);
 specular = pow(max(dot(hv, normal), 0.0), 20.0);
 }
 else {
 specular = 0.0;
 }

 rstop = clamp((abs(pdist - uDOF.x) - uDOF.y) / uDOF.z, 0.0, 1.0);
 rstop = pow(rstop, 0.5);
 //-0.69315 = ln(0.5)
 distancefade = min(1.0, exp((uFade.x - pdist) * 0.69315 / uFade.y));
}
</script>
<script id="sakura_point_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif

uniform vec3 uDOF; //x:focus distance, y:focus radius, z:max radius
uniform vec3 uFade; //x:start distance, y:half distance, z:near fade start

const vec3 fadeCol = vec3(0.08, 0.03, 0.06);

varying vec3 pposition;
varying float psize;
varying float palpha;
varying float pdist;

//varying mat3 rotMat;
varying vec3 normX;
varying vec3 normY;
varying vec3 normZ;
varying vec3 normal;

varying float diffuse;
varying float specular;
varying float rstop;
varying float distancefade;

float ellipse(vec2 p, vec2 o, vec2 r) {
 vec2 lp = (p - o) / r;
 return length(lp) - 1.0;
}

void main(void) {
 vec3 p = vec3(gl_PointCoord - vec2(0.5, 0.5), 0.0) * 2.0;
 vec3 d = vec3(0.0, 0.0, -1.0);
 float nd = normZ.z; //dot(-normZ, d);
 if(abs(nd) < 0.0001) discard;

 float np = dot(normZ, p);
 vec3 tp = p + d * np / nd;
 vec2 coord = vec2(dot(normX, tp), dot(normY, tp));

 //angle = 15 degree
 const float flwrsn = 0.258819045102521;
 const float flwrcs = 0.965925826289068;
 mat2 flwrm = mat2(flwrcs, -flwrsn, flwrsn, flwrcs);
 vec2 flwrp = vec2(abs(coord.x), coord.y) * flwrm;

 float r;
 if(flwrp.x < 0.0) {
 r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.36, 0.96) * 0.5);
 }
 else {
 r = ellipse(flwrp, vec2(0.065, 0.024) * 0.5, vec2(0.58, 0.96) * 0.5);
 }

 if(r > rstop) discard;

 vec3 col = mix(vec3(1.0, 0.8, 0.75), vec3(1.0, 0.9, 0.87), r);
 float grady = mix(0.0, 1.0, pow(coord.y * 0.5 + 0.5, 0.35));
 col *= vec3(1.0, grady, grady);
 col *= mix(0.8, 1.0, pow(abs(coord.x), 0.3));
 col = col * diffuse + specular;

 col = mix(fadeCol, col, distancefade);

 float alpha = (rstop > 0.001)? (0.5 - r / (rstop * 2.0)) : 1.0;
 alpha = smoothstep(0.0, 1.0, alpha) * palpha;

 gl_FragColor = vec4(col * 0.5, alpha);
}
</script>
<!-- effects -->
<script id="fx_common_vsh" type="x-shader/x_vertex">
uniform vec3 uResolution;
attribute vec2 aPosition;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
 gl_Position = vec4(aPosition, 0.0, 1.0);
 texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
 screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
}
</script>
<script id="bg_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif

uniform vec2 uTimes;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
 vec3 col;
 float c;
 vec2 tmpv = texCoord * vec2(0.8, 1.0) - vec2(0.95, 1.0);
 c = exp(-pow(length(tmpv) * 1.8, 2.0));
 col = mix(vec3(0.02, 0.0, 0.03), vec3(0.96, 0.98, 1.0) * 1.5, c);
 gl_FragColor = vec4(col * 0.5, 1.0);
}
</script>
<script id="fx_brightbuf_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
 vec4 col = texture2D(uSrc, texCoord);
 gl_FragColor = vec4(col.rgb * 2.0 - vec3(0.5), 1.0);
}
</script>
<script id="fx_dirblur_r4_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;
uniform vec4 uBlurDir; //dir(x, y), stride(z, w)

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
 vec4 col = texture2D(uSrc, texCoord);
 col = col + texture2D(uSrc, texCoord + uBlurDir.xy * uDelta);
 col = col + texture2D(uSrc, texCoord - uBlurDir.xy * uDelta);
 col = col + texture2D(uSrc, texCoord + (uBlurDir.xy + uBlurDir.zw) * uDelta);
 col = col + texture2D(uSrc, texCoord - (uBlurDir.xy + uBlurDir.zw) * uDelta);
 gl_FragColor = col / 5.0;
}
</script>
<!-- effect fragment shader template -->
<script id="fx_common_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform vec2 uDelta;

varying vec2 texCoord;
varying vec2 screenCoord;

void main(void) {
 gl_FragColor = texture2D(uSrc, texCoord);
}
</script>
<!-- post processing -->
<script id="pp_final_vsh" type="x-shader/x_vertex">
uniform vec3 uResolution;
attribute vec2 aPosition;
varying vec2 texCoord;
varying vec2 screenCoord;
void main(void) {
 gl_Position = vec4(aPosition, 0.0, 1.0);
 texCoord = aPosition.xy * 0.5 + vec2(0.5, 0.5);
 screenCoord = aPosition.xy * vec2(uResolution.z, 1.0);
}
</script>
<script id="pp_final_fsh" type="x-shader/x_fragment">
#ifdef GL_ES
//precision mediump float;
precision highp float;
#endif
uniform sampler2D uSrc;
uniform sampler2D uBloom;
uniform vec2 uDelta;
varying vec2 texCoord;
varying vec2 screenCoord;
void main(void) {
 vec4 srccol = texture2D(uSrc, texCoord) * 2.0;
 vec4 bloomcol = texture2D(uBloom, texCoord);
 vec4 col;
 col = srccol + bloomcol * (vec4(1.0) + srccol);
 col *= smoothstep(1.0, 0.0, pow(length((texCoord - vec2(0.5)) * 2.0), 1.2) * 0.5);
 col = pow(col, vec4(0.45454545454545)); //(1.0 / 2.2)

 gl_FragColor = vec4(col.rgb, 1.0);
 gl_FragColor.a = 1.0;
}
</script>
<script src="js/index.js"></script>
</html>