
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>End of Day</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300;1,400&family=DM+Mono:wght@300&display=swap');
  :root {
    --bg:#0e0e0f; --surface:#161618; --muted:#2a2a2d;
    --text:#c8c4bb; --dim:#5a5752; --accent:#8fa38a; --warm:#c4a882;
  }
  *{margin:0;padding:0;box-sizing:border-box;-webkit-tap-highlight-color:transparent;}
  html,body{height:100%;background:var(--bg);color:var(--text);font-family:'Cormorant Garamond',Georgia,serif;overflow:hidden;user-select:none;}
  #bgc{position:fixed;inset:0;z-index:0;opacity:.4;}
  .screen{position:fixed;inset:0;z-index:10;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:40px 24px;opacity:0;pointer-events:none;transition:opacity .8s ease;}
  .screen.active{opacity:1;pointer-events:all;}
  .lbl{font-family:'DM Mono',monospace;font-size:11px;letter-spacing:.2em;color:var(--dim);margin-bottom:12px;text-transform:uppercase;}
  h1,h2{font-weight:300;font-style:italic;text-align:center;line-height:1.25;}
  h1{font-size:clamp(30px,8vw,50px);margin-bottom:14px;}
  h2{font-size:clamp(20px,5vw,30px);margin-bottom:8px;}
  .sub{font-size:13px;color:var(--dim);font-style:italic;margin-bottom:32px;text-align:center;line-height:1.6;}
  .btn-g{font-family:'DM Mono',monospace;font-size:11px;letter-spacing:.15em;color:var(--accent);background:none;border:1px solid rgba(143,163,138,.3);padding:12px 32px;cursor:pointer;transition:all .3s;text-transform:uppercase;}
  .btn-g:hover{background:rgba(143,163,138,.06);border-color:rgba(143,163,138,.6);}
  .btn-m{font-family:'DM Mono',monospace;font-size:11px;letter-spacing:.15em;color:var(--bg);background:var(--accent);border:none;padding:13px 32px;cursor:pointer;text-transform:uppercase;transition:background .3s;}
  .btn-m:hover{background:#a0b89b;}
  .btn-s{font-family:'DM Mono',monospace;font-size:11px;letter-spacing:.15em;color:var(--dim);background:none;border:1px solid var(--muted);padding:13px 24px;cursor:pointer;text-transform:uppercase;transition:all .3s;}
  .btn-s:hover{color:var(--text);border-color:rgba(143,163,138,.3);}
  .lnk{font-family:'DM Mono',monospace;font-size:10px;letter-spacing:.15em;color:var(--dim);background:none;border:none;cursor:pointer;text-transform:uppercase;transition:color .2s;}
  .lnk:hover{color:var(--text);}
  .row{display:flex;gap:14px;margin-top:22px;flex-wrap:wrap;justify-content:center;}

/* S1 */
#s1 .time{font-family:‘DM Mono’,monospace;font-size:11px;letter-spacing:.2em;color:var(–dim);margin-bottom:52px;}
#s1 p{font-size:16px;color:var(–dim);font-style:italic;margin-bottom:60px;}

/* S2 Breathe */
.bwrap{position:relative;width:190px;height:190px;margin-bottom:48px;}
.br{position:absolute;inset:0;border-radius:50%;border:1px solid rgba(143,163,138,.2);}
.br.inner{inset:28px;border-color:rgba(143,163,138,.4);background:radial-gradient(circle,rgba(143,163,138,.05) 0%,transparent 70%);}
.br.pulse{inset:0;border:none;background:radial-gradient(circle,rgba(143,163,138,.04) 0%,transparent 60%);}
.btxt{position:absolute;inset:0;display:flex;align-items:center;justify-content:center;font-size:13px;font-style:italic;color:var(–accent);letter-spacing:.05em;}
@keyframes bi{0%{transform:scale(1);opacity:.3}100%{transform:scale(1.35);opacity:.9}}
@keyframes bh{0%,100%{transform:scale(1.35);opacity:.9}}
@keyframes bo{0%{transform:scale(1.35);opacity:.9}100%{transform:scale(1);opacity:.3}}
.bin .br.inner,.bin .br.pulse{animation:bi 4s ease-in-out forwards;}
.bhold .br.inner,.bhold .br.pulse{animation:bh 4s ease-in-out forwards;}
.bout .br.inner,.bout .br.pulse{animation:bo 6s ease-in-out forwards;}
.bctr{font-family:‘DM Mono’,monospace;font-size:11px;color:var(–dim);letter-spacing:.15em;margin-bottom:32px;}

/* S3 Write */
#dump{width:100%;max-width:460px;min-height:130px;background:var(–surface);border:1px solid var(–muted);color:var(–text);font-family:‘Cormorant Garamond’,serif;font-size:17px;line-height:1.7;font-style:italic;padding:18px;resize:none;outline:none;border-radius:2px;transition:border-color .3s,opacity .6s,transform .6s;caret-color:var(–accent);}
#dump:focus{border-color:rgba(143,163,138,.4);}
#dump::placeholder{color:var(–dim);}

/* S4 Draw */
#s4{padding:20px 16px;justify-content:flex-start;padding-top:32px;}
.toolbar{display:flex;align-items:center;gap:10px;margin-bottom:14px;flex-wrap:wrap;justify-content:center;}
.swatch{width:26px;height:26px;border-radius:50%;cursor:pointer;border:2px solid transparent;transition:transform .2s,border-color .2s;}
.swatch:hover{transform:scale(1.15);}
.swatch.on{border-color:var(–text);transform:scale(1.1);}
.bsize{display:flex;align-items:center;gap:6px;font-family:‘DM Mono’,monospace;font-size:10px;color:var(–dim);letter-spacing:.1em;}
#bslider{-webkit-appearance:none;width:70px;height:2px;background:var(–muted);outline:none;border-radius:2px;cursor:pointer;}
#bslider::-webkit-slider-thumb{-webkit-appearance:none;width:12px;height:12px;border-radius:50%;background:var(–accent);cursor:pointer;}
#dc{border-radius:4px;cursor:crosshair;touch-action:none;display:block;}
.dact{display:flex;gap:10px;margin-top:14px;align-items:center;}
.btn-cl{font-family:‘DM Mono’,monospace;font-size:10px;letter-spacing:.15em;color:var(–dim);background:none;border:1px solid var(–muted);padding:8px 18px;cursor:pointer;text-transform:uppercase;transition:all .2s;}
.btn-cl:hover{color:var(–text);border-color:rgba(143,163,138,.3);}

/* S5 Ripple */
#rzone{width:min(300px,82vw);height:min(300px,82vw);border-radius:50%;background:radial-gradient(circle,rgba(143,163,138,.04) 0%,transparent 70%);border:1px solid rgba(143,163,138,.12);position:relative;cursor:pointer;overflow:hidden;flex-shrink:0;transition:border-color .3s;}
#rzone:hover{border-color:rgba(143,163,138,.25);}
.rel{position:absolute;border-radius:50%;border:1px solid rgba(143,163,138,.5);transform:translate(-50%,-50%) scale(0);animation:ro 2.5s ease-out forwards;pointer-events:none;}
@keyframes ro{0%{transform:translate(-50%,-50%) scale(0);opacity:.8}100%{transform:translate(-50%,-50%) scale(4);opacity:0}}
.rdot{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:6px;height:6px;border-radius:50%;background:var(–accent);opacity:.3;}
#tctr{font-family:‘DM Mono’,monospace;font-size:11px;letter-spacing:.15em;color:var(–dim);margin-top:22px;transition:color .3s;}
#dbtn{margin-top:20px;opacity:0;transition:opacity .5s,color .3s;}

/* S6 Close */
#s6 h2{font-size:clamp(26px,7vw,42px);margin-bottom:14px;}
#s6 p{font-size:15px;color:var(–dim);font-style:italic;text-align:center;max-width:300px;line-height:1.8;margin-bottom:44px;}
.ibox{font-family:‘DM Mono’,monospace;font-size:12px;letter-spacing:.08em;color:var(–warm);text-align:center;margin-bottom:40px;max-width:280px;line-height:1.9;padding:18px 24px;border:1px solid rgba(196,168,130,.2);}

body::after{content:’’;position:fixed;inset:0;background-image:url(“data:image/svg+xml,%3Csvg viewBox=‘0 0 256 256’ xmlns=‘http://www.w3.org/2000/svg’%3E%3Cfilter id=‘n’%3E%3CfeTurbulence type=‘fractalNoise’ baseFrequency=‘0.9’ numOctaves=‘4’ stitchTiles=‘stitch’/%3E%3C/filter%3E%3Crect width=‘100%25’ height=‘100%25’ filter=‘url(%23n)’ opacity=‘0.03’/%3E%3C/svg%3E”);pointer-events:none;z-index:200;opacity:.35;}
</style>

</head>
<body>
<canvas id="bgc"></canvas>

<!-- S1: Greeting -->

<div class="screen active" id="s1">
  <div class="time" id="clock"></div>
  <h1>The day<br>is done.</h1>
  <p>You can put it down now.</p>
  <button class="btn-g" onclick="go('s2')">Begin</button>
</div>

<!-- S2: Breathe -->

<div class="screen" id="s2">
  <div class="lbl">Breathe</div>
  <div class="bwrap" id="bwrap">
    <div class="br pulse"></div>
    <div class="br"></div>
    <div class="br inner"></div>
    <div class="btxt" id="btxt">breathe in</div>
  </div>
  <div class="bctr" id="bctr">round 1 of 4</div>
  <button class="lnk" onclick="stopBreath();go('s3')">skip →</button>
</div>

<!-- S3: Write -->

<div class="screen" id="s3">
  <div class="lbl">Release</div>
  <h2>What's still<br>spinning?</h2>
  <p class="sub">Write it all out. It goes nowhere.</p>
  <textarea id="dump" placeholder="the late group… the blocked dock… what I could have said…"></textarea>
  <div class="row">
    <button class="btn-m" onclick="handleDump()">Let it go</button>
    <button class="btn-s" onclick="go('s4')">Nothing tonight</button>
  </div>
</div>

<!-- S4: Draw -->

<div class="screen" id="s4">
  <div class="lbl">Draw</div>
  <h2>Make something.<br>Or just make a mess.</h2>
  <p class="sub">No rules. Your hand moving is enough.</p>
  <div class="toolbar">
    <div class="swatch on" style="background:#8fa38a" data-c="#8fa38a" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#c4a882" data-c="#c4a882" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#a08898" data-c="#a08898" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#7a9eb5" data-c="#7a9eb5" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#c8c4bb" data-c="#c8c4bb" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#e8855a" data-c="#e8855a" onclick="setClr(this)"></div>
    <div class="swatch" style="background:#3d3d40" data-c="#3d3d40" onclick="setClr(this)"></div>
    <div class="bsize">
      size
      <input type="range" id="bslider" min="2" max="28" value="8" oninput="bs=+this.value">
    </div>
  </div>
  <canvas id="dc"></canvas>
  <div class="dact">
    <button class="btn-cl" onclick="clearDraw()">Clear</button>
    <button class="btn-m" style="padding:8px 24px" onclick="go('s5')">Continue →</button>
  </div>
</div>

<!-- S5: Ripple -->

<div class="screen" id="s5">
  <div class="lbl">Release</div>
  <h2>Tap to let things go</h2>
  <p class="sub">Each tap — one less thing to carry</p>
  <div id="rzone" onclick="spawnR(event)" ontouchstart="touchR(event)">
    <div class="rdot"></div>
  </div>
  <div id="tctr">···</div>
  <button id="dbtn" class="lnk" onclick="go('s6')">I'm good →</button>
</div>

<!-- S6: Close -->

<div class="screen" id="s6">
  <h2>Good night,<br>Joseph.</h2>
  <p>You did what needed doing.<br>The rest can wait until tomorrow.</p>
  <div class="ibox" id="ibox">absorb · release · move on</div>
  <button class="lnk" onclick="reset()">start over</button>
</div>

<script>
// clock
function tick(){const n=new Date(),h=String(n.getHours()).padStart(2,'0'),m=String(n.getMinutes()).padStart(2,'0');document.getElementById('clock').textContent=h+':'+m;}
tick();setInterval(tick,30000);

// nav
function go(id){
  document.querySelectorAll('.screen').forEach(s=>s.classList.remove('active'));
  document.getElementById(id).classList.add('active');
  if(id==='s2')startBreath();
  if(id==='s4')initDraw();
  if(id==='s6')showClose();
}

// breathe
let bt=null,bc=0;
const PH=[{l:'breathe in…',d:4000,c:'bin'},{l:'hold…',d:4000,c:'bhold'},{l:'breathe out…',d:6000,c:'bout'}];
function startBreath(){bc=0;runP(0,0);}
function stopBreath(){if(bt)clearTimeout(bt);}
function runP(c,p){
  if(c>=4){setTimeout(()=>go('s3'),600);return;}
  const w=document.getElementById('bwrap'),t=document.getElementById('btxt'),r=document.getElementById('bctr'),ph=PH[p];
  w.className='bwrap '+ph.c;t.textContent=ph.l;r.textContent='round '+(c+1)+' of 4';
  void w.offsetWidth;
  const np=(p+1)%3,nc=np===0?c+1:c;
  bt=setTimeout(()=>runP(nc,np),ph.d);
}

// write
function handleDump(){
  const v=document.getElementById('dump').value.trim();
  if(v){try{const s=JSON.parse(localStorage.getItem('jmc_notes')||'{}');const k=new Date().toLocaleDateString('en-GB');s[k]=(s[k]?s[k]+'\n---\n':'')+v;localStorage.setItem('jmc_notes',JSON.stringify(s));}catch(e){}}
  const ta=document.getElementById('dump');ta.style.opacity='0';ta.style.transform='translateY(-8px)';
  setTimeout(()=>go('s4'),600);
}

// draw
let dctx,drawing=false,bc_clr='#8fa38a',bs=8,lx=0,ly=0;
function initDraw(){
  const c=document.getElementById('dc');
  const mw=Math.min(window.innerWidth-32,480),mh=Math.min(window.innerHeight-310,280);
  c.width=mw;c.height=mh;c.style.width=mw+'px';c.style.height=mh+'px';
  dctx=c.getContext('2d');
  dctx.fillStyle='#1a1a1c';dctx.fillRect(0,0,mw,mh);
  dctx.strokeStyle='rgba(255,255,255,0.025)';dctx.lineWidth=1;
  for(let x=0;x<mw;x+=40){dctx.beginPath();dctx.moveTo(x,0);dctx.lineTo(x,mh);dctx.stroke();}
  for(let y=0;y<mh;y+=40){dctx.beginPath();dctx.moveTo(0,y);dctx.lineTo(mw,y);dctx.stroke();}
  c.onmousedown=e=>{drawing=true;lx=e.offsetX;ly=e.offsetY;dot(lx,ly);};
  c.onmousemove=e=>{if(!drawing)return;line(e.offsetX,e.offsetY);};
  c.onmouseup=c.onmouseleave=()=>{drawing=false;};
  c.addEventListener('touchstart',e=>{e.preventDefault();const t=e.touches[0],r=c.getBoundingClientRect();drawing=true;lx=t.clientX-r.left;ly=t.clientY-r.top;dot(lx,ly);},{passive:false});
  c.addEventListener('touchmove',e=>{e.preventDefault();const t=e.touches[0],r=c.getBoundingClientRect();line(t.clientX-r.left,t.clientY-r.top);},{passive:false});
  c.addEventListener('touchend',()=>{drawing=false;},{passive:false});
}
function dot(x,y){dctx.globalAlpha=.85;dctx.fillStyle=bc_clr;dctx.beginPath();dctx.arc(x,y,bs/2,0,Math.PI*2);dctx.fill();dctx.globalAlpha=1;}
function line(x,y){dctx.globalAlpha=.75;dctx.strokeStyle=bc_clr;dctx.lineWidth=bs;dctx.lineCap='round';dctx.lineJoin='round';dctx.beginPath();dctx.moveTo(lx,ly);dctx.lineTo(x,y);dctx.stroke();dctx.globalAlpha=1;lx=x;ly=y;}
function setClr(el){document.querySelectorAll('.swatch').forEach(s=>s.classList.remove('on'));el.classList.add('on');bc_clr=el.dataset.c;}
function clearDraw(){const c=document.getElementById('dc');dctx.fillStyle='#1a1a1c';dctx.fillRect(0,0,c.width,c.height);dctx.strokeStyle='rgba(255,255,255,0.025)';dctx.lineWidth=1;for(let x=0;x<c.width;x+=40){dctx.beginPath();dctx.moveTo(x,0);dctx.lineTo(x,c.height);dctx.stroke();}for(let y=0;y<c.height;y+=40){dctx.beginPath();dctx.moveTo(0,y);dctx.lineTo(c.width,y);dctx.stroke();}}

// ripple
let tc=0;
function spawnR(e){_rip(e.offsetX,e.offsetY);}
function touchR(e){e.preventDefault();const t=e.touches[0],r=document.getElementById('rzone').getBoundingClientRect();_rip(t.clientX-r.left,t.clientY-r.top);}
function _rip(x,y){
  tc++;
  const z=document.getElementById('rzone'),sz=Math.max(z.offsetWidth,z.offsetHeight)*.6;
  const el=document.createElement('div');el.className='rel';
  el.style.cssText=`left:${x}px;top:${y}px;width:${sz}px;height:${sz}px`;
  z.appendChild(el);el.addEventListener('animationend',()=>el.remove());
  const msgs=['···','···','keep going…','good…','yes…','almost…','there…'];
  const ctr=document.getElementById('tctr');
  ctr.textContent=tc<msgs.length?msgs[tc]:tc+' things released';
  if(tc===3)ctr.style.color='var(--accent)';
  if(tc>=5){const db=document.getElementById('dbtn');db.style.opacity='1';}
}

// close
function showClose(){
  const i=localStorage.getItem('jmc_intention')||'absorb · release · move on';
  document.getElementById('ibox').textContent=i;
}

// reset
function reset(){
  tc=0;stopBreath();
  document.getElementById('tctr').textContent='···';
  document.getElementById('dbtn').style.opacity='0';
  const ta=document.getElementById('dump');ta.value='';ta.style.opacity='1';ta.style.transform='none';
  go('s1');
}

// background orbs
const bgc=document.getElementById('bgc'),bctx=bgc.getContext('2d');let orbs=[];
function initBg(){bgc.width=window.innerWidth;bgc.height=window.innerHeight;orbs=Array.from({length:4},(_,i)=>({x:Math.random()*bgc.width,y:Math.random()*bgc.height,r:160+Math.random()*220,vx:(Math.random()-.5)*.12,vy:(Math.random()-.5)*.12,hue:i<2?120:35,a:.03+Math.random()*.04}));}
function drawBg(){bctx.clearRect(0,0,bgc.width,bgc.height);orbs.forEach(o=>{const g=bctx.createRadialGradient(o.x,o.y,0,o.x,o.y,o.r);g.addColorStop(0,`hsla(${o.hue},25%,55%,${o.a})`);g.addColorStop(1,'hsla(0,0%,0%,0)');bctx.fillStyle=g;bctx.beginPath();bctx.arc(o.x,o.y,o.r,0,Math.PI*2);bctx.fill();o.x+=o.vx;o.y+=o.vy;if(o.x<-o.r)o.x=bgc.width+o.r;if(o.x>bgc.width+o.r)o.x=-o.r;if(o.y<-o.r)o.y=bgc.height+o.r;if(o.y>bgc.height+o.r)o.y=-o.r;});requestAnimationFrame(drawBg);}
initBg();drawBg();window.addEventListener('resize',initBg);
</script>

</body>
</html>
