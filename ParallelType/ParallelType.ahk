/*
     Author:  Troy
     Version: 
     v0.1:    2014-11-18 Test & left hand only
*/

#SingleInstance
#MaxHotkeysPerInterval 200

KeyCnt=0
KeyBit=0
goto FnEvent
return

FnEvent:
    if (KeyCnt==0){
        KeyOutput=
		if ((KeyBit&(1<<3))&&(KeyBit&(1<<5)))
		{
			KeyOutput=%KeyOutput%y
			KeyBit:=KeyBit&(2147483647^((1<<3)|(1<<5)))
		}
		if ((KeyBit&(1<<3))&&(KeyBit&(1<<21)))
		{
			KeyOutput=%KeyOutput%u
			KeyBit:=KeyBit&(2147483647^((1<<3)|(1<<21)))
		}
		if ((KeyBit&(1<<5))&&(KeyBit&(1<<18)))
		{
			KeyOutput=%KeyOutput%i
			KeyBit:=KeyBit&(2147483647^((1<<5)|(1<<18)))
		}
		if ((KeyBit&(1<<3))&&(KeyBit&(1<<18)))
		{
			KeyOutput=%KeyOutput%o
			KeyBit:=KeyBit&(2147483647^((1<<3)|(1<<18)))
		}
		if ((KeyBit&(1<<2))&&(KeyBit&(1<<23)))
		{
			KeyOutput=%KeyOutput%p
			KeyBit:=KeyBit&(2147483647^((1<<2)|(1<<23)))
		}
		if ((KeyBit&(1<<4))&&(KeyBit&(1<<17)))
		{
			KeyOutput=%KeyOutput%h
			KeyBit:=KeyBit&(2147483647^((1<<4)|(1<<17)))
		}
		if ((KeyBit&(1<<4))&&(KeyBit&(1<<5)))
		{
			KeyOutput=%KeyOutput%j
			KeyBit:=KeyBit&(2147483647^((1<<4)|(1<<5)))
		}
		if ((KeyBit&(1<<17))&&(KeyBit&(1<<22)))
		{
			KeyOutput=%KeyOutput%k
			KeyBit:=KeyBit&(2147483647^((1<<17)|(1<<22)))
		}
		if ((KeyBit&(1<<4))&&(KeyBit&(1<<22)))
		{
			KeyOutput=%KeyOutput%l
			KeyBit:=KeyBit&(2147483647^((1<<4)|(1<<22)))
		}
		if ((KeyBit&(1<<2))&&(KeyBit&(1<<21)))
		{
			KeyOutput=%KeyOutput%n
			KeyBit:=KeyBit&(2147483647^((1<<2)|(1<<21)))
		}
		if ((KeyBit&(1<<21))&&(KeyBit&(1<<23)))
		{
			KeyOutput=%KeyOutput%m
			KeyBit:=KeyBit&(2147483647^((1<<21)|(1<<23)))
		}
		if (KeyBit&(1<<16))
		{
			KeyOutput=%KeyOutput%q
			KeyBit:=KeyBit&(2147483647^(1<<16))
		}
		if (KeyBit&(1<<22))
		{
			KeyOutput=%KeyOutput%w
			KeyBit:=KeyBit&(2147483647^(1<<22))
		}
		if (KeyBit&(1<<4))
		{
			KeyOutput=%KeyOutput%e
			KeyBit:=KeyBit&(2147483647^(1<<4))
		}
		if (KeyBit&(1<<17))
		{
			KeyOutput=%KeyOutput%r
			KeyBit:=KeyBit&(2147483647^(1<<17))
		}
		if (KeyBit&(1<<19))
		{
			KeyOutput=%KeyOutput%t
			KeyBit:=KeyBit&(2147483647^(1<<19))
		}
		if (KeyBit&(1<<0))
		{
			KeyOutput=%KeyOutput%a
			KeyBit:=KeyBit&(2147483647^(1<<0))
		}
		if (KeyBit&(1<<18))
		{
			KeyOutput=%KeyOutput%s
			KeyBit:=KeyBit&(2147483647^(1<<18))
		}
		if (KeyBit&(1<<3))
		{
			KeyOutput=%KeyOutput%d
			KeyBit:=KeyBit&(2147483647^(1<<3))
		}
		if (KeyBit&(1<<5))
		{
			KeyOutput=%KeyOutput%f
			KeyBit:=KeyBit&(2147483647^(1<<5))
		}
		if (KeyBit&(1<<6))
		{
			KeyOutput=%KeyOutput%g
			KeyBit:=KeyBit&(2147483647^(1<<6))
		}
		if (KeyBit&(1<<25))
		{
			KeyOutput=%KeyOutput%z
			KeyBit:=KeyBit&(2147483647^(1<<25))
		}
		if (KeyBit&(1<<23))
		{
			KeyOutput=%KeyOutput%x
			KeyBit:=KeyBit&(2147483647^(1<<23))
		}
		if (KeyBit&(1<<2))
		{
			KeyOutput=%KeyOutput%c
			KeyBit:=KeyBit&(2147483647^(1<<2))
		}
		if (KeyBit&(1<<21))
		{
			KeyOutput=%KeyOutput%v
			KeyBit:=KeyBit&(2147483647^(1<<21))
		}
		if (KeyBit&(1<<1))
		{
			KeyOutput=%KeyOutput%b
			KeyBit:=KeyBit&(2147483647^(1<<1))
		}
        StringLen,len,KeyOutput
        if (len==1)
            Send, %KeyOutput%
        KeyBit:=0
    }
