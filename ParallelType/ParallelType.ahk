/*
    Name: Parallel Typing Assistant
    Author:  Troy
    Version: 
        v0.2;   2014-11-20 Use RegEx instead of if expr; main algo finished
        v0.1:   2014-11-18 Test & left hand only
*/

#SingleInstance
#MaxHotkeysPerInterval 200

LST=QWERTASDFGZXCVBYUIOPHJKL1NM234
LUT=ABCDEFGHIJKLMNOPQRSTUVWXYZ1234 

SetBatchLines -1

KeyCnt=0
KeyBit=0
goto FnEvent
sleep ,1000
return

FnEvent:
    if (KeyCnt==0){
        KeyOutput=%LST%
        i=0
        while (i<31)
        {
            if (!(KeyBit&(1<<i)))
            {
                tmp:=SubStr(LUT,(i+1),1)
                StringReplace, KeyOutput, KeyOutput, %tmp%
            }
            i+=1
        }
        KeyBit=0

        ; Left-hand Side
        KeyOutput:=RegExReplace(KeyOutput,"^DF","y")
        KeyOutput:=RegExReplace(KeyOutput,"^DV","u")
        KeyOutput:=RegExReplace(KeyOutput,"^SF","i")
        KeyOutput:=RegExReplace(KeyOutput,"^SD","o")
        KeyOutput:=RegExReplace(KeyOutput,"^XC","p")
        KeyOutput:=RegExReplace(KeyOutput,"^ER","h")
        KeyOutput:=RegExReplace(KeyOutput,"^EF","j")
        KeyOutput:=RegExReplace(KeyOutput,"^WR","k")
        KeyOutput:=RegExReplace(KeyOutput,"^WE","l")
        KeyOutput:=RegExReplace(KeyOutput,"^CV","n")
        KeyOutput:=RegExReplace(KeyOutput,"^XV","m")
        KeyOutput:=RegExReplace(KeyOutput,"^Q","q")
        KeyOutput:=RegExReplace(KeyOutput,"^W","w")
        KeyOutput:=RegExReplace(KeyOutput,"^E","e")
        KeyOutput:=RegExReplace(KeyOutput,"^R","r")
        KeyOutput:=RegExReplace(KeyOutput,"^T","t")
        KeyOutput:=RegExReplace(KeyOutput,"^A","a")
        KeyOutput:=RegExReplace(KeyOutput,"^S","s")
        KeyOutput:=RegExReplace(KeyOutput,"^D","d")
        KeyOutput:=RegExReplace(KeyOutput,"^F","f")
        KeyOutput:=RegExReplace(KeyOutput,"^G","g")
        KeyOutput:=RegExReplace(KeyOutput,"^Z","z")
        KeyOutput:=RegExReplace(KeyOutput,"^X","x")
        KeyOutput:=RegExReplace(KeyOutput,"^C","c")
        KeyOutput:=RegExReplace(KeyOutput,"^V","v")
        KeyOutput:=RegExReplace(KeyOutput,"^B","b")

        ; Right-hand Side
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)23$","p")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)KL$","o")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)JL$","i")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)KM$","u")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)JK$","y")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)IO$","l")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)UO$","k")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)IJ$","j")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)UI$","h")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)M3$","m")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)M2$","n")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)3$","x")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)4$","z")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)Y$","t")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)U$","r")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)I$","e")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)O$","w")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)P$","q")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)H$","g")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)J$","f")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)K$","d")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)L$","s")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)1$","a")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)N$","b")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)M$","v")
        KeyOutput:=RegExReplace(KeyOutput,"(?!^)2$","c")

        ; Symbols
        KeyOutput:=RegExReplace(KeyOutput,"^1$",";")
        KeyOutput:=RegExReplace(KeyOutput,"^2$",",")
        KeyOutput:=RegExReplace(KeyOutput,"^3$",".")
        KeyOutput:=RegExReplace(KeyOutput,"^4$","/")
        KeyOutput:=RegExReplace(KeyOutput,"^Y$","@")
        KeyOutput:=RegExReplace(KeyOutput,"^U$","^")
        KeyOutput:=RegExReplace(KeyOutput,"^I$","!")
        KeyOutput:=RegExReplace(KeyOutput,"^O$","?")
        KeyOutput:=RegExReplace(KeyOutput,"^P$","~")
        KeyOutput:=RegExReplace(KeyOutput,"^N$","(")
        KeyOutput:=RegExReplace(KeyOutput,"^M$",")")

        if RegExMatch(KeyOutput,"[A-Z0-9]")
            return
        Send, %KeyOutput%
    }
return

a::
    if Pa
        return
    Pa=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<0)
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
return

z UP::
	Pz=0
	KeyCnt-=1
	gosub FnEvent
return

SC027::
    if Psemicolon
        return
    Psemicolon=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<26)
return

SC027 UP::
    Psemicolon=0
    KeyCnt-=1
    gosub FnEvent
return

SC033::
    if Pcomma
        return
    Pcomma=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<27)
return

SC033 UP::
    Pcomma=0
    KeyCnt-=1
    gosub FnEvent
return

SC034::
    if Pdot
        return
    Pdot=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<28)
return

SC034 UP::
    Pdot=0
    KeyCnt-=1
    gosub FnEvent
return

SC035::
    if Pslash
        return
    Pslash=1
    KeyCnt+=1
    KeyBit:=KeyBit|(1<<29)
return

SC035 UP::
    Pslash=0
    KeyCnt-=1
    gosub FnEvent
return

#t::
    suspend
return
