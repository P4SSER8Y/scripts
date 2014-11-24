    tooltip, READY
    i=0
return

DEADLOOP:
    i+=1
    send ,^v
    send , {Space} {x}%i%
    send , {Enter}
    tooltip ,%i%
return

$z::
    SetTimer,DEADLOOP,500
    SetTimer,DEADLOOP,On
    tooltip, RUNNING
return

$x::
    Exitapp
return
