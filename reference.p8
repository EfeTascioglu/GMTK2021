pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
--the diamond lair (by:ellie)
--see bbs for rea dable .p8
function kr(qo,mr)qo=qo or {}
for k,v in pairs(mr or {})do
qo[k]=v
end
return qo
end
function ok(pd,to,re)re/=iu(pd,to)
return (to.x-pd.x)*re,(to.y-pd.y)*re
end
function is(rb,e)for i,a in pairs(rb or {})do
if (a==e)return i
end
end
function hx(q_,fn)for i=1,#q_ do
fn(sub(q_,i,i),i)end
end
function qn(q_)local lx,s={},1
hx(q_,function(c,i)if c=="\n"then
add(lx,ob(sub(q_,s,i)))s=i
end
end)
return lx
end
function ob(q_,mr)local lx,s,n={},1,1
hx(q_,function(c,i)local sc,rj=sub(q_,s,s),i+1
if c=="="then
n=sub(q_,s,i-1)s=rj
elseif c==","then
lx[n]=sc=='"'and sub(q_,s+1,i-2)or sc!="f"and sub(q_,s,i-1)+0
s=rj
if (type(n)=="number")n+=1
elseif sc!='"'and c==" "or c=="\n"then
s=rj
end
end)
return kr(mr,lx)end
function nv(ou,qh,q)q=q or 3
return ou
and qh+(ou-qh)*q/(q+1)or qh
end
function oz(p)
return p and rnd()<p
end
function pc(rq,pp)
return rnd(pp-rq)+rq
end
function pc0(d)
return pc(-d,d)end
function kg(qx)
return qx[flr(rnd(#qx)+1)]
end
function ma(mr)
return kr({x=pc(1,126),y=pc(81,100)},mr)end
function lp(e,dx,dy,mr)
return kr({x=e.x+(dx or 0),y=e.y+(dy or 0)},mr)end
ke=qn([[
x=1,y=0,c=0,
x=1,y=1,c=0,
x=0,y=1,c=0,
x=-1,y=1,c=0,
x=-1,y=0,c=0,
x=0,y=-1,c=0,
x=0,y=0,c=1,
]])function jw(t,x,y,c,nt)local sx=x-#(t.."")*4*(nt or 0)for sd in all(ke)do
print(t,sx+sd.x,y+sd.y,c*sd.c)end
end
function mn(n,rw,pp,rq)
return mid(flr(n/rw),pp or 32767,rq or 0)end
function mw(ra,ro)
return t%ra<(ro or 1)end
function ho(m)
return abs(m.x-64)<60
end
function gk(no,np)local pt=0x5f80+no*4
poke(pt,peek(pt)+1)poke(pt+1,np/256)poke(pt+2,np)end
ed=ob([[
0,20,20,2,4,3,8,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
20,20,20,2,2,1,1,
0,0,0,0,0,0,0,0,0,
20,20,0,12,11,8,8,0,5,10,33,1,2,11,6,1,9,9,7,12,
]])function it(n)
if (px)return
local py,rk2,rk3=
ed[n+2],ed[stat(18)+2],ed[stat(19)+2]
local ch=rk2<rk3 and 2 or 3
if (py>=min(rk2,rk3))sfx(n,ch)
end
function hj(ph)jp[ph]=jp[ph]or {}
return jp[ph]
end
function bc(ph,oh,op)while ph do
op(hj(ph),oh)ph=mz[ph].pl
end
end
function nc(ph,qm)local oh=n_..""
n_+=1
kr(qm,{rd=oh,qt=ph,t=0
})mt[oh]=qm
bc(ph,oh,add)local kz=mz[ph]
while kz do
setmetatable(qm,{__index=kz})qm,kz=
kz,mz[kz.pl]
end
return oh
end
function dt()
t+=1
for nm,qm in pairs(mt)do
local tick=qm["s_"..
(qm.mh or "tick")]
if (qm.l_ or 0)==0 then
if tick(qm,qm.t)then
mt[nm]=nil
bc(qm.qt,nm,del)end
qm.t+=1
else
qm.l_-=1
end
end
if cg then
fa()cg()cg=nil
end
end
function et(po,e,hw,mj)if po then
jj(e,hw,mj)end
end
function jj(e,hw,mj)
if (e.mh==hw)return
if e.mh=="charge"then
sfx(-1,3)end
kr(e,ob([[
t=0,hurt=f,mp=f,
kl=f,charging=f,
]]))e.mh=hw
if e.jl and hw=="dead"then
e.jl.jb=nil
end
if e.ow then
e.ow.jb=nil
end
if (mj)it(mj)
end
function ne(ln,pk,mc,mr,oh)oh=(oh or n_)..""mo[oh]=
kr(mr,{rd=oh,qh=ln,lq=pk,mc=mc,t=0
})
n_+=1
end
function la(ph,mr,ot,mc)local id=nc(ph,mr)ne(id,ot,mc)
return mt[id]
end
function ds()local jq={},0,0
for nm,vw in pairs(mo)do
local qh=mt[vw.qh]
if qh then
local qe=vw.mc or flr(qh.y)or o
jq[qe]=
jq[qe]or {}
add(jq[qe],vw)else
mo[nm]=nil
end
end
for qe=0,129 do
for v in all(jq[qe])do
bt()if v.lq(mt[v.qh],v)then
mo[v.rd]=nil
end
v.t+=1
end
end
end
function gx(e,hb,ph,qs)add(bz,{qm=e,rg=ix[hb],qt=ph,qs=qs or ph})end
function bq()for c in all(bz)do
local qm,rg=
c.qm,fp(c.rg,c.qm)for jh in all(hj(c.qt))do
local qh=mt[jh]
local nw=qh:nw()if nw and
iz(rg,fp(nw,qh))then
local cb=qm["hit_"..c.qs]
if (cb)cb(qm,qh)
end
end
end
bz={}
end
function fp(b,e)local f=e.qc<0
return {x1=e.x+(f and -b.x2 or b.x1),y1=e.y+b.y1,x2=e.x+(f and -b.x1 or b.x2),y2=e.y+b.y2
}
end
function iz(b1,b2)
return
b1.x2>=b2.x1 and
b2.x2>=b1.x1 and
b1.y2>=b2.y1 and
b2.y2>=b1.y1
end
function eq(jz,qp,ph)
if (not qp or qp<1 or not jz)return
local p=jz[flr(min(qp,#jz))]
for i=0,15 do
local mb=p[(kc[i]or i)+1]
pal(i,mb,ph or 0)kc[i]=mb
end
end
function bt()pal()palt(0,false)palt(3,true)kc={}
end
fm=qn([[
0,0,0,3,2,5,5,6,8,9,9,11,12,1,8,9,
0,0,0,1,2,1,5,5,2,4,4,3,13,1,4,4,
0,0,0,0,0,0,1,1,1,2,2,1,1,0,2,2,
0,0,0,0,0,0,1,5,0,0,0,0,0,0,0,0,
]])function lz(ow,n,mk)ow.ps,ow.kb={},mk
for i=1,flr(n)do
add(ow.ps,mk())end
return la("ow",ow,hc)end
function dj(ow)local ps=ow.ps
for p in all(ps)do
hs(p,ow)
p.og-=ow.lk
if (not ow.oq)cq(p)
if p.og<0 then
del(ps,p)end
ow.y=p.y
end
if oz(ow.jb)then
local p=ow.kb()
if (p)add(ps,p)
end
return #ps==0 and not ow.jb
end
function hc(ow)for p in all(ow.ps)do
local mp,rx,ry=
mn(1-p.og,0.25,3),p.x,p.y+p.z
local qq=mp>0 and
fm[mp][p.qq+1]or
p.qq
if p.kp then
jw(p.kp,rx,ry,qq)elseif p.lf then
local r=min(1,1-p.og)*p.lf
oo(rx,ry,r,r,2,qq)else
pset(rx,ry,qq)end
end
end
function im(qm,ow)camera()cls(3)h_(qm.qt,16-qm.nu*4,31,2,qm.mh,qm.qc<0)local pi=qm.nu>=3
and 2 or 1
for y=31,0,-1 do
for x=y%pi,31,pi do
local qi,ql=pget(x,y),pc0(1)if qi!=3 then
add(ow.ps,lp(qm,x-16+rnd(pi-0.9),ql,{z=qm.z+y-32-ql,vx=qm.vx*pc(0.05,0.25),vy=qm.vy,vz=-0.5,og=1,qq=qi
}
))end
end
end
end
function ka(e,dx,dy,dz,r,qq)local mr=ob([[
nz=0.5,oa=1,
os=0,qa=1,
ry=0,
]],{rx=r,rz=r,qq=qq,oe=-r/8,on=-r/16
})
return lz(ob([[
jb=1,lk=0.15,
oi=1,p_=0,
]]),0,function()
return nn(lp(e,e.qc*dx,dy),dz,mr
)()end
)end
function nn(rr,z,p)
return function()local a,d,s=
pc(p.os,p.qa),pc(p.nz,p.oa),pc(p.oe,p.on)local va=p.ls or a
return lp(rr,p.rx*d*sin(a),p.ry*d*cos(a),{z=(rr.z or 0)+z+p.rz*d*cos(a),vx=s*sin(va),vy=0,vz=s*cos(va),og=1,qq=p.qq
})end
end
function lh(pb,qq,lr,sy,md,lw,nx)local sx,i=62-#pb*2,0
local ow=lz(ob([[
p_=0.4,oi=1,
ku=0.4,
oq=1,
jb=1,
]],{lk=lr==0
and 0 or 0.08
}))ow.kb=function()if i>=#pb then
ow.jb=nil
elseif mw(md or 1)then
i+=1
return ob([[
vx=0,vy=0,vz=0,
]],{x=sx+i*4,y=sy or 30,z=(-8-rnd(2))*(lw or 1),og=1+(lr or 30)*0.07-(nx or 0)*i,qq=qq,kp=sub(pb,i,i)})end
end
end
jc={}
function bm()rp,jo,ih=
{},{},{}
for b=0,5 do
if btn(b)then
rp[b]=true
if not jc[b]then
jo[b]=true
if jn==b and
t-d_<9 then
ih[b]=true
else
jn,d_=b,t
end
end
end
end
jc=rp
end
diff,er=2,qn([[
oh="friendly",pg=0.1,qj=1.2,ia=0.4,mini1="wc",mini2="t",ie=150,gf=10,jx=15,ir=1,ic=5.5,
oh="normal",pg=0.1,qj=1.5,ia=0.5,mini1="t",mini2="e",ie=150,gf=8,jx=12,ir=1,ic=7,
oh="hard",pg=1,qj=1.5,ia=0.5,mini1="tc",mini2="ecc",ie=140,gf=8,jx=10,ir=1.3,ic=8,
oh="nightmare",pg=1.3,qj=2.5,ia=0.6,mini1="tt",mini2="ewc",ie=125,gf=6,jx=10,ir=1.5,ic=8,
oh="hell!",pg=2.5,qj=3.3,ia=0.4,mini1="ttw",mini2="eeww",ie=110,gf=5,jx=10,ir=1.7,ic=10,
]])function bb()la("nk",{},gp)music(0)for i=1,5 do
gk(i,dget(i))end
end
function dm(rs)et(jo[4],rs,"pick",55
)end
function di(rs)for i=0,1 do
if jo[i]then
diff=mid(diff+i*2-1,1,5)it(55)end
end
if jo[4]then
cg=co
it(55)end
end
function gp(rs,v)rs.dy=nv(rs.dy,rs.mh and 0.5 or -8)camera(0,rs.dy)rectfill(-127,58,127,58,1)hf(63,35,25)eq(fm,4)spr(140,48,32,4,4)print("the",58,15,0)spr(114,53,21,3,1)bt()gg(64,59,48)if not rs.mh then
if rs.t>60
and mw(60,30)then
jw("press 🅾️ to start",30,85,13)end
print([[
gfx,code,design        @krajzeg
hacked by									ellie
music,sfx         @gruber_music
]],2,102,1)else
camera(0,rs.dy*5)local qd=dget(diff)rectfill(64,87,64,qd>0 and 123 or 108,1)print("difficulty",17,92,13)print(er[diff].oh,69,100,1)if qd>0 then
print("best",17,113,13)spr(57+qd,69,112)end
spr(12,-t/5%3,92)spr(13,120+t/5%3,92)for i=1,5 do
bt()local d=0
if i<=diff then
d=1
eq(hl,i>=4 and 3 or 0)else
eq(fm,3)end
spr(1,60+i*8,90.5+cos(t/20+i*0.4)*d)end
end
end
ij=qn([[
x=0,y=0,r=4,c=0,
x=-1,y=0,r=0,c=15,
x=1,y=0,r=0,c=15,
x=0,y=-1,r=-1,c=7,
]])function hf(cx,cy,r)for p in all(ij)do
circfill(cx+p.x,cy+p.y,r+p.r,p.c)end
end
ei=qn([[
w=1,qq=1,
w=0.33,qq=13,
w=0.2,qq=15,
]])function gg(sx,sy,oj)for y=1,17 do
local ql=peek(y+0x29ee)%26/26
local w=sin(t*(0.008+0.004*ql)+ql
)*(1-y*0.055)*oj
for s in all(ei)do
rectfill(sx-w*s.w,sy+y,sx+w*s.w,sy+y,s.qq)end
end
end
function dd(p)jg(p,1,true)fz(p)p.charge=0
et(jo[4],p,"charge")b_(p)end
function e_(p,tm)fz(p)if is(jo,true)then
jj(p,"default")dd(p)end
et(kw(p),p,"default")end
function bs(p,tm)p.qc=1
iw(p,2,0)if tm==15 then
music(32)lh(mq.qy
and "quest complete"or "stage complete",9,0)dset(63,1)end
end
function dg(p,tm)jg(p,0.5,false)fz(p)if tm==5 then
p.ow=
ka(p,-7,1,-16,8,12)sfx(63,3)end
if tm>=5 then
p.mp={ev,abs(sin(t/10)*(p.charge/10.6))}
if (not mq.pf)p.hit_t+=1
if p.charge<40 then
p.charge+=1
else
p.ow.jb=nil
end
end
if not rp[4]then
p.vx=p.qc*(1+p.charge*0.11)jj(p,"stab",58)end
end
function dh(p,tm)jg(p,0.5,false)fz(p)et(not rp[5],p,"default")et(jo[4],p,"charge")gx(p,9,"proj")end
function ep(p,tm)fz(p)b_(p)if kw(p)and tm>=3 then
jj(p,"default")else
gx(p,5,"monster")end
end
function fq(p,tm)fo(p,tm)b_(p)end
function b_(p)if rp[5]then
jj(p,"shield")end
for b=1,4 do
if ih[b-1]then
p.vx,p.vy,p.jv=
pm[b].x*2.5,pm[b].y*2.5,t
jj(p,"dash",58)end
end
end
function dr(p,pr)if pr.vx!=0 and pr.z>-16 then
pr.vx*=-0.7
it(59)end
end
function ff(p,m)local qv=(p.qv+p.ga)*(1+p.charge/30)ne(m.rd,ii,129,{qc=true},"lasthit")if hm(p,m,qv)then
p.ga+=1
p.gl,p.hit_t=
max(p.gl,p.ga),t
ne(p.rd,ge,129,{ol=-70},"combo")end
end
function dp(p,m,qv)if p.mh=="shield"and sgn(m.x-p.x)==p.qc
and not m.kd then
p.vx,p.vy=ok(m,p,min(qv*0.25,6))it(54)if m.monster then
m.vx,m.jv=-m.qc*1.5,t
jj(m,"dizzy")end
return true
end
p.ec+=qv
end
function hm(e,qh,qv)
qv-=qh.nj
e.hurt=e.hurt or {}
if is(e.hurt,qh)then
return
end
add(e.hurt,qh)local rm,hz=
#e.hurt+2,qh==rt
if qh.hd
and qh:hd(e,qv)then
return
end
if hz then
qh.bk=t+10
end
qh.kq+=qv
et(not (qh.km or e.kd),qh,"hurt")qh.hq=t
it(hz
and 5 or flr(pc(60,62)))if not e.kd then
qh.vx,qh.vy=ok(e,qh,min(qv/qh.le,6))e.l_,qh.l_=rm,rm
end
nq=hz and 4 or 2
return true
end
function fz(p)if mq.pf then
local ms=min(p.x-56,3)if ms>0
and p.dx>0 then
p.ht=0
mq.x-=ms*mq.qf
p.x-=ms
if (p.x>56)p.x-=1
else
p.ht+=1
end
else
p.gv+=0.3334
end
if t-p.hit_t>=40 then
p.ga=0
end
gr(p)end
pm=qn([[
x=-1.5,y=0,
x=1.5,y=0,
x=0,y=-1,
x=0,y=1,
]])function jg(p,rl,hr)local dx,dy=0,0
for i,d in pairs(pm)do
if rp[i-1]then
dx+=d.x*rl
dy+=d.y*rl
end
end
if dx!=0 and hr then
p.qc=sgn(dx)end
iw(p,dx,dy)if p.kl and
mw(12)and
mq.qy and
mq.x>-256 then
it(59)end
end
function cf(m,tm)et(oz(0.005*tm)or
ho(m),m,"stalk",56)end
function de(m)local dx,dy=ok(m,rt,m.rl)m.mx,m.my=
nv(m.mx,dx),nv(m.my,dy)m.qc=sgn(m.mx)iw(m,m.mx,m.my)gr(m)if iu(m,rt)<16 then
m.vx,m.vy=
m.mx*2.5,m.my*2.5
jj(m,"jump",56)end
end
function ef(m,tm)gr(m)gx(m,2,"player")et(tm>pc(35,65),m,"stalk")end
function bj()while not mt[na]or
mt[na].mh!="default"do
na=kg(hj("monster"))end
end
function cs(m)if m.rd==na then
m.qh=lp(rt,-m.qc*12)else
local d,a=
iu(m,rt)rnd()m.qh=lp(rt,sin(a)*d*0.33,cos(a)*d*0.25
)end
cq(m.qh)end
function bv(m)local bx=m.qc>0 and 30 or 97
m.qh=ma({x=bx+pc0(25)}
)end
function bh(m,tm)ci(m)if m.j_ then
m:es()end
if oz(0.0015*tm)and ho(m)then
m.qz=lp(rt)jj(m,"ready")end
end
function iy(m,p,s,pu,pj,qb)local pw=mid(sqrt(iu(m,p))*
pc(pu,pj),1.3,qb or 1000
)s.vx,s.vy=ok(m,p,pw)
if (abs(s.vx)<0.15)s.vx=0.15*m.qc
return pw
end
function cm(m,tm)if abs(tm-16)<=1 then
for i=1,m.kh do
local dy=pc0(m.nh*0.75)local sp=la(m.kv,lp(m,m.qc*4+pc0(m.nh),dy,{z=-pc(8,12),c=dy>0
and ob([[fg=3,bg=1,]])
or ob([[fg=11,bg=3,]])
}
),
m.kv=="ny"
and g_
or br
)
sp.vz=m.nf*iy(
m,m.qz,sp,
m.jm*0.997,
m.jm*1.003,
m.kj
)
end
end
if tm==16 then
it(m.nb)
end
et(tm==32,
m,"default")
end
function ck(s,tm)
return
oz(
#hj("monster")==0
and 0.5
or tm*0.0005
)
end
function g_(s)
local x,y,c=s.x,s.y,s.c
if s.z<0 then
pset(x,y,0)
pset(x,y+s.z,c.fg)
else
rectfill(x-2,y,
x+2,y+1,c.bg)
rectfill(x-1,y,
x+1,y,c.fg)
end
end
function ct(m,tm)
ci(m)
if iu(m,rt)<30 then
m.pn+=1
et(
oz(m.pn/130),
m,"ready",50)
else
m.pn=0
et(
oz(tm/2500)
and ho(m),
m,"shoot",49)
end
end
function en(m,tm)
ft(m)
if tm==20 then
m.vx-=m.qc*2.5
for i=1,2 do
local db=la("i_",
lp(m,0,1,ob([[
z=-16,vz=-0.5,og=100,
]])),br)iy(m,rt,db,0.45+i*0.15,0.6+i*0.15)end
jj(m,"default")end
end
function ek(m,tm)ft(m)kr(m,lp(m.pg,pc0(tm/9),pc0(tm/9)))if tm>m.ib then
pa(m,ob([[
ro=17,qv=10,qq=12,
ko=17,w=18,
]]))jj(m,"default")end
gr(m)end
function ft(m)if m.t==1 then
m.ow,m.pg,m.ib=
ka(m,0,2,-16,15,7),lp(m),pc(15,25)end
end
function hu(p,tm)hs(p,p)cq(p)if p.z>=0 then
if p:he(tm)then
jj(p,"dead")
return true
end
gx(p,p.iv,"player")end
end
function br(p)
if (p.og<13 and mw(2))return
oo(p.x,p.y,4,1.2,4,p.fs)spr(p.lj,p.x-4,p.y+p.z+p.dy)end
function cu(d)pa(d,d.hg)
return true
end
function gu(fb,tm)if not fb.jl then
fb.jl=lz(ob([[
p_=0,oi=1,
jb=1,lk=0.1,
oq=1,
]]),0,nn(fb,-1,ob([[
rx=3,ry=0,rz=3,
qq=10,oe=0,on=0.01,
nz=0.1,oa=1,
os=0,qa=1,
]])))end
if tm>3 then
gx(fb,14,"player")end
return hu(fb,tm)end
function bi(p)
p.og-=1
return p.og<=0
end
function cp(p)if p.qt=="gt"then
rt.qv+=1
else
rt.kq=max(rt.kq-8,0)end
p.og,rt.jv=0,t
lh(p.rf,p.qq,15)it(3)pa(p,ob([[
ro=0,qv=0,qq=7,
ko=8,w=9,
]]))lz(ob([[
lk=0.05,oi=0.92,
p_=0,oq=1,
]]),16,nn(p,0,ob([[
rx=7,ry=4,rz=0,
oe=1,on=2,
nz=0.999,oa=1.0,
os=0,qa=1,
ls=0.5,
]],p)))end
function pa(c,mr)local ro=mr.ro
la("nd",kr(lp(c),mr),gm,1
).r=1
lz(ob([[
oi=1,p_=0.4,lk=0.07,
]]),ro,function()local ns=rnd()
return lp(c,0,0,ob([[
z=0,og=1,
]],{vx=sin(ns)*0.1*ro,vy=cos(ns)*0.1*ro,vz=-pc(0,5),qq=mr.qq
}))end
)nq=ro/4
end
function fr(b,tm)if tm==0 and b.ro>0 then
it(62)end
b.r+=b.ko
b.ko*=0.5
if b.ko>0.4
and rt:nw()and iu({x=rt.x,y=rt.y*3},{x=b.x,y=b.y*3}
)<b.r
then
b:hit_player(rt)end
b.w-=1
return b.w<=0
end
function gm(b)eq(fm,min(b.t/4,2))clip(0,80,127,22)oo(b.x,b.y,b.r,b.r*0.33,b.w,b.qq)clip()end
function oo(x,y,rx,ry,w,qq)local dx=rx
for dy=0,ry do
while
dx*dx/rx/rx+dy*dy/ry/ry>1 do
dx-=1
end
for mx=-1,1,2 do
for my=-1,1,2 do
local ly=y+my*dy
rectfill(x+mx*dx,ly,x+mx*(dx-min(dx,w)),ly,qq)end
end
end
end
function bl(m)ci(m)if m.rd==na then
m:es()end
end
function ci(m)bj()m.j_=
gw(m,m.qh)if m.j_ and oz(0.05)or not m.qh then
m:es()end
m.qc=sgn(rt.x-m.x)gx(m,m.eb,"player","radar")gr(m)end
function dv(m,tm)if tm==1 then
m.ow=lz(ob([[
p_=0,oi=1,lk=0.2,
jb=1,
]]),0,function()
return nn(lp(m,0,1),-m.lw*8-2,ob([[
rx=4,ry=0.1,rz=2,
qq=10,
oe=0.2,on=0.4,
nz=0.99,oa=1,
os=0,qa=1,
ls=0.25,
]]))()end)end
gr(m)et(tm>m.fh+10,m,"default")end
function cw(m,tm)m.kl=nil
gr(m)if tm>=m.du then
m.vx,m.vy=m.ax,m.ay
if m.ki then
m:ki()end
jj(m,"stab",m.je)end
end
function df(m,tm)gr(m)if tm<m.ew then
gx(m,m.ey,"player")end
et(tm>m.fh,m,"default")end
function dn(m,p)m.ax,m.ay=ok(m,p,m.kn)et(m.mh!="hurt",m,"ready")end
function gw(m,t)if t then
if iu(m,t)<2 then
m.kl=nil
return true
end
local dx,dy=ok(m,t,m.rl)iw(m,dx,dy*0.666)end
end
function eh(s)
s.x+=s.qc*8
pa(lp(s,s.qc*20),ob([[
ro=10,qv=5,qq=8,
ko=8,w=9,
]]))end
function cc(w,tm)w.jl=w.jl or lz(ob([[
p_=0,oi=1,
jb=0.6,lk=0.06,
oq=1,
]]),0,nn(w,-10,ob([[
rx=6,ry=2,rz=8,
qq=12,oe=0,on=0.01,
nz=0.5,oa=1,
os=0,qa=1,
]])))if oz(tm*0.0006)then
w.fe=function()
return lp(rt,ok(w,rt,25))end
jj(w,"teleport",32)else
bl(w,tm)end
end
function ce(b,tm)ea={fm,mn(150-tm,5,2)}
if tm==0 then
boss=b
kr(b,ob([[
x=64,y=79,z=-167.5,
]]))music(-1)hm(b,rt,15)rt.kq,rt.ec,rt.gh=
0,0,2
lz(ob([[
p_=0,oi=1,lk=0.07,
jb=1,oq=1
]]),0,function()
return not b.gi
and nn(b,b.z-16,ob([[
rx=19,ry=0,rz=19,
qq=15,
oe=0,on=0,
nz=1,oa=1,
os=0.125,qa=0.875,
]]))()end
)end
if tm==40 then
music(23,0,3)lh("this will be far enough.",14,80,110,2,0.2,0.12)end
if mw(ju.gf)and abs(tm-150)<=50 then
cn()end
if tm==230 then
jj(b,"idle")b.t=90
end
if tm>=65 then
b.z+=2.7879-b.t/82.5
end
end
function ej(b,tm)if tm==1 then
music(-1)b.z,b.hh=
0,lz(ob([[
p_=0,oi=0.9,lk=0.1,
oq=1,
jb=0,
]]))local c=10
for _,m in pairs(mt)do
if m.monster then
m.l_,m.kl,m.kq=c,false,1000
c+=10
end
end
end
b.x,b.y=
pc(62,66),pc(79,82)if tm<=135 then
add(b.hh.ps,ob([[
vx=0,vy=0,vz=-2,
og=1,qq=12,
]],lp(b,pc0(15),4,{z=-pc(2,29),lf=pc(2,6)})))
if (mw(6))it(62)
end
if tm==120 then
ez(b,1)b.ba=false
end
return tm==210
end
function em(b,tm)if b.z<-5 then
b.z=nv(b.z,0,20)else
ni(b)end
if tm>=ju.ie and
#hj("monster")<5 then
jj(b,"summon")end
cz(b)end
function cz(b)if b.gi then
ea={ev,9-t+b.gi}
et(t-b.gi>150,b,"retreat")end
gr(b)end
function bp(b,tm)b.z=nv(b.z,-40,20)if mw(ju.gf)then
cn()end
if tm==30 then
b.gi=nil
end
et(tm==60,b,"idle")end
function dc(b,tm)ni(b)if tm==1 then
b.ow=ka(b,-13,2,-26,25,15)it(48)end
if tm==20 then
hx(kg(eg[diff]),fu
)jj(b,"idle")end
cz(b)end
function cn()la("i_",ma(ob([[
z=-180,p_=0.5,og=100,
]])),br
)end
function fu(ru)local rr=ma({x=(rt.x+pc(56,72))%128
})kr(la(ig[ru],rr,dk),ob([[
t=15,mh="teleport",
]]))lz(ob([[
p_=0,lk=0.05,
oi=0.92,
]]),16,nn(rr,0,ob([[
rx=9,ry=5,rz=0,
qq=15,
oe=1.0,on=2.0,
nz=0.999,oa=1.0,
os=0,qa=1,
ls=0.5,
]])))end
function cr(b,p,qv)if b.gi then
b.gi-=qv*2
else
it(53)rt.vx,rt.vy=
ok(b,rt,4)if #hj("crst")==0 then
fu("y")end
ne(b.rd,fj,85)
return true
end
end
eo=qn([[
dx=-20,dy=-31,fx=f,fy=f,
dx=12,dy=-31,fx=1,fy=f,
dx=-20,dy=-15,fx=f,fy=1,
dx=12,dy=-15,fx=1,fy=1,
]])function fj(b,v)local p=v.t/2-3
eq(p<0 and
ev or fm,abs(p))for s in all(eo)do
spr(170,b.x+s.dx,b.y+b.z+s.dy,1,2,s.fx,s.fy)end
return v.t>=12
end
function ni(c)c.z=sin(t/60)*2.5-2.5
end
function cj(c,tm)et(oz(tm/4000)or
t-c.hq<10,c,"teleport")gr(c)end
function dl(c,e,qv)if c.kq+qv>=c.me then
boss.gi=t
it(57)end
end
function bo(c,tm)if tm<7 or tm>14 then
c.mp={ev,7-tm%14}
else
c.mp={fm,tm-7}
end
if tm==14 then
kr(c,(c.fe
or ma)())end
et(tm==21,c,"default")gr(c)end
function mv(qm)
qm.x+=qm.vx
qm.y+=qm.vy
qm.vx*=qm.oi
qm.vy*=qm.oi
if abs(qm.vx)+abs(qm.vy)<0.5 then
qm.vx,qm.vy=0,0
end
end
function kw(qm)
return qm.vx==0 and qm.vy==0
end
function cq(v)if not v.monster then
v.x=mid(v.x,0,127)end
v.y=mid(v.y,80,101)end
function hs(p,ng)local oi,ku=
ng.oi,ng.ku
p.x+=p.vx
p.y+=p.vy
p.z+=p.vz
p.vx*=oi
p.vy*=oi
p.vz=p.vz*oi+ng.p_
if ku and p.z>0 then
p.z*=-ku
p.vz*=-ku
p.vx*=ku
if abs(p.vz)<1 then
p.vx,p.vy,p.vz,p.z=0,0,0,0
end
end
end
function fo(c,tm)et(tm>c.fk,c,"default")gr(c)end
function ez(c,tm)c.dead=true
if tm==1 then
im(c,lz(ob([[
p_=0.4,ku=0.4,
oi=0.96,lk=0.025,
]])))if c.hn then
rt.hv+=pc(1,1.25)
if rt.hv>=ju.ic then
rt.hv-=ju.ic
local p,a=la(oz(rt.kq/24)and "kx"or "gt",ob([[
z=-10,vz=-1.5,
og=75,
]],lp(c)),br
),rnd()p.vx,p.vy=sin(a)*2,cos(a)end
end
end
return tm>45 and c!=rt
end
function iw(c,dx,dy)c.dx,c.kl=
dx,abs(dx)+abs(dy)>0.01
and (c.kl or t)
c.x+=dx
c.y+=dy
end
function gr(c)mv(c)
if (c!=boss)cq(c)
if (c.lo)ni(c)
et(c.kq>=c.me,c,"dead")end
function js(sa,qh)if sa.qv>0 then
hm(sa,qh,sa.qv)end
end
function jf(c)
return c.z>=-5
and t>=c.bk
and not is({"dash","hurt","dead","teleport"},c.mh
)and ix[c.mh=="shield"and 15
or c.nu
]
end
function iu(c1,c2)local dx,dy=
c1.x-c2.x,c1.y-c2.y
return sqrt(dx*dx+dy*dy)end
function kk(lv)if lv.qr then
eq(lv.qr,t/2%#lv.qr+1)end
bu(lv.x,lv.fl,lv.cl)if lv.bg then
lv.bg(lv.x)end
fc(lv.ky,lv.x)local qw=rt.ht%45
if rt.ht>=90
and qw<23 then
eq(ev,4-qw)spr(7,115,42)jw("go!",114,51,9)
if (qw==0)it(55)
end
end
function fc(ky,li)for l in all(ky)do
local pe=-li*l[1]
map(l[3]+(flr(pe/8)%112),l[4],-flr(pe%8),l[2],17,l[5])end
end
function ca(ql)hf(102,38,17)rectfill(0,50,127,50,1)rectfill(0,51,127,60,0)gg(102,51,38)if mq.x>-200 and
dget(63)==0 then
jw([[
attack:         🅾️
shield:    hold ❎
charge:    hold 🅾️
dash: ➡️➡️,⬆️⬆️,..
]],55,102,13)end
end
function bu(li,fl,cl)li%=16
dw(80,24,fl,1,li)rect(0,105,128,105,1)if cl then
dw(37,6,cl,-1,li)end
end
function dw(y,h,qk,ml,li)for oy=0,h-1 do
local m_=1+oy/h
local dx=16*m_
for sx=64-m_*(80-li),128,dx do
sspr(0,qk+oy,16,1,sx,y+ml*oy,dx+1,1
)end
end
end
eu=qn([[
1,2,1,3,
1,2,
]])hy={mu={false},pq={}
}
function rc(pq,mu,mr)
return kr({mu=qn(mu or ""),pq=qn(pq)},mr)end
gj={player={pg=2,charge=rc([[
192,-1,-18,1,2,
]],[[
7,-15,9,16,
0,-2,15,3,
]]),shield=rc([[
4,0,-15,2,2,
]],[[
0,-2,11,3,
0,0,16,1,
]],{ld=2
}),dash=rc([[
192,-1,-18,1,2,
]],[[
7,-15,9,16,
0,-2,15,3,
]],{nr=2,}),stab=rc([[
193,0,-15,3,2,
]])},boss=ob([[
pg=140,
kf=1,
default="summon",
retreat="summon",
]],{idle=hy,summon=rc([[
139,2,-31,1,3,
]],[[
10,-31,32,32,
0,-7,32,8,
]]),dead={pq=qn([[
138,11,-31,1,2,
]]),mu={false}
}
}),crst=ob([[
pg=234,kf=1,
]]),skel={pg=206,stab=rc([[
224,4,-15,2,2,
146,15,-9,1,1,
]],[[
0,-15,4,16,
]]),ready=rc([[
226,0,-15,2,2,
]])},capt={pg=206,jr=qn([[
0,1,1,3,5,4,9,7,12,6,10,11,12,13,14,15,
]]),default=rc([[
6,4,-18,1,1,
]],[[
0,-15,16,16,
]]),stab=rc([[
224,4,-15,2,2,
146,15,-9,1,1,
6,4,-18,1,1,
]],[[
0,-15,4,16,
]]),ready=rc([[
226,0,-15,2,2,
162,4,-18,1,1,
]]),},wrth={pg=8,stab=rc([[
10,2,-15,2,2,
]]),ready=rc([[
42,0,-15,2,1,
]],[[
0,-7,16,8,
]])},ston={pg=132,stab=rc([[
36,0,-15,4,2,
]]),ready=rc([[
212,0,-23,3,3,
]])},eldr=ob([[
pg=151,
shoot="ready",
]],{ready=rc([[
135,0,-15,3,1,
]],[[
0,-23,24,8,
0,-7,24,8,
]])}),blch={pg=203,ready=rc([[
202,0,-15,1,2,
]])},frsp={pg=203,jr=qn([[
0,1,2,3,2,5,6,7,8,8,14,11,12,13,14,15,
]]),ready=rc([[
202,0,-15,1,2,
]])},felm={pg=204,jump=rc([[
252,0,-7,2,1,
]])}
}
ix=qn([[
x1=-4,y1=-2,x2=3,y2=2,
x1=-6,y1=-2,x2=5,y2=2,
x1=-10,y1=-2,x2=9,y2=2,
x1=-14,y1=-2,x2=13,y2=2,
x1=6,y1=-3,x2=14,y2=3,
x1=0,y1=0,x2=0,y2=0,
x1=8,y1=-4,x2=18,y2=4,
x1=7,y1=-2,x2=13,y2=2,
x1=4,y1=-4,x2=9,y2=4,
x1=10,y1=-3,x2=30,y2=3,
x1=0,y1=-2,x2=9,y2=2,
x1=1,y1=-3,x2=20,y2=3,
x1=8,y1=-4,x2=22,y2=4,
x1=-1,y1=-1,x2=1,y2=1,
x1=-6,y1=-3,x2=6,y2=3,
]])ip=qn([[
0,1,2,ov=0,pz=7,ox=1,
1,2,3,ov=1,pz=7,ox=1,
1,3,5,ov=1,pz=15,ox=2,
1,1,1,ov=1,pz=23,ox=3,
0,2,ov=0,pz=15,ox=2,
2,3,4,ov=2,pz=7,ox=1,
]])function h_(ph,x,y,nr,lg,jt,mp)local fd,qt=
gj[ph],mz[ph]
local rc=fd[lg]
or fd.default or hy
while type(rc)=="string"do
rc=fd[rc]
end
local nu,lw=
qt.nu,qt.lw
local om=ip[qt.hk or lw
]
if (fd.kf)nr=nil
nr=rc.nr
or nr
or rc.ld
or 1
eq(fd.jr,1)if mp then
eq(mp[1],mp[2])end
for r_ in all(rc.mu)do
if r_ then
clip(jt
and x+nu*8-r_[1]-r_[3]
or x+r_[1],y+r_[2],r_[3],r_[4]
)end
spr(fd.pg,x,y-lw*8+1,nu,om.ov,jt)spr(fd.pg+om[nr]*16,x,y-om.pz,nu,om.ox,jt
)end
clip()for rh in all(rc.pq)do
spr(rh[1],jt
and x+(nu-rh[4])*8-rh[2]
or x+rh[2],y+rh[3],rh[4],rh[5],jt
)end
end
hl=qn([[
0,5,2,5,4,2,9,15,8,8,15,7,14,8,14,14,
0,2,2,2,8,2,8,14,8,8,14,14,14,8,14,14,
0,2,2,2,8,2,8,8,8,8,8,8,8,8,8,8,
]])f_=qn([[
0,0,1,1,5,1,13,15,4,6,15,15,13,5,13,13,
]])ev=qn([[
0,13,8,11,9,6,7,7,14,10,7,10,7,12,7,7,
0,12,14,10,10,7,7,7,15,7,7,7,7,7,7,7,
0,12,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
1,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
]])function dk(c,v)if c.dead and not c.ba then
return
end
local nr=nil
if c.kl then
local wc=eu[c.gc]
nr=wc[flr((t-c.kl)/c.gh
)%#wc+1]
end
if is({"hurt","ready"},c.mh
)then
nr=2
end
local fx,fy,fw=
c.x-c.nu*4,c.y,c.nu*8-2
oo(c.x-1,fy+1,fw/2,1.97,fw,0)
fy+=c.z
local by=fy-c.lw*8-1
+c.il
if c.qt!="boss"then
iq(fx+2,by,fx+fw-1,by,c.me-c.kq,c.me,8,2)end
local gq,fi=
mn(11-t+c.hq,3),mn(11-t+c.jv,3)h_(c.qt,fx,fy,nr,c.mh,c.qc<0,gq>0
and {c.k_ and ev or hl,gq}
or fi>0
and {ev,fi}
or c.mp
)end
function iq(x1,y1,x2,y2,ri,kt,fg,bg)rectfill(x1-1,y1-1,x2+1,y2+1,0)rectfill(x1,y1,x2,y2,bg)local w=flr(ri/kt*abs(x2-x1))if w>0 then
rectfill(x1,y1,x1+w*sgn(x2-x1),y2,fg)end
end
function ii(c,v)local f=v.qc
if c.dead and mw(6,3)then
return c.t>=41
end
clip(0,0,128,10)h_(c.qt,f and 128-c.nu*8 or 0,c.lw*8-1-c.il,1,"idle",f)bt()v.hp=nv(v.hp,c.me-c.kq)local bw,mm=
mid(c.me,21,60),flr(max(v.hp+0.5,0)).."/"..c.me
iq(f and 127 or 0,11,f and 128-bw or bw-1,15,v.hp,c.me,8,1)print(mm,f and 128-#mm*4 or 2,11,14)spr(28,16,2)print(flr(rt.qv*(1+rt.charge/30)),24,3,13
)end
function ge(p,v)if v.t<25 or mw(2)and p.ga>0 then
v.ol/=2
jw(p.ga.." \72\73\84",v.ol+1.99,32,8)print("+"..p.ga,32-v.ol/4,3,5)end
end
mg={ob([[
o_="fights took",
oh="gv",
gn=500,
hi=-10,
gy=0,
gz=32767,
]],{lt="\83"}),ob([[
o_="damage taken",
oh="ec",
lt="",
gn=500,
hi=-15,
gy=0.25,
gs=0,
gz=32767,
]]),ob([[
o_="best combo",
oh="gl",
gn=0,
hi=85,
gy=-4,
gs=0,
gz=20,
]],{lt="\88"})}
ha=ob([[
-1,480,960,1200,1440,
]])function el()rt.ga,rt.gv=
0,flr(rt.gv)/10
jj(mq,"done")jj(rt,"walk_off")local jy={}
mg[1].gs=mq.qg*ju.ir
for st in all(mg)do
st.np=rt[st.oh]
local v=min(st.np-st.gs,st.gz
)st.ll=max((st.gn+
v*(st.hi+
v/2*st.gy
))*diff,0)add(jy,st)
rt.score+=st.ll
end
add(jy,{o_="total score",ll=rt.score
})local rank=5
while rt.score<ha[rank]*diff*qj do
rank-=1
end
gk(0,rt.score)if mq.qy then
local jd=max(rank,dget(diff))dset(diff,jd)end
ne(rt.rd,c_,129,{jy=jy,rank=rank})end
function c_(p,v)for i,r in pairs(v.jy)do
local c,y=
mid((p.t-i*35)/30,0,1),i*7+42
if c>0 then
jw(r.o_,6,y,7)if r.np then
jw(r.np..r.lt,89,y,9,1)end
jw(flr(r.ll*c).."0",122,y,9,1)
if (c<1)it(59)
end
end
if (p.t==180)it(59)
if p.t>180 then
jw("rank",50,88,9)spr(57+v.rank,72,86)end
end
fv=qn([[
0,1,2,1,1,5,6,10,8,9,10,0,1,13,1,9,
0,1,2,1,0,5,6,9,8,9,10,1,10,13,1,1,
0,1,2,0,1,5,6,1,8,9,10,1,9,13,0,10,
]])ks={ob([[
lb="-stage 1-",
oh="old petrel road",
fl=8,
rn=15,
qg=60,
gh=2,qf=1,
]],{ky=qn([[
0.0661,35,0,23,2,
1,56,0,20,3,
]]),bg=ca
}),ob([[
lb="-stage 2-",
oh="shearwater keep",
fl=32,cl=56,
rn=1,
qg=75,
gh=2,qf=1,
]],{qr=fv,ky=qn([[
0,39,0,10,3,
0.75,39,0,5,5,
1,39,0,0,5,
]])}),ob([[
lb="-final stage-",
oh="the lair",
fl=64,
ex=-256,
rn=33,
qg=52,
gh=3,
qy=1,qf=0.66,
]],{qr=fv,ky=qn([[
0.75,23,64,25,7,
1,23,0,25,7,
]]),gd=qn([[
x=-256,od="x",
]])})}
ik='abcdefghijklmnopqrstuvwxyz0123456789 ,="\n'function lm(a)local s=""repeat
local p=peek(a)s=s..sub(ik,p,p)
a+=1
until p==0
return s
end
io=qn(lm(0x2680))eg=qn(lm(0x2880))ig=ob(lm(0x2920))function da()local oc,of={}
if qj<3 then
for i=1,7 do
local rv
repeat
rv=kg(io[flr(ju.pg+
ju.qj*qj+
ju.ia*i
)])until rv!=of
of=rv
add(oc,ob([[
ph="fight!",
qq=10,
pv=0,nl=12,
]],{x=-135*i-rnd(100),od=rv
}))end
end
add(oc,ob([[
x=-1100,ph="final fight!",
qq=8,
qy=1,pv=16,nl=31,
]],{od=ju["mini"..qj]
}))
return kr(ob([[
x=0,ex=-1130,
lc=1,
]],{gd=oc,}),ks[qj])end
function dq(l)if jo[4]then
cg=
(mq.qy or rt.dead)and bb
or bd
end
end
function bf(l,tm)if tm==20 then
lh(l.lb,12,60)lh(l.oh,15,60,37)music(l.rn,0,3)end
l.pf=#hj("mi")==1
if l.x<=l.ex
and l.lc>#l.gd
and l.pf
then
el()end
if rt.dead then
music(-1)if rt.t>=30 then
px=cv
music(31)jj(l,"done")end
end
local qu=l.gd[l.lc]
if qu and l.x<=qu.x then
bn(qu)
l.lc+=1
end
end
function bn(e)hx(e.od,function(c)la(ig[c],ma({x=64+sgn(pc0(1))*pc(72,128)}),dk
)end)if e.ph then
lh(e.ph,e.qq)poke(15110,e.nl)poke(15178,e.nl)sfx(33,2,e.pv)sfx(34,3,e.pv)end
end
mz={nk={s_tick=dm,s_pick=di
},mq={s_tick=bf,s_done=dq
},mi=ob([[
qc=1,
]],{hit_player=js
}),ji=ob([[
pl="mi",
nu=2,lw=2,
mh="default",
kq=0,
le=5,nj=0,
vx=0,vy=0,z=0,
hq=-100,jv=-100,
gh=2,gc=1,
fk=8,
ga=0,hit_t=0,charge=0,
oi=0.85,
bk=-1,
il=0,
]],{nw=jf,s_hurt=fo,s_dead=ez
}),player=ob([[
pl="ji",
me=48,
le=1,
gv=0,
gl=0,
score=0,
]],{s_default=dd,s_charge=dg,s_shield=dh,s_dash=e_,s_stab=ep,s_hurt=fq,s_walk_off=bs,hit_monster=ff,hit_proj=dr,hd=dp
}),boss=ob([[
pl="monster",
hn=f,monster=f,
nu=4,lw=4,
me=125,le=1000,
ba=1,
km=1,il=2,
]],{s_default=ce,s_idle=em,s_dead=ej,s_summon=dc,s_retreat=bp,hd=cr
}),crst=ob([[
pl="monster",
hn=f,
nu=1,
me=30,
fk=3,
lo=1,
]],{s_default=cj,hd=dl
}),mf=ob([[
pl="monster",
ew=60,
]],{s_default=bl,s_ready=cw,s_stab=df,hit_radar=dn,}),skel=ob([[
pl="mf",
me=20,nj=2,
rl=0.9,qv=3,
ey=8,
ew=10,
kn=1,je=2,
fh=5,du=10,
]]),capt=ob([[
pl="skel",
me=30,rl=1,qv=4,
fh=12,
kn=2.2,eb=13,
il=-2,
]]),wrth=ob([[
pl="mf",
me=36,nj=0,
rl=1.1,qv=4,
kn=3.5,oi=0.94,
ew=18,
je=31,
eb=10,ey=11,
du=12,
fh=18,
gc=2,gh=3,
hk=5,lo=1,
]],{s_default=cc
}),ston=ob([[
pl="mf",
nu=3,lw=3,
le=5,
me=36,nj=6,km=1,
rl=0.8,qv=5,
kn=1,
eb=10,
ey=12,
du=8,
ew=3,
fh=30,
hk=6,gh=4,
il=3,
]],{ki=eh
}),eldr=ob([[
pl="monster",
nu=3,lw=3,
le=8,
me=120,km=1,
rl=0.6,qv=10,
pn=0,
gh=3,
il=1,k_=1,
]],{s_default=ct,s_ready=ek,s_shoot=en
}),blch=ob([[
pl="monster",
nu=1,
me=18,rl=1.0,
kh=4,
nf=-1,jm=0.388,
kv="ny",nh=2,
nb=52,
il=2,
]],{s_default=bh,s_ready=cm,es=bv
}),frsp=ob([[
pl="blch",rl=1.1,
kh=2,
nf=-0.5,
jm=0.4,kj=8,
kv="ja",nh=4,
nb=4,k_=1,
]]),felm=ob([[
pl="monster",
lw=1,
me=6,
rl=1.6,qv=4,
fh=15,
k_=1,
]],{s_default=cf,s_stalk=de,s_jump=ef,}),monster=ob([[
pl="ji",
monster=1,eb=7,
hn=1,
]],{es=cs,s_teleport=bo,s_dizzy=dv
}),proj=ob([[
pl="mi",
vx=0,vy=0,vz=0,
iv=6,
]],{s_tick=hu,he=cu,nw=function()
return ix[6]
end
}),i_=ob([[
pl="proj",
oi=0.95,ku=0,p_=0.2,
lj=187,fs=13,dy=-4,
]],{hg=ob([[
qv=6,ro=9,qq=12,
ko=9,w=10,
]])}),ja=ob([[
pl="proj",
og=100,qv=5,
p_=0.4,oi=1,ku=0,
lj=130,fs=0,dy=-4,
]],{s_tick=gu,hg=ob([[
qv=0,ro=2,qq=8,
ko=3,w=4,
]])}),kx=ob([[
pl="proj",
iv=14,
oi=0.98,ku=0.3,p_=0.4,
fs=0,dy=-6,
lj=22,qq=14,
rf="+health",
]],{he=bi,hit_player=cp
}),gt=ob([[
pl="kx",
lj=23,qq=12,
rf="+strength",
]]),ny=ob([[
pl="proj",
qv=2,kd=1,
p_=0.4,oi=1,ku=0,
]],{he=ck
}),nd=ob([[
pl="mi",vx=0,
]],{s_tick=fr,}),ow={s_tick=dj
}
}
function cv()iq(48,35,78,35,1,1,2)spr(1,60,31)jw("you perished",40,40,15)end
function fa()mt,mo,jp,gb,t,n_,px,nq=
{},{},{},{},0,0,nil,0
end
function co()qj,ju=0,er[diff]
rt={qv=ju.jx}
bd()end
function bd()music(-1)
qj+=1
mq=la("mq",da(),kk)kr(rt,ob([[
x=56,y=90,
kq=0,ec=0,
gv=0,
gl=0,
mh="default",
hq=-100,
bk=-100,
jv=-100,ht=0,
hv=0,
]],{gh=mq.gh
}))la("player",rt,dk)ne(rt.rd,ii,129)end
cartdata("krz_lairv1")fa()cg=
bb
function _update()bm()dt()bq()end
function _draw()if px then
pset(rnd(128),127,13)for i=0,1500 do
local x,y=rnd(128),rnd(128)local c=pget(x,y)circ(x,y-1,1,oz(0.12)and f_[1][c+1]
or c
)end
px()else
camera(sin(t/4)*nq,cos(t/4)*nq)nq=max(nq-1,0)cls()ds()end
if ea then
eq(ea[1],ea[2],1)end
end
__gfx__
00000000000333303333030ccc003333333330003333333333330003333003333333001c11103333333001cc1103333333333d1331d333333333333333333333
00000000766033073330c0ccc11c033333330ccc00333333330047033330a03333301cc5555c03333001cc15551033333333dd1331dd33333dd3331133333333
0070070077660077330c10c6000003333330ccc165033333301d49030000aa033301cc5c1115c0330111cc5c11533333333ddd1331ddd333000dd30033333333
0007700000760007330c1060676500333330c15070003333014d97d00aaaaaa03330c11dc1c16033305c1c5c5c1333333333dd1331dd33330000011111133333
0007700000660007330c10567c5c00333330150670000000014dd9900aaaaaa93301111c1c11000301111c5c11c0333333333d1331d333330000000000011133
0070070066603070330c10567655003333305066c0c111c001400d000999aa9030dd001cd5110d10300001c7d503300333333333333333330000000000000013
0000000050033307330c1005500000003330056750c11cc0000000000000a90330110001111001103333301c1100011033333333333333333000000000000003
0000000000333300330c10c000ccccc03333000550c11cc030556070333090333301dc5d11d1c503333330c11d11dc0333333333333333333333000000000333
00000000000000003000000cc0c111c033300d000000094033000033330000333320001c1c10002333333077c000003300333333333300100000033333330003
000000000000000030cc110cc0c111c0330f0d07ccccc0403307c033330c103333133330dc0333133333330c766dc0330d033333333300000000033333330003
00000010000010003000000cc0cc11c03309050611111c03330750333307603331333300c1033133333300c70000dc0301d00003333300501000033333330003
0000010100000000330cc0ccc0cc11c033300500000000033077660300076000333330cc00c033333300cc0003330033301d0503333301100010033333300003
01000000000101003300000cc00ccc0333330008c00300330799886007cc776033330c1dccc1033330c1dccdd033333333015103333300501000033333300033
101000000000100033330100cc00c03333333333333333330688825007c771503330c1ccc11103330c1cccdd1033333333051503333301d00010033333300033
0100000100100100333301c01c03033333333333333333330522220006511150330c1c11cc11033301c11ccdd033333333010103333300501000033333300033
000000100000000033330cc0cc0333333333333333333333300000030000000033300c0cc0cc033330c0cc0c2033333333000003333301d01010033333300033
00000010000000003000000cc0ccccc0333333333330006033333333333333333330001c111033333333331c1113333333333333333333333333333333300033
001100000000000030cc110cc0111cc0333333333305dd7d03333333333333333301ccc1555c033333331ccc555c333333333333333333333333333330000000
01110000011001103000000cc0111cc0333333333015675660333333333333333330cc1c1111c03333300c5c1115c00313333333333333333333333300d11110
0011000001100000330cc0ccc0c11cc03333330000160cd0c7033333333333333301c111c1c1c033330dc01dc1c10d100113333333333333333333331d000001
00000000001000003300000cc00ccc0333333066d0111565d0333333333333333300111c1c1100033330001c1c11300300011003311100033131333310000000
0000001100000000333306000600c033333305d6d001511d603333333333333330dd001cd5110d103330101cd511010300000001100000003000333300010000
000000000000110033307500750303333333011dc61015d60033333333333333301100011110011033330c011110103300000000000000003000333301000010
010001000000010033305503055033333333012c6d01000003333333333333333301dc5d11d1c5033333305d11d1033300000000000000003000311300000000
01100111001000003000000cc0ccccc033333001d5c0c21d60333333000000033320001c1c10002307cc0333307cc03307767033307770333077703333333113
000000110011000030cc110cc0111cc03333011012d60151d70333330776cc0333133330dc0333130cc0c03307c0cc03076076030770cc030770770311333003
00000000000100003000000cc0111cc033000000015000005d6033330c777c0333133300c10333130cc0cc030cc00003066066030770cc030770003300111003
0000000000000000330cc0ccc0c11cc0300102420006d6000000000000ccc003333330cc00c033330cc0cc030cc03333067760330777cc033077c03300000003
01110001100111003300000cc0011c030016104420056502065601cc40c7c03333330c1dcccd03330cc0cc030cc000030770670307c0cc033000cc0300000000
0111100010001100333330100030c03301d5d50224051500055d000000ccc00333301ccccdc103330770c0330cc07703076077030cc0c6030770cc0300000000
00110000000000003333301c103303330565000242000000000033330c1cc1033301c11c1cdd03330777033330777033066770330c60660330ccc03300000000
0000000000000000333330cc10333333015d5000000015d0333333330cc1c1033300ccc0cc0c0333000033333300033330000333000000033300033300000000
00110010100110013000000030000000000000000000000000000000011111111111111000040040e00b000000000000000000000000000000000000000d1100
100000010000000130005515300055151100000000011001000100000010d50000000100000000000000000000111111111111000510000000000d5000d11110
001010000101010030005101300051011010000000101011501100003001111111111003040be0111140e400000000000000000005110100001051100d111010
1011101101110001300010103000101000000000001001000d10000030100d5000000103b0e110fc711040000005111100001000005110100101110001110010
10000011000001003000000030000000000000000011103330511000300111111111100304111079c1101b000005100101001000000101000010100001100010
00011000011101113300005500155510000000000010103330d1000033001d5010010033000001caf10000000005100100101000001010100501010000111100
1101101100110111330005110051010010000000000010333050000033300150101003330e0110aaa0111b000005100101001000000101005010100000000000
10000001100001113300011000100010000000000011103330d11000333301d010100333bb01020002011e100005101100101000000000050100000000010001
00011100000100000000000000000000000000030010103330510000333301501010033304010088800114000005111100001000000000d01000000033333333
11011110110111100000001100000011111000030000103330d00000333301d0101003330000002220000000000100001111100000000d010010000033333333
000111101101110000000101000001011011000300111033305111003333015010100333040b400200be0e0000010100100010000000d0100101000000003333
11001110110111010000000000000000010100030010103330d10000333301d01010033300eb0b020e0040000001001151011000000d010000501000dd100000
11000000000011010000000000000000000000000010103330500000333301d0101003330000400200400000000101000500100000d010000001010011111110
11011011100000011110110100000000111110000001103330d11000333301d01010033300000000000000000001010005011000005100000000110011010010
10010011110110010101110100000001001011000010103330510000333301d01010033300000000000000000000100000111000000000000000000011111100
00000011110111000010110100000000110001000000103330d00000333301d01010033300000000000000000000000000011000000000000000000000000000
11111011110111010000000000000000000000000010103330511000333301d01010033300000000000000000000000000000000000000000000000000000000
11111000000000011100000011005110000000000000103330d00000333301d01010033300dddd5d5d511100000000000000000000ddd1000000000000000000
11111010011001011010000010101000000000000000100000500000333301d01010033300d111111000010000d11100000000000d1d11100dd1111000000000
11110011011101000000000000000000000000000011d5d5d5d11000333301501010033300d10101010101001d10011111100d11011110101000000110111101
00000000011100000000000000000000000000000010110110110000333301d01010033300d10101000001001000000000011100001111000000010001000010
11011001011100110015101000000000000000000000100100100000333301501010033300d10101010101000001000000000000000000000100000000001000
11011011001101111051010010000000000000000000000000000000333301d01010033300d11111000001000100001001000010000000000000100001000001
10000000000001110010000000000000000000000000000000000000333301501010033300d00111000111000000000000000000010000100000000000000000
111111111111111100330030030030300033333300000000000000003333015010100333000500001110100000000d0d1110dd111110d00001100d1133333333
101101111011011103030303030300303303333311110000000000003330015010100033000d0010111010000000d11111101111111011001010d11130000000
1101101101011010003303330303303000333333111010000000000033001d5010010003000050101101000000d1d1111010111110101100111011100d110d10
01101110101101013333333333333333333333330101100000050000300111111111100000001000110100001d101101001010010110101000101101d1111110
10010011001010103333300303000033333333330000000000000000301055000000010000000100101000001000111111101111111011101110111111111110
01001010010010010333033003033033333333331010003300000000300111111111100000000010110000000000000000000000000000000000000010001010
00000000000000000333000003000333333333330110003300000000001050000000010000000001100000000100000001000000010001000100000011111110
00000000000000000003033003033033333333331110003300000000011111111111111000000000000000000000000000000010000000000000001000000000
111100001111000033333333000000003333333333333333333333333302c2cc20ccd1016e203333333333333333330033333333003333333333300333333333
000011110000111133333333000000003333333333333333333333333302c10c2077cd016e2e0333333333333333330433333333040333333333040333333333
0000111100001111333333331111000033333333333333333330333333301ce020ccd101d0cc0333000000003333330233333333024000000000420333333333
11110000111100003337a333000011113333333330003333330c0333333000002f00001002203333466ddd660003330033300333004465505564400333300333
1111000011110000333a933300000000333333300060333330c7c03333330102c47f77cc00033333200060000200000033308030000267766662000003080333
00000000000000003333333300000000333333055d7d03330cc610033333301c2cfcf7c2ce03333300c675c000d0700233308800c00000060000000800820333
222222222222222233333333000000003333301567567030ccc1dcc033330102c2cccfcce020333306775665707570003330808222000c675c00002022020333
dddddddddddddddd3333333300000000333330160cd0c7030ccc1ccc333330322c7c2ccc03033333006000605d65600033300202022067756650020220200333
22222222222222220333333300000000333330111d65d03330017770330333333333333333033333006000600677707033330020200006555600002002003333
2222222222222222000000030000000033330001511660330105570333233300033300033323333390566650076677503333300200d906777504110020033333
222222222222222206677760000111113330d61015dd0100c030c0333302001ce000ce003023333310007000016d5500333333020d1100565001101000033333
2222222222222222000000031111111033076cdd0000507d0333033333002012eeee2cee020333331a00000905011050333333006d11a0000091110101003333
222222222222222203333333000000003055c6060ce16056503333333330012ccece11ce003333330110000130d000d0333330dd111011000011011110103333
22222222222222223333333300000000301d605d601d001150333333332012cccccccccef0333333011a241030d00d0033330994d11011a24100001994203333
2222222222222222333333330000000030155c0155104000033333333300002c2c11111ce033333310119101330dd00233309000210101191010002000020333
222222222222222233333333000000003301d260000201033333333333000cccc1000211ef033333000110103330002033010065020000110100001057010333
dddddddddddddddd333300030001111033301d0d6700103333333333300ccc2c2ddddd21cf03300033333933330000003301070701066d00006dd01070710333
222222222222222233004703001110013333010d56000333333333330cc222cc2ddddd21ee0002cc333393333028820033010000016dddd11ddd101000010333
0000000000000000301d4903011000003333300515020333333333332000022ccddddd21ec02220033393393302882003330100010dd10ddd11d100100010333
1111000011110000014490031100000033333010002403333333333303001202cfdddd1cef012033333a39333028e200333001110611d1000011100011100333
1111000011110000011dd060100000003333301d024003333333333333301200c47f77fcce00033333a33934302ee2003330c000061d1d111d110100000c0333
000011110000111101400070000000003333301d60010333333333333333012c2cfcf7cce033333333a39333302ee20d3330c1cc0d1101ddd1101010cccc0333
0000111100001111000000700000000033333015501100333333333333301012c2cccfce0203333333a39343302ee20d3330c11c0d1d101110010110cc1c0333
000011110000111130556070000000003333301d6605d03333333333333303012c7c2cce0003333337339394302ee20d3330c11c0d10110000110100c11c0333
3333333333333333300030030000000033301d0d76001033333333333333330012cccce033333333373a3333331111333330cc10d1101d11111010001cc10333
333333333333333330001001100011003333010d5d00033333333333330030011cccccee03333333373a399331c11c133330c110d1101d101d1010101c110333
3333333333333333300000000111001033333005550240333333333330220eecccc2cccce0333333373a33331c1cc1c13330c109010101000101010001110333
333333333333333330000000000000013333011000242203333333333300ec20ce22ce22c03003337a3a399311c77c1133300000901010041010000200000333
333333333333333310000000000000003333015d0240010333333333030c2202c000ce002e0cc0337a3a339311c77c113001ccc0040404000202022000c11003
33333110003333110000000000000000333301d6000151033333333320c0002c0200c02202e22e007a3733331c1cc1c1011ccc11200000022000000011cc1110
3311000000001100000000000000000033301550033015d033333333020020c02200c002000000c27a37339331c11c1300000000000000000000000000000000
1100000000000000000000000000000033301d660330000033333333000002c000000c00200000007a3739333311113301111111111111111111111111111110
3333333333333077700333333333333333301d0d760010333333333333088828200000218f030000333333333333333333333330000333333333306677033333
333033333333077766503333333333333333010d5d000333333333330082228820000021ee002288333333333333333333333308eef033333333066777700333
330703333333076000003333333333333333300555040333333333332800022880000021e8022200333000333333033333333028888e03333333067007006033
30760330333306067650033333333333333330100042033333333333000012028f000018ef010033030aaa0300307033333302228eeee0333333066087807033
307603073333056705050333333333333333301ddd0003333333333333301200847f7ff88e00333370099003070000333333082ee80f00333333306660707033
30760307333305676550033333333333333333015500033333333333333301282878f788e0333333049900333040400033302828ee0003333333330057007033
3076030633330055555033333333333333333301d6603333333333333330101282f8888e0203333304090203044999a033302002288803333333306000006033
30760305333300000003003333333333333333000000333333333333333303012888288e00033333044900030449000033300330000033333333005755706033
3076030533307682200060000000333300000003333333333333333333333300128888e033333333704499903044999033333330000333333330490566000003
000000003330667670f0d0777777033305d77d03333333333333333333303301188888ee03333333049909000499090033333308eee033333302449000704903
06d5508833300555509050666666603301566d033330003330003333330200e888828888033330034049a000004aa003333330288efe03333305649066000003
000006893333000000005000000003330011100000077d00077d033300000820822208e2033008e09009aa040909aa0333330228888e03333302224000007033
30f905283333300820330033333333333016d04442056502056503338808e82800008802800888080049a9000049990333302822eeeee0333330220070300033
30000028333306682603333333333333001110000005150005150333008022080200802028222000302490333024903333302888e80f00333333000555033333
3333302233307600006033333333333305d66d0333300011000033330000000800082002022000000200003333000033333000022e0003333333330707033333
33333000330550330550333333333333015d6d03333015005d60333300000000e008000000000000040304033040403333333300228803333333330505033333
0667703333333333333330667003333300000003300000d65d03333300088828200000218f033330333033333044999033333330000333333333049066000003
66777703333333333333066770603333333333330d785d26600333332882228820000021ee0000083307033304990900333333088ef033333330244900704903
67007003333333333333067000703333333333301758655505d033330000022880000021e8022280307790334049a00033333022888e03333330564906000003
66087803333333333333066080703333333333301525550056603333330012028f000018ef01220308a980039009aa04333302288e0f03333330222400007033
066607033333333333333066607033333333333011550011d7d0333333301200847f77f88e00003308999203004999003333028ee80003333333022070300033
300570333333333333333300506033333333333300005665560333333333012828f8ff88e03333330899f2033024903333302828eeee03333333300555033333
06000003300333333330006000603333333333333055ddd851033333333010128278888e02033333089f72030200003333302802280033333333307507503333
057557000093333333049057000003333333333333011112103333333333030128882f8e0003333308f791030403040333300200003333333333305030603333
9056600670933333302449050449033333333333333011882033333333333300128888e0333333330879a2033044999033333330000333333304900566000003
4900070000433333305649000000033333333333333000000333333330000001188888ee03333333089a91033099090033333308eee033333024490000704903
490660033003333330222405607033333333333333305602033333330220eee888828888e000333308a992033009a00333333028888803333056490666000003
240000333333333333022000000033333333333333305d6003333333300e88208e288e228eee0333089982033090a90333330222800003333022240000007033
2005650333333333333003075033333333333333333011d503333333330820028008e0002888e03300822003300499033333028e0f5f03333302203070300033
00500060333333333333330510333333333333333330056700333333308000280200802000008033302210333024903333302828000033333330033050333333
06033070333333333333330750333333333333333330101550333333008008800220080002008003330103333300033333302802200003333333333070333333
60333050333333333333330510333333333333333330101d67033333020020000000008800002820333033333304033333320000022203333333333050333333
__label__
0000000ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000c0ccc11c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c10c6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c1060676500000d000000ddd0d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c10567c5c000001d0000000d0d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c105676550000001d05000dd0ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c1005500000000001510000d000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c10c000ccccc000051500ddd000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000cc0c111c00001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc110cc0c111c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88e8e8eee888e8e8e8eee88888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
88e8e8e8e88e88e8e8e8e88888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
88eee8eee88e88eee8eee88888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
8888e8e8e88e8888e8e8e88888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
8888e8eee8e88888e8eee88888888888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777ff00000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f7777777777777f000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f77777777777777777f0000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777777777777777ff00000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f77777777777777777777777f0000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f7777777777777777777777777f000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777777777777777777777ff00000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777ff0000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f77777777777777777777777777777f0000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff77777777777777777777777777777ff000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000f7777777777777777777777777777777f000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777777777777777777777777777ff00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777777777777777777777777777ff00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff777777777777777777777777777777777ff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff7777777777777777777777777777777fff0000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff7777777777777777777777777777777fff0000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff7777777777777777777777777777777ff00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff77777777777777777777777777777fff00000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff77777777777777777777777777777ff000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff777777777777777777777777777fff000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff7777777777777777777777777fff0000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff7777777777777777777777777fff0000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff77777777777777777777777fff00000000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111ddddffffffffffffffffdddd11111111111111
000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111ddffffffffdd11111111110000000000
00000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111ddddffffffffffffdddd1111111111111111
000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111dddffffffffffffddd11111111111111111
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111ddffffffdd111111110000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001ff1000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111dffffffd1111111100000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111ddffffffffffdd1111111111111110000
00000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111111dddffffffffddd1111111111111000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111111ddffffffdd111111111100000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111ddffffffdd111111110000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111ddffffffdd111111110000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff0000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111dffffd11111000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dffd110000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011dffd110000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff0000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10d000000000000000000000000000000000000000000000000000000d110000000000000000000000000000000d0d1110d00000000000000000000000000000
10110000000000000000000000000000ddd100000000000000000000d111100000000000000000000000000000d1111110110000000000000000000000000000
1011000000000000000000000000000d1d11100dd1111000d111000d1110100000000000d111100000000000d1d111101011000000000000d111000000000000
1010101011110111100d1111100d1101111010100000011d10011101110000000000000000000111100d111d10110101101010101111011d1001111011110111
10111001000010000111000001110000111100000001001000000001100888888888888000000000011100100011111110111001000010100000000100001000
00000000001000000000000000000000000000010000000001000000110000000000000001000000000000000000000000000000001000000100000000100000
00010001000001010000100100001000000000000010000100001000000000077700100100001001000010010000000100010001000001010000100100000101
00000000000000000000000000000001000010000000000000000000010000777665000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000760000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000606765000000000000000000000000000000000000000000000000000000000000
00000100000000001000000100000000010000001000000000100000010000567050500000010000000001000000100000000010000001000000000010000001
00000000000010110000000000000010110000000000000010110000000000567655000000000000000010110000000000000010110000000000000010110000
01100100000000000101100010000000000010110001000000000001011000055555000001011000100000000000101100010000000000010110010000000000
00100100000000000100001001000000000001000100100000000000100010000000000000010000100100000000000100010010000000000010001001000000
01100000011001000100011000000110010001000110000001100100010007682200060000000100011000000110010001000110000001100100010001100000
0000001000000000000000000001000000000000000000010000000000000667670f0d0777777000000000000100000000000000000001000000000000000000
00001100000000000000000001100000000000000000000110000000000000555509050666666600000000000110000000000000000000110000000000000000
00000000000000000001110000000000000000000111000000000000000000000000050000000000000001110000000000000000000111000000000000000000
00000111000111011111000000011100011100111110000000111000111001008200000001110001110111110000000111000111001111100000001110001110
00011100000000001110000000011100000000011100000000111000000000668260000001110000000000111000000001110000000001110000000011100000
00010000000000000000000000010000000000000000000000010000000007600006000000010000000000000000000000010000000000000000000000010000
00000000000000000001111000000000000000000000111100000000000055000055000100000000000000000000011110000000000000000000001111000000
00011100000000000000000000001110000000000000000000000011100000000000000000000001110000000000000000000000111000000000000000000000
00011000010000011000000000000110000100000110000000000001100000000000000000000000011000010000011000000000000110000100000110000000
00000000111000111111000110000000001110001111110001100000000001110001111110001100000000001110001111110001100000000011100011111100
00000000000000011100001110000000000000000011100001110000000000000000001110000111000000000000000001110000111000000000000000001110
00000000000000000000000110000000000000000000000000011000000000000000000000000001100000000000000000000000000110000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111111000001111000011111000001111110000011110000111110000011111100000111100001111100000011111100000111100001111100000111111000
11111111000000100000011110000011111111000000100000011110000011111111000000100000011110000011111111000000100000011110000011111111
01111000000000000000000000000000111100000000000000000000000000111100000000000000000000000000011110000000000000000000000000001111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000073000000000000000000000000000000000000000000000000000000000073000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000047480000004748000000474800000000000000004748474800000047484748000000000000004748000047480000000000000000000000004748474800000047480000004748474800000000000000000000004748004748004748004748000000000000000000000000000000000000
0000000000000000000000000000000057580000005758000000575800000000000000005758575800000057585758000000000000005758000057580000000000000000000000005758575800000057580000005758575800000000000000000000005758005758005758005758000000000000000000000000000000000000
0000000000000000000000000000000067680000006768000000676800000000000000006768676800000067686768000000000000006768000067680000000000000000000000006768676800000067680000006768676800000000000000000000006768006768006768006768000000000000000000000000000000000000
0000000000000000000000000000000067680000006768000000676800000000000000006768676800000067686768000000000000006768000067680000000000000000000000006768676800000067680000006768676800000000000000000000006768006768006768006768000000000000000000000000000000000000
0000000000000000000000000000000077780000007778000000777800000000000000007778777800000077787778000000000000007778000077780000000000000000000000007778777800000077780000007778777800000000000000000000007778007778007778007778000000000000000000000000000000000000
6464646464646464646464646453540000000000004262646464646464646464646453540000000043626464646464646464646464646464646464646453540000426464646464646464646464646464646464646464646464646464645354000000424464646464646464646464646464646464646464646464646464646464
646445466464494a6464454664537500000000000000434464494a6464494a6464645275000000000042626464494a6464696a4d4e696a646464494a64645354434464644b4c644d4e644b4c6464644546454664494a644546454664646452540000436264646464494a64696a64494a644d4e64494a64646464646464646464
646455566464595a6464555664645354000000000000426464595a6464595a6464535400000000000000426264595a6464797a5d5e797a646464595a64646464646464645b5c645d5e645b5c6464645556555664595a645556555664646453750042636464646464595a64797a64595a645d5e64595a64646464646464646464
6464656664646464646465666464537500000000004263646464646464646464645375000000000000000042446464646464646464646464646464646464646464646464646464646464646464646465666566646464646566656664646464535443446464646464646464646464646464646464646464646464646464646464
6464646464646464646464646464535400000000004344646464646464646464645354000000000000000043446464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464
7600000000760000007600000000760000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000760000007600760000007600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b3938383a38393a3b3a38393a3b3838300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2528132826292528131328262813022826281306282925281313132826280313282628030628262813020628262806062826281313022826281313062826281302022826292528172826281728262817062826281702282628031313062826280313020228262803032826280313131328262925280313102826281710282628
1713132826281703282628131002282628131006282628031002282628100628262925281428262814022826281717282628171006062826281703032826280303131028262803030310282628030303030328262925281410282628141728262814131313282628140303282628171010282628171703062826281010060628
2628171717282629252805282628050628262814142826281417172826281403030306282628141403282628030303101028262814170310282629252805030328262805172826280514282628051028262805030606282628141414032826281717171728262925280503030328262805171428262805101028262814141417
2826281717171428262817171717102826280303101010060628262925280514142826280517172826280510100606282628141414171728262817171710101028262805030303031010282629252828262925282826292528282629252828262925282829002828290000012814282628032826280728262901280428262814
2528132826280228262806282629252803282628131328262813022826280202282628062826292528172826281028262813062826281313132826280313282628020228262806062826292528170328262803032826280306062826280302022826280606062826281028262925281428262817030628262817030328262803
030606282628030302022826281010282629000000000000000000000000000025132728130b050c282606272806050c0d28262925022728020c03082826172728171214082826292514272813140f0e2826052728050c0412282629250327280301101428261027280612131028262925182728020f13132826192728031213
142826290013100f151428262925182728020f131328261927280312191314010c2826290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000428c36875dec01741698c1bf86d1491c65eb
00000000000000000000000000000000000000000000001f0000000000000000000000000000001f00000000000000000000000000000000000000000000000000000000000000000000000000000000000e0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000007f000000000000000000001f000000000000000000000000007f001f0000000000000000007f5f000000000000000000000000000000005f0000005f007f000000000000001f0000000000000000007f5f7f5f00000000000000000000000000000000000000000000000000000000007f000000
6b6c6d6e7b7c7c7e7d7b7c7e7e7c7d6f6c6c6d6e6b4f6c2f6c7b7d6f6b6f6c6c4f6f7b7c7e7c7c7e7e7d6f6c6e6d6e6f7b7c7c7e7c7d6e7b7e7d6e6c6f6b6f7b7d6f7b7e7d6c7b7c7c7c7d6f6c6e4f6b6c2f6b6c4f6b6d6f6c7b7c7c7c7c7c7d6f6f6b6c4f6b6f6e6c6b6f7b7d7e7e6f6b6c6d6e7b7c7c7e7d7b7c7e7e7c7d6f
0000000000000000000000000000000000000000002e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000b0b1b1b23f2c2db1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000001d1e00000000001d1e00000000001d1e00000000001d1e00001d1e0000000000001d1e00001d1e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000067680000000000676800000000006768000000000067680000676800000000000067680000676800000000000000000000000000000000000000004b4c000000004b4c000000004b4c00000000000000000000494a0000494a0000000000000000000000000000000000000000000000000000000000
0000000000000000000057580000000000575800000000005758000000000057580000575800000000000057580000575800000000000000000000000000000000000000005b5c000000005b5c000000005b5c00000000000000000000595a0000595a0000000000000000000000000000000000000000000000000000000000
0000000000000000000067680000000000676800000000006768000000000067680000676800000000000067680000676800000000000000000000000000000000000000000000000000000000000000000000000000000000494a00000000000000000000494a00000000000000000000000000000000000000000000000000
0000000000000000000057580000000000575800000000005758000000000057580000575800000000000057580000575800000000000000000000000000000000000000000064000000000000000000000000000000000000595a00000000000000000000595a00000000000000000000000000000000000000000000000000
0000000000000000000067680000000000676800000000006768000000000067680000676800000000000067680000676800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000077780000000000777800000000007778000000000077780000777800000000000077780000777800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
015000000e7240e7120e715000001172411712117150000015724157121571500000107241071210715000001d7241d7101d7150040021724217102171500400247142471225714257152671426712267150e000
015000001a0441a0351a0251a01521044210352102521015240442403524025240151c0441c0351c0251c0151a0441a0351a0251a0151d0441d0351d0251d0151c0441c0351c0441c0351a0441a0301a0251a005
0103000024635306050c4350c60500635246050c635246050c6051d605004050f4050260501605006050060500605006050060500605006050060500605006050060500605006050060500605006050060500605
010600000c05013041130150d05014041140150e05015041150151005017041170151100018000180050400004000050000600007005000000000000000000000d00014000140050000000000000000000000000
010800000c61430614186110c6110c6110c615186003a5003b5003a5003b5003b5003a5003b5003a5003a5003b5003a5003b5003a500215022150221502005000050000500005000050000500005000050000500
0112000015753047000500005700070000770009000097000b0000b7000c0000c7000c000180000c000180000c000180000c00018000210022100221002000000000000000000000000000000000000000000000
010e00000c0430415504155041550c04304155041550415504155031051c5151c5150c0431c515235001c5150c0430015500155001550c04302155021550215502155225001c5151c5150c0431c5151c5151c515
010e00003f7053f7051c5151c5151c5151c5153f7051b4030c0433f705175151751517515175153f705175150c0033f7051c5151c5153f7053f7051c515000000c0433f70517515175153f705175151751517515
010e00000c0430415504155041550c613041550415504155041553f7051055010540155401754117530175320c0430015500155001550c6130215502155021550215516540155401354015540155301354017540
010e00003f7053f7051c5151c5151c5151c5153f7051c5150c0431c51517515175150c613175153f7051751517532175251c5151c5153f7050c0431c5151c5150c0433f70517515175150c613175151751517515
010e000017540175401a540175401754017532175251c5153f7051c5151a515175153f705175153f705175153f7051c5151c5151c5153f7053f7051c5153f7050c0431a5051a515175151c505175151751517515
010e00000c0430415504155041550c6130415504155041550c0433f7051f5151c5150c6131c515235001c5150c0430015500155001550c613021550215502155021551f5051f5151c5150c6131c5151c5151c515
010e000017540175401a5401c5401e5411e5401c54017540175421753517515175153f705175153f705175153f705175051c5151c5153f7053f7051c5153f7050c0433f70517515175150c003175151751517515
010e00001c5401e5411e5401e5401e5321e5321c54017540175401753517535185150c003185153f705185153f705175051c5151c5150c0033f7051c5153f7050c0433f7051e5401e5301f5401f5401f5421e540
010e00000c0430915509155091550c6130915509155091550c043031051c5151c5150c6131c515235001c5150c0430715507155071550c61307155071550715507155225001c5151c5150c6131c5151c5151c515
010e00000c0430515505155051550c6130515505155051550c043031051c5151c5150c6131c515235001c5150c0430415504155041550c613041550415504155041500404004140061400c613071501304007140
010e00001754017540175301554015540155401553015532155351550518515185150c003185153f7051851515540155401553014540145401454014530145351454014540145321554015530175401754017535
010e00001c5401e5411e5401e5401e5321e5321c54023540235402354223535185150c003185153f705185153f705175051c5151c5150c0033f7051c5153f7050c0433f70526540265302354023540235421f540
010e00000c0430915509155091550c6130915509155091550c0433f7051c5151c5150c6131c5153f7051c5150c0430b1550b1550b1550c6130b1550b1550b1550b1500b0400b1300b02009021070210601104011
010e00001e5401e5401e5301e5301e5301e5321e5321e5321c5401c5401c5301c5301c5301c5321c5321c5351c5401c5401c5301c5301c5301c5321c5321c5321b5411b5401b5301b5301b5301b5321b5321b535
011000000214502145182351a4250e1451d235021450c145182351a4250e145021451122513225091450914507145071451d22507145071451d22507145071451d2251f2251d2251a22518225071451522509145
011000000c0430c04313235154253c60518235306150c04313235154250c0430c0430c2250e22530615000000c04300000182250c04300000182253061500000182251a225182251522530615152251a2250c043
0110000009145091451d2251f2251d2251a2251822509145152250914509145212150914509145152150a0451d2251f2251d2251a22518225152251a2250a145262250a1450a1451a2250a1450a145262250a045
011000000c04309105182251a225306151522513225152251a2250c0433060526225306150c0431a2250c0430a1450a1450c043152253061515205152250c043212250c0431a20515225306150c043212250c043
011000000914509145182251a225306151522509145091450a1450a145182251a22530615152250a1450a1450b1450b145182251a22530615152250b1450b1450c1450c145182251a22530615152250c1450c145
011000000c043000001d2251f2251d2251a2250c043306150c043306051d2251f2251d2251a2250c043306150c043000001d2251f2251d2251a2250c043306150c043000001d2251f2251d2251a2250c04330615
011000000d1450d1451f42521425306151c4250d1450d1450e1450e1451f42521425306151c425021450214504145041451c21521215306150c0430414504145091450914521415091451c415154150914509145
011000000c0430c043244252642524425214250c043306150c0430c043244252642524425214250c04330605306150c04321215262152c4202d4112d4122c42030615294102641024410214101a2202641026412
015000001a0041a0051a0051a00521004210052100521005240042400524005240051c0041c0051c0051c005021240211202115001000012400112001151d105151141511509114091150212402112021151a005
010c00000f51014510185101b510205102451011510165101a5101d510225102651013510185101c5101f5102451028510285102851028510285102851028515240042450225504255052650426502265050e500
010c000014730187301b730207302473027730167301a7301d730227302673029730187301c7301f73024730287302b730307403073030730307303072030715247042470225704257052670426702267050e700
01030000187112671128711297112b7112d7112e7112e7112f7112e7112f7112f7112e7112f7112e7112e7112f7112e7112f7112e7112d0022150221502005000050000500005000050000500005000050000500
010200000f7650f7650f7651076510765107651176511765117651276512765127651376501410024100341003410044100541006410064100b41010420144201d4202d425077050670505705047050370502705
010a0c0d1d12522125261252912529105291252912529125291052410229105251052610426102261050e1001e5462a5361e5262a5161f5362b5261f5162b51624546305362452630516235362f526235162f516
010a0c0d1a4251d425224252642529405264252642526425295052450229505255052650426502265050e50027027330172701733017280273401728017340172d027390172d017390172c027380172c01738017
010e000000145071350c12500145071350d12500145071350c12500145071350d12500145071350d1250712500145071350c12500145071350d12500145071350c12500145071350d12500145071350d12507125
010e00000c04313525185250c5250c0430e52524600186050c0430c525135250e5250c0431f716197161f7160c04313525185250c5250c0430e52518525135250c0430c525135250e5250c0430d5251352519525
010e00000c0430000000000000000c0430000000000000000c0430000000000000000c0430000000000000000c0430000000000000000c0430000000000000000c0430000000000000000c043000000000000000
010e00000c043165251b525105250c0430e52510525165250c0431052516525195250c0431c71622716277160c043165251b525105250c0430e52510525165250c0431052516525195250c043165251952516525
011800000f5500f5400f5401055010540105401355013540135401255012540125401555015540155401655016540165401955019540195401855018540185402e54622546225362e536225262e526225162e516
011800000014000140001300013000130001300314003140031300313003130031300614006140061300613006130061300914009140091300913009130091301712017110171101711017110130110c01100011
010e0000041450a1350f125041450a1350d125041450a1350f125041450a1350d125041450a1350d1250a125041450a1350f125041450a1350d125041450a1350f125041450a1350d125041450a1350d1250a125
010e0000041450a1350f125051450b13510125071450d135121350d125121350d125101350b125101350b1251d04518125121250c1251c04517125111250b1251b0451812515125121250f1250c1250911503115
010e00000c043165251b525115250c0431c52513525195250c043165251b525165250c043175251c525235250c043245252a525245250c043235251d525175250c0431b52518525155250c04315525125250c525
010a000024045270352d02523045260352c02522045250352b02522035250352b02522035250252b01522725257252b71522715257152b71522715257152b7151700017000170001700017000130000c00000000
010a000021705247052a7052072523715297151f72522715287151f71522715287151f71522715287151f71522715287151f71522715287151f70522705287051770017700177001770017700137000c70000700
016000000073400730007300073200730007300073000735007340073000730007300073000730007300073503734037320373203732037300373003732037350173401730017300173001732017320173201735
01600000003140031000310003150c0140c0100c0100c015003140031000310003150c014000130c5100c015033140331003310033150f0140f0100f0100f015013140131001310014150d014010130d5100d015
01180000016140e6111d6112a6111d6110f61101615186000e6020d6020f6020e6020c60301600026000360004600056000660007605006000060000600006000060000600006000060000600006000060000600
010c000004314057210631107721083110c52006521005210052530600186000c6050c6050c0000c000180000c000180000c00018000210022100221002000000000000000000000000000000000000000000000
010900000731408721093110a7210b3110c7210d3110e7250f30010705376000c7000c000180000c000180000c000180000c00018000210022100221002000000000000000000000000000000000000000000000
01020000136250c6222f7022f705175062350617506235061a506265061a50626506195062550619506255061c506285061c506285061d506295061d50629506205062c506205062c5061f5062b5061f5062b506
010200000c1440d1410e5410f53110031110311272113721147211572500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
012c00003c325243033130337303303033630331303373033030536305313053730530305363053130537305243002a300253002b300243002a300253002b300243002a300253002b300243002a300253002b300
011200003c325243033130337303303033630331303373033030536305313053730530305363053130537305243002a300253002b300243002a300253002b300243002a300253002b300243002a300253002b300
010300003051534515044050440610406044050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102000013234004351423400435152340043516234004351723400435172340043516233004351523300435142330043513233004351223300435112330043510233004350f233004350e233004350d23300435
012600003f214006250873405731027210172100711067000570004700037000270001700007002d205006052c205006052b205006052a2050060529205006052420500205002050020500205002050020500205
010700000c6241c6252b6002f60024600286002b6002f6003060034600376001360415604176040c6040e60410604116041360400000000000000000000000000000000000000000000000000000000000000000
01010000090230010518605000000c10500000000000000000000000000000000000000000000000000000000c005000000000000000000000000000000000000000000000000000000000000000000000000000
010600002336311000103330400010705107031070513005306041070310705000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010600001c36311000103331031310303107031070513005306041070310705000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0105000017153001450003500025070001300009000150000b000170000c000180000c000180000c000180000c000180000c00018000210022100221002000000000000000000000000000000000000000000000
010c0a0c04044047410504105741070410774109041097410b0410b7410c0410c7410c000180000c000180000c000180000c00018000210022100221002000000000000000000000000000000000000000000000
__music__
04 00011c5f
01 06074344
00 06074344
00 08094344
00 0b0a4344
00 08094344
00 0b0c4344
00 08094344
00 0b0a4344
00 08094344
00 0b0c4344
00 0e0d4344
00 0f104344
00 0e114344
02 12134344
01 14154344
00 14154344
00 14154344
00 14154344
00 16175e5f
00 16174344
00 18194344
02 1a1b4344
00 2728797b
01 23256060
00 23256162
00 23244344
00 23244344
00 29264344
00 23244344
02 2a2b4344
04 41422c2d
04 1d1e5d5e
03 2e2f6e6f
00 41422122
00 41425344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
03 39424344

