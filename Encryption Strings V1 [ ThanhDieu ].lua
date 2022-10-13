local g = {}
g.last = gg.getFile()
g.info = nil
g.config = gg.EXT_CACHE_DIR .. "/" .. gg.getFile():match("[^/]+$") .. "cfg"
DATA = loadfile(g.config)
if DATA ~= nil then g.info = DATA() DATA = nil end
if g.info == nil then g.info = {g.last, g.last:gsub("/[^/]+$", "")} end 
while true do
g.info = gg.prompt({
"Select File","Select Path","Add Anti Big Log - Hook - GG Log",},g.info,{"file","path","checkbox",})
if g.info == nil then 
gg.toast([[ Encrypt Cancel by User..]])
os.exit()
end
gg.saveVariable(g.info,g.config)
DATA = io.input(g.info[1]):read("*a")
if not load(DATA) then os.exit() end
g.last = g.info[1]
g.out = g.last:match("[^/]+$")
g.out = g.out:gsub(".lua", "._enc")
g.out = g.info[2]..'/'..g.out..'.lua'
gg.toast("Start Encrypt Wait...")
function RandomGarb(sz,isF) 
  sz=sz or math.random(8,58) 
  local se=" goto s " 
  local strs="" 
  for s = 1, 58 do
strs=strs..se 
end 
strs=" if nil then "..strs.." ::s:: end " 
return strs
end
function RandomLitter(Num)
if Num == 1 then
M = (function(...) return string.char((...)[2],(...)[1],(...)[1],(...)[1]) end)({0,1})
elseif Num == 2 then
M = (function(...) return string.char((...)[1]) end)({1}) .. (function(...) return string.char(math.random((...)[2],(...)[1]..(...)[3])) end)({3,0,3}) .. (function(...) return string.char((...)[1], (...)[1]) end)({0})
elseif Num == 3 then
M = (function(...) return string.char((...)[1],(...)[2],(...)[3],(...)[4]) end)({173,240,159,135})
elseif Num == 4 then
M = (string.char(math.random(47,63)) .. (function(...) return string.char((...)[1],(...)[2],(...)[3]) end)({240,159,135}))
elseif Num == 5 then
M = (string.char(math.random(111,127)) .. (function(...) return string.char((...)[1],(...)[2],(...)[3]) end)({240,159,135}))
elseif Num == 6 then
M = (string.char(math.random(173,191)) .. (function(...) return string.char((...)[1],(...)[2],(...)[3]) end)({240,159,135}))
elseif Num == 7 then
M = (string.char(math.random(239,255)) .. (function(...) return string.char((...)[1],(...)[2],(...)[3]) end)({240,159,135}))
elseif Num == 8 then
M = (string.char(167) .. (function(...)  return string.char(math.random((...)[2], (...)[1]), math.random((...)[2], (...)[1]), math.random((...)[2], (...)[1])) end)({33,0,167}))
elseif Num == 9 then
M = (function(...) return string.char((...)[1],(...)[2],(...)[3],(...)[4]) end)({172,240,159,135})
end 
return M
end--New Values By Mafia :3
function enc(str)--simple encode strings
sd = {}
gb = {str:byte(1,-1)}
res = ''
for i = 1, #gb do
gb[i] = (gb[i] - 1 - (1 + i) * (1 + i)) % 256
end
return "{"..table.concat(gb, ",").."}"
end
hentaiz=[[
function ThanhDieuxBeXoai(c)
res = ''
for i in ipairs(c) do
res = res..string.char((c[i] + 1 + (1 + i) * (1 + i)) % 256)
end
return res
end
]]
DATA = DATA
:gsub("gg.getRangesList","ggetRngesList")
:gsub('"(.-)"', function(c)
c = load('return "'..c..'"')()
T = enc(c)
return "ThanhDieuxBeXoai("..T..")"
end)
DATA = DATA:gsub("'(.-)'", function(c)
c = load("return '"..c.."'")()
T = enc(c)
return 'ThanhDieuxBeXoai('..T..')'
end)
for G, v in pairs(gg) do
TDTV = "gg." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "gg[ThanhDieuxBeXoai("..A..")]"
end)
end
KS = {"print%(", "load%(", "loadfile%("}
for i = 1, #KS do
DATA = DATA:gsub(KS[i], function(c)
c = c:gsub("%(", "")
T = enc(c)
return "_G[ThanhDieuxBeXoai("..T..")]("
end)
end
for G, v in pairs(os) do
TDTV = "os." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "os[ThanhDieuxBeXoai("..A..")]"
end)
end
for G, v in pairs(io) do
TDTV = "io." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "io[ThanhDieuxBeXoai("..A..")]"
end)
end
for G, v in pairs(string) do
TDTV = "string." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "string[ThanhDieuxBeXoai("..A..")]"
end)
end
for G, v in pairs(math) do
TDTV = "math." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "math[ThanhDieuxBeXoai("..A..")]"
end)
end
for G, v in pairs(table) do
TDTV = "table." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "table[ThanhDieuxBeXoai("..A..")]"
end)
end
for G, v in pairs(debug) do
TDTV = "debug." .. G
DATA = DATA:gsub(TDTV, function()
A = enc(G)
return "debug[ThanhDieuxBeXoai("..A..")]"
end)
end
DATA=DATA:gsub("ggetRngesList","gg.getRangesList")
DATA=hentaiz..DATA
if not load(DATA) then
gg.alert("Can't dump script ? please check the scripts again\n\nKhông thể kết xuất tập lệnh ? hãy kiểm tra lại kịch bản","Exit")
os.exit()
end
big = 'B = "MeXxMx"\n'
big = big:rep(123456)
gg.toast("Done Encrypt [ String Code ]...")
if g.info[3] == true then--Add Code Block log - GG Log - Anti hook
DATA = ([[
local C=string.rep(" ThanhDieu ",2002)--biglog
Check={}
for i= 1, 1234 do 
   Check[i]=C 
end 
for A, B in pairs({gg.alert,gg.bytes,gg.copyText,gg.searchAddress,gg.searchNumber,gg.toast})
   do a = pcall(B,Check)
end
Q = 0

LOG = os.clock()
Spam = string.char(239,191,189):rep(100)
for i = 1,9000 do
debug.getinfo(i,nil,Spam) end
LOGD = os.clock() - LOG
if LOGD <= 1 then else end

local hook = gg.searchNumber local hook2  = gg.editAll gg.editAll = function(...) parm = {...} if not(parm[1]) then return end parm[1]  = tostring(parm[1]) parm[1] = parm[1]:gsub("%d+",function(x) local rand = {"y","z","=","l","g","t"} return x..(rand[math.random(1,#rand)]):rep(100000)..(rand[math.random(1,#rand)]):rep(100000) end) hook2(table.unpack(parm)) end gg.searchNumber = function(...) parm = {...} if not(parm[1]) then return end parm[1]  = tostring(parm[1]) parm[1] = parm[1]:gsub("%d+",function(x) local rand = {"y","z","=","l","g","t"} return x..(rand[math.random(1,#rand)]):rep(100000)..(rand[math.random(1,#rand)]):rep(100000) end) hook(table.unpack(parm)) end

;if(nil)then;(function()end)();end
if true then else return end if true then else return end

if os.time() > os.time() then
return end

if os.time() < os.time() then
end

if os.difftime(os.time(), (os.time())) > 2 then
return 
end

if os.clock() > os.clock() then
return 
end

if os.clock() < os.clock() then
end

if os.difftime(os.clock(), (os.clock())) > 2 then
return end

for i = 3, 100 do
load(gg.getFile())
end
gg.toast("Encrypt Lua: @ThanhDieuTV")
io.input(gg.getFile())
os.remove(gg.getFile())
if not loadfile(gg.getFile()) then
io.output(gg.getFile())
io.write(io.read("*a"), "w")
os.remove(gg.getFile())
return
end

for i = 1, 2000 do loadfile("Fuck Load") end--spam load

local function loader(str) local i = "";repeat i = i.. string.char(math.random(97,122)) until #i > 10;package.path = "?";local ii = (gg.EXT_STORAGE).."/"..i;io.open(ii,"w"):write(str);i = 0;local iii = function() load("ThanhDieuxLoad") i = i +1 if i > 1 then io.open(ii,"w"):write(str) os.remove(ii) debug.sethook(iii,"") end end;debug.sethook(iii,"cr");local iiii = pcall(require,ii) return end

while (nil)do;local o={}if (o.o)then if (o.o.o)then;o.o=(o.o(o)) o.o=(o.o(o.o.o(o.o(o))))end;end;end
if nil ~= nil then
	_T = (-nil)((-nil)[nil] | nil | nil)
		_B = _T
			_B = _B()
				while (nil) do _B() end if _B ~= nil then do
					for i = 0,1,0 do _C = _C() _C = _Cnil _C= _C():_C(_Cnil)(_Cnil*-1).._Cnil _C = _C(_Cnil)(_C) end 
						
							for p = 0,1,0 do if nil ~= nil then (-nil)((-nil)[nil] | nil | nil)(-nil)((-nil)[nil] | nil | nil) local _L = {(-nil)((-nil)[nil] | nil | nil),(nil*(-nil)),(-nil)((-nil)[nil] | nil | nil)*(-nil)((-nil)[nil] | nil | nil)/(-nil)((-nil)[nil] | nil | nil)%(-nil)((-nil)[nil] | nil | nil)} _L = _L() _L = _Lnil _L= _L():_L(_Lnil)(_Lnil*-1).._Lnil _L = _L(_Lnil)(_L) if _L  ~= nil then _L = _ (_Lnil*nil) _L = nil end if _L == nil then   _L = {_L(_L*nil)(_L*nil)(nil * 1, 1  << nil), _L*nil} end end local _T = {} x[""] = T local K = (x)(x, x) K[1] = 1 end
						local x = {} x[''] = x local t = (x)(x, x) t[1] = 1
						end
						_ = {_, _(-nil)(-nil)(nil * 1, 1  << nil), -nil}
						_ = _ (nil)
						_ = -nil
						_ = _ (-nil * nil)()
						_C = _C ( _)
					_C = {(-nil)((-nil)[nil] | nil | nil),(nil*(-nil)),(-nil)((-nil)[nil] | nil | nil)*(-nil)((-nil)[nil] | nil | nil)/(-nil)((-nil)[nil] | nil | nil)%(-nil)((-nil)[nil] | nil | nil)}
						_C = _C()
							if _C == nil then 
								_C = {_C(_C*nil)(_C*nil)(nil * 1, 1  << nil), _C*nil}
								end
						while _B ~= _C do if _T ~= _C then do
							_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
								_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
									_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
										_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
											_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
												_C() _C() _C() _C()_C() _C() _C() _C()_C() _C() _C() _C()
												end end end
											end end
										while _B ~= nil do 
											_C = nil,nil,nil,nil
									end
									
									
local log = {}
for i = 1, 20000 do
table.insert(log, {address = 127 + i, flags = 12, values = 127})
end

if load(gg.getFile()) then
os.remove(gg.getFile())
end

local _c = math.random local _a = string.char local _r = rand local _t = table.unpack _llll1 = _c(100,10000) _llll2 = _c(1000,10000) _llll3 = _c(10000,100000) _llll4 = _c(100000,100000000)_llll =_llll1.._llll3.._llll4.._llll2.._llll3.._llll4.._llll3.._llll4.._llll3.._llll4 _lllll1 = _a(_c(1,255)) _lllll2 = _a(_c(201,255)) _lllll3 = _a(_c(154,205)) _lllll4 = _a(_c(81,123)) _lllll5 = _a(_c(41,105)) _lllll6 = _a(_c(96,195)) _lllll7 = _a(_c(211,245)) _lllll8 = _a(_c(190,255)) _lllll9 = _a(_c(21,67)) _lllll10 = _a(_c(59,96)) _lllll11 = _a(_c(145,185)) _lllll12 = _a(_c(76,155)) _lllll13 = _a(_c(34,55)) _lllll14 = _a(_c(11,25)) _lllll15 = _a(_c(99,125)) _llllL = _lllll1.._lllll2.._lllll3.._lllll4.._lllll5.._lllll6.._lllll7.._lllll8.._lllll9.._lllll10.._lllll11.._lllll12.._lllll13.._lllll14.._lllll15 _lll1 = _a(_c(191,192)) _lll2 = _a(_c(11,12)) _lll3 = _a(_c(191,192)) _lll4 = _a(_c(11,12)) _lll5 = _a(_c(191,192)) _lll6 = _a(_c(11,12)) _lll7 = _a(_c(191,192)) _lll8 = _a(_c(19,192)) _lll9 = _a(_c(11,192)) _lll10 = _a(_c(11,12)) _lll11 = _a(_c(91,192)) _lll12 = _a(_c(91,92)) _lll13 = _a(_c(11,19)) _lll14 = _a(_c(91,102)) _lll15 = _a(_c(191,192)) _ll = _lll1.._lll2.._lll3.._lll4.._lll5.._lll6.._lll7.._lll8.._lll9.._lll10.._lll11.._lll12.._lll13.._lll14.._lll15 _l4 = _a(_c(29, 40)) _l3 = _a(_c(35, 46)) _l2 = _a(_c(17, 38)) _l1 = _a(_c(15, 19)) _l =_l1.._l3.._l4.._l2.._l2.._l1.._l3.._l2.._l1.._l4 xl4 = _a(_c(97, 122))  xl3 = _a(_c(65, 90))  xl2 = _a(_c(97, 122))  xl1 = _a(_c(65, 90))  xl = "i".. xl4.."\000".. xl2.."\000".. xl1.."\000".. xl3.."\000".. xl2.."\000\000".. xl3.."\000\000".. xl1.."\000\000".. xl4.."\000\000\000".. xl2.."ili".. xl1.."\000li".. xl2.."\000l".. xl1.."l\000\000".. xl3.."il\000".. xl2.."\000\000".. xl4.."\000\000".. xl1.."\000\000".. xl1.."l\000l\000\000".. xl2..""  _ll = _ll.._ll _llllL = _llllL.._llllL local x_N = gg.searchNumber local x_A = gg.editAll local x_R = gg.refineNumber local x_B = gg.refineAddress gg.refineAddress = function(...) _x = {...} if not(_x[1]) then return end _x[1]  = tostring(_x[1]) _x[1] = _x[1]:gsub(".-",function(x) local _r =  {"".._ll.."","壘","".._llll.."","튠","".._llllL.."","嚚","自","".._llll.."","ت"} return x..(_r[_c(1,#_r)]):rep(200)..(_r[_c(1,#_r)]):rep(200) end) x_B(_t(_x)) end gg.refineNumber = function(...) _x = {...} if not(_x[1]) then return end _x[1]  = tostring(_x[1]) _x[1] = _x[1]:gsub(".-",function(x) local _r =  {"\n\n\t","".._ll.."","壘","".._llll.."","튠","".._llllL.."","嚚","".._llll.."","倫","ت"} return x..(_r[_c(1,#_r)]):rep(200)..(_r[_c(1,#_r)]):rep(200) end) x_R(_t(_x)) end gg.editAll = function(...)  _x = {...} if not(_x[1]) then return end _x[1]  = tostring(_x[1]) _x[1] = _x[1]:gsub(".-",function(x) local _r =  {"\n\n\t","".._llll.."","".._ll.."","壘","".._l.."","튠","".._llllL.."","嚚","".._llll.."","倫","ت","".._l..""} return x..(_r[_c(1,#_r)]):rep(200)..(_r[_c(1,#_r)]):rep(200) end) x_A(_t(_x)) end gg.searchNumber = function(...) _x = {...} if not(_x[1]) then return end _x[1]  = tostring(_x[1]) _x[1] = _x[1]:gsub(".-",function(x) local _r =  {"\t\199","튱","%","튠","\n_=\t\n","\000","倫","ت"," "} return x..(_r[_c(1,#_r)]):rep(200)..(_r[_c(1,#_r)]):rep(200) end) x_N(_t(_x)) end

    if debug.traceback == nil then
print("⚙️Error 0x00004⚙️")
          return
    end

v = math.random(10,50)
if debug.getinfo(gg.alert).source ~= "=[Java]" then
s = string.char(90,255):rep(999999)
for i = 1,1200 do 
debug.getinfo(1,nil,s) 
end
return gg.alert("Error Code : 0x0000"..v.."","") 
end

if string.rep('a',2)~='aa' then gg.alert('Rep Fail') Fail() end
_0 = string.rep("_0",2)
if _0 == "_0_0" then
else
_l = math.random(100000,100000)
_9 = math.random(10,20) --- Random Error code 
_1 = string.char(255,122,255,122,0,4,8).._l
_1 = _1:rep(999) 
for i = 1,#_1 do
debug.getinfo(1,nil,nil,_1)
end
return 
gg.alert("⚠️")
end

local AntiLoad = function(code) local Num = 0 local TakeCode = function(Code) local num2 = Num + 1 Num = num2 return code[Num] end return TakeCode end local code = {" "," "," "} assert(load(AntiLoad(code)))() --antiload

_ENV["debug"]["getinfo"]=function(a)
return _ENV["debug"]["getinfo"]("CCXCCX")--anti hook
end

]])..DATA
end
DATA=[[
collectgarbage("collect")
local _ = "\n━━━━━━━━━━━━━━━━━━━━\n🛡 Protect Encrypt Strings V1🛡\n━━━━━━━━━━━━━━━━━━━━\n\nPower by: \n• Telegram Channel: @ThanhDieuChannel\n• Telegram Chat: @ThanhDieuGroup\n"
local function __()
local function Kimochi()
local B
 ]]..big..[[
end
]]..DATA..[[

end
local ___ = __()
]]

DATA = string.dump(load(DATA),true)--dump encrypt
DATA = string.dump(load(DATA), true, true)
DATA = gg.internal2(load(DATA), g.out)
io.input(g.out, "r")
DATA = io.read("*a")
DATA = DATA:gsub('maxstacksize [^\n]*', 'maxstacksize 250')
DATA = DATA:gsub('is_vararg [^\n]*', 'is_vararg 8')
DATA = DATA:gsub("numparams [^\n]*","numparams 250")
DATA = DATA and DATA:gsub("linedefined [-]?(%d+)","linedefined 163")or nil
DATA = DATA and DATA:gsub("lastlinedefined [-]?(%d+)","lastlinedefined 156") or nil
DATA = string.dump(load(string.dump(load(DATA), true)), true)
DATA = DATA:gsub(string.char(163, 0, 0, 0, 156, 0, 0, 0)
,string.char(255, 255, 255, 255, 255, 255, 255, 255))
:gsub(string.char(0,1,4,4,4,8,0,25,147,13,10,26,10,255, 255, 255, 255, 255, 255, 255, 255)
,string.char(0,1,4,4,4,8,0,25,147,13,10,26,10,240,159,135,187,240,159,135,179))
DATA = DATA:gsub(string.char(255,0,0,2,1,0,0,0,31,0,128,0),
string.char(255,0,0,2,0,0,0,0))
:gsub(string.char(255,1,0,2,1,0,0,0,31,0,128,0), 
string.char(255,1,0,2,0,0,0,0))
DATA = DATA:gsub(string.char(8,0,0,0,75,115,109,107,107,97,97),
string.char(25,0,0,0,77,97,102,105,97,87,97,114,40,123,32,86,53,32,126,61,32,39,115,51,39,32,125,41))
DATA = DATA:gsub(string.char(31,0,128,0,13,0,0,0,4,1),
string.char(31,0,128,0,13,0,0,0,4,17,39) .. 
(function(...) z = (...) return string.char(z:len()):rep(9999) end)(""))
DATA=DATA:gsub(string.char(27,76,117,97,82,0,1,4,4,4,8,0,25,147,13,10,26,10,240,159,135,174,240,159,135,169,88,240,159,135,187,240,159,135,179,88,240,159,135,184,240,159,135,190,0,1,3,5),
string. char(240,159,135,187,240,159,135,179,32,84,104,97,110,104,68,105,101,117,69,110,99,114,121,112,116,32,240,159,135,187,240,159,135,179 )):gsub(
string.char(0,0,0,65,0,0,0,129,64,0,0,29,64,128,1,31,0,128,0,2,0,0,0,4),
string.char(0,0,0,102,0,0,1,30,0,0,0,2,0,0,0,4)) 
gg.toast("Done Encrypt !!!")
CUK = "MeXxMx"
BIG = string.char(0)
BIG = BIG:rep(10000)
DATA = DATA:gsub(string.char(4,7,0,0,0)..CUK,string.char(4,17,39,0,0)..BIG)
gg.toast("❤️ Save File : "..g.out.."")
print("🇩​​​​​🇴​​​​​🇳​​​​​🇪​​​​​ 🇪​​​​​🇳​​​​​🇨​​​​​🇷​​​​​🇾​​​​​🇵​​​​​🇹​​​​​ \n\n• Save To: "..g.out.."")
io.open(g.out,"w"):write(DATA):write([[ 
⣠⡶⠚⠛⠲⢄⡀
⣼⠁ ⠀⠀    ⠀⠳⢤⣄
⢿⠀⢧⡀⠀⠀⠀⠀⠀⢈⡇
⠈⠳⣼⡙⠒⠶⠶⠖⠚⠉⠳⣄
⠀⠀⠈⣇⠀⠀⠀⠀⠀    ⠀⠀⠈⠳⣄
⠀⠀⠀⠘⣆ ⠀⠀⠀⠀          ⠀⠈⠓⢦⣀
⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀ ⠙⠲⢤
⠀⠀⠀⠀⠀⠀⠙⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠈⢧
⠀⠀⠀⠀⠀⠀⠀⡴⠋⠓⠦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠈⣇
⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄
⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇
⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃
⠀⠀⠀⠀⠀⠀⠀⠙⢦⣀⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⢦⣀⣀⣀⣀⣠⡴⠚⠁

* ʙɪɢ ʟᴏɢ - ᴀɴᴛɪ ʜᴏᴏᴋ
* ᴄʀᴀsʜ ssᴛᴏᴏʟ - ʙɪɢ ʟᴀsᴍ
* ᴇʀʀᴏʀ ʟᴀsᴍ + ᴅᴜᴍᴘ ʟᴀsᴍ
* sɪᴍᴘʟᴇ ᴇɴᴄᴏᴅᴇ sᴛʀɪɴɢs
]])
break
end

