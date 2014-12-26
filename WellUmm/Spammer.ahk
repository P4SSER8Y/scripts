    tooltip, READY
    i=0
return

DEADLOOP:
    send ,^v
    send , {Space} {x}%i%
    send , {Enter}
    tooltip ,%i%
    i+=1
return

$z::
    SetTimer,DEADLOOP,500
    SetTimer,DEADLOOP,On
    tooltip, RUNNING
return

$x::
    Exitapp
return
