    strComputer = "."
     
    Set objWMIService = GetObject("winmgmts:" & "!\\" & strComputer & "\root\cimv2")
    Set colAdapters = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where IPEnabled = True")
    For Each objAdapter in colAdapters
     
    IPdebut = LBound(objAdapter.IPAddress)
    IPfin = UBound(objAdapter.IPAddress)
    If (objAdapter.IPAddress(IPdebut) <> "") then
     
     
    For i = IPdebut To IPfin
	If InStr(objAdapter.IPAddress(i),":") = 0 Then 
	Wscript.Echo ";" & Join(objAdapter.DefaultIPGateway, ",")
	End if
    Next
    
    
	
	End If
    Next
     