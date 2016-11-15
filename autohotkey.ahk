#Persistent
#SingleInstance force
^m::Send, Df201616{Enter}
#n::
Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
WinWait, Untitled - Google Chrome, 
IfWinNotActive, Untitled - Google Chrome, , WinActivate, Untitled - Google Chrome, 
WinWaitActive, Untitled - Google Chrome, 
Send, {CTRLDOWN}l{CTRLUP}
WinWait, Taplika Search - Google Chrome, 
IfWinNotActive, Taplika Search - Google Chrome, , WinActivate, Taplika Search - Google Chrome, 
WinWaitActive, Taplika Search - Google Chrome, 
Send, google.com{ENTER}
WinWait, Google - Google Chrome, 
IfWinNotActive, Google - Google Chrome, , WinActivate, Google - Google Chrome, 
WinWaitActive, Google - Google Chrome, 
Send, autohotkey
WinWait, autohotkey - Google Search - Google Chrome, 
IfWinNotActive, autohotkey - Google Search - Google Chrome, , WinActivate, autohotkey - Google Search - Google Chrome, 
WinWaitActive, autohotkey - Google Search - Google Chrome, 
Send, tkey{ENTER}{TAB}{ENTER}
return

#t::Run, C:\Users\b41395\Documents\ConEmuPack.160111\ConEmu64.exe
RControl & RShift::AltTab  ; Hold down right-control then press right-shift repeatedly to move forward.
RControl & Enter::ShiftAltTab  ; Without even having to release right-control, press Enter to reverse direction.


#IfWinActive ahk_class AcrobatSDIWindow
h:: 
if (inAcrobatSearchMode)
  Send h
else Send {Left}
return

j::
if (inAcrobatSearchMode)
  Send j 
else Send {Down}
return

k::
if (inAcrobatSearchMode)
  Send k 
else Send {Up}
return

l::
if (inAcrobatSearchMode)
  Send l 
else Send {Right}
return

n::
if (inAcrobatSearchMode)
  Send n
else Send {F3}{Esc}
return

+n::
if (inAcrobatSearchMode)
  Send N
else Send +{F3}{Esc}
return

+g::
if (inAcrobatSearchMode)
  Send G
else Send {End} 
return

; see http://stackoverflow.com/questions/1794258/detect-a-double-key-press-in-autohotkey

g::
if (inAcrobatSearchMode)
  Send g
else {
  if (A_PriorHotkey <> "g" or A_TimeSincePriorHotkey > 400) {
      ; Too much time between presses, so this isn't a double-press.
      KeyWait, g
      return
  }
  Send {Home}
}
return

/::
if (inAcrobatSearchMode)
  Send /
else {
  inAcrobatSearchMode := true
  Send ^f
}
return

Esc::
inAcrobatSearchMode := false
Send {Esc}
return

^[::
inAcrobatSearchMode := false
Send {Esc}
return

Enter::
if (inAcrobatSearchMode) {
  inAcrobatSearchMode := false
}
Send {Enter}
return

;go back into normal mode after scrolling with any control command

^e::
inAcrobatSearchMode := false
Send {Esc}{Down}
return

^y::
inAcrobatSearchMode := false
Send {Esc}{Up}
return

^f::
inAcrobatSearchMode := false
Send {Esc}{PgDn}
return

^b::
inAcrobatSearchMode := false
Send {Esc}{PgUp}
return

#IfWinActive

:*:/ip::
	Send, %A_IPAddress1%
return
;::6ul::/proj/imx6ul/design/workarea/b41395/
;::6ull::/proj/imx6ull/design/workarea/b41395/
::@df::fei.du@nxp.com
::tjnpe::TJN PE Weekly ww1016 DF JJ 
::@team::Jianguang Cao <jianguang.cao@nxp.com>; Le Chang <le.chang@nxp.com>; Xin Cui <xin.cui@nxp.com>; Haifeng Hu <haifeng.hu@nxp.com>; Pengyan Li <pengyan.li@nxp.com>; Wen Li <winnie.li@nxp.com>; Zheyuan Liu <zheyuan.liu@nxp.com>; Bin Lu <bin.lu@nxp.com>; Kan Liu <kan.liu@nxp.com>; Ken Song <ken.song@nxp.com>; Siliang Wang <siliang.wang@nxp.com>; Zhicheng Wang <zhicheng.wang@nxp.com>; Li Jiang Wu <lijiang.wu@nxp.com>; Yunpeng Xu <yunpeng.xu@nxp.com>; Wanyuan Yu <wanyuan.yu@nxp.com>; Hongxu Zhang <hongxu.zhang@nxp.com>; Rixing Zhao <rixing.zhao@nxp.com>; Bin Wang <bin.wang@nxp.com>;Shawn Han <shawn.han@nxp.com>
;OnClipboardChange:
;ToolTip Clipboard data type: %A_EventInfo%
;a = %A_eventinfo%
;if (a = 2)
;{
	;send {lcontrol down}c{lcontrol up}
	;Sleep 100
	;Send {LControl down}``{LControl up}
	;send gps SnippingTool -ErrorAction SilentlyContinue | spps {Enter}
	;Send {LControl down}``{LControl up}
;}
Sleep 1000
ToolTip  ; Turn off the tip.
return