return

a::
    if Pa
        return
    Pa=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<0)
    gosub FnEvent
return

a UP::
    Pa=0
    KeyCnt-=1
    gosub FnEvent
return

b::
    if Pb
        return
    Pb=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<1)
    gosub FnEvent
return

b UP::
    Pb=0
    KeyCnt-=1
    gosub FnEvent
return

c::
    if Pc
        return
    Pc=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<2)
    gosub FnEvent
return

c UP::
    Pc=0
    KeyCnt-=1
    gosub FnEvent
return

d::
    if Pd
        return
    Pd=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<3)
    gosub FnEvent
return

d UP::
    Pd=0
    KeyCnt-=1
    gosub FnEvent
return

e::
    if Pe
        return
    Pe=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<4)
    gosub FnEvent
return

e UP::
    Pe=0
    KeyCnt-=1
    gosub FnEvent
return

f::
	if Pf
		return
	Pf=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<5)
	gosub FnEvent
return

f UP::
	Pf=0
	KeyCnt-=1
	gosub FnEvent
return

g::
	if Pg
		return
	Pg=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<6)
	gosub FnEvent
return

g UP::
	Pg=0
	KeyCnt-=1
	gosub FnEvent
return

h::
	if Ph
		return
	Ph=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<7)
	gosub FnEvent
return

h UP::
	Ph=0
	KeyCnt-=1
	gosub FnEvent
return

i::
	if Pi
		return
	Pi=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<8)
	gosub FnEvent
return

i UP::
	Pi=0
	KeyCnt-=1
	gosub FnEvent
return

j::
	if Pj
		return
	Pj=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<9)
	gosub FnEvent
return

j UP::
	Pj=0
	KeyCnt-=1
	gosub FnEvent
return

k::
	if Pk
		return
	Pk=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<10)
	gosub FnEvent
return

k UP::
	Pk=0
	KeyCnt-=1
	gosub FnEvent
return

l::
	if Pl
		return
	Pl=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<11)
	gosub FnEvent
return

l UP::
	Pl=0
	KeyCnt-=1
	gosub FnEvent
return

m::
	if Pm
		return
	Pm=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<12)
	gosub FnEvent
return

m UP::
	Pm=0
	KeyCnt-=1
	gosub FnEvent
return

n::
	if Pn
		return
	Pn=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<13)
	gosub FnEvent
return

n UP::
	Pn=0
	KeyCnt-=1
	gosub FnEvent
return

o::
	if Po
		return
	Po=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<14)
	gosub FnEvent
return

o UP::
	Po=0
	KeyCnt-=1
	gosub FnEvent
return

p::
	if Pp
		return
	Pp=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<15)
	gosub FnEvent
return

p UP::
	Pp=0
	KeyCnt-=1
	gosub FnEvent
return

q::
	if Pq
		return
	Pq=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<16)
	gosub FnEvent
return

q UP::
	Pq=0
	KeyCnt-=1
	gosub FnEvent
return

r::
	if Pr
		return
	Pr=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<17)
	gosub FnEvent
return

r UP::
	Pr=0
	KeyCnt-=1
	gosub FnEvent
return

s::
	if Ps
		return
	Ps=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<18)
	gosub FnEvent
return

s UP::
	Ps=0
	KeyCnt-=1
	gosub FnEvent
return

t::
	if Pt
		return
	Pt=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<19)
	gosub FnEvent
return

t UP::
	Pt=0
	KeyCnt-=1
	gosub FnEvent
return

u::
	if Pu
		return
	Pu=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<20)
	gosub FnEvent
return

u UP::
	Pu=0
	KeyCnt-=1
	gosub FnEvent
return

v::
	if Pv
		return
	Pv=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<21)
	gosub FnEvent
return

v UP::
	Pv=0
	KeyCnt-=1
	gosub FnEvent
return

w::
	if Pw
		return
	Pw=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<22)
	gosub FnEvent
return

w UP::
	Pw=0
	KeyCnt-=1
	gosub FnEvent
return

x::
	if Px
		return
	Px=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<23)
	gosub FnEvent
return

x UP::
	Px=0
	KeyCnt-=1
	gosub FnEvent
return

y::
	if Py
		return
	Py=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<24)
	gosub FnEvent
return

y UP::
	Py=0
	KeyCnt-=1
	gosub FnEvent
return

z::
	if Pz
		return
	Pz=1
	KeyCnt+=1
	KeyBit:=KeyBit|(1<<25)
	gosub FnEvent
return

z UP::
	Pz=0
	KeyCnt-=1
	gosub FnEvent
return

