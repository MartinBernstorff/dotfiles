"use strict";var O=Object.create;var m=Object.defineProperty;var T=Object.getOwnPropertyDescriptor;var J=Object.getOwnPropertyNames;var v=Object.getPrototypeOf,D=Object.prototype.hasOwnProperty;var M=(e,t)=>{for(var o in t)m(e,o,{get:t[o],enumerable:!0})},w=(e,t,o,s)=>{if(t&&typeof t=="object"||typeof t=="function")for(let i of J(t))!D.call(e,i)&&i!==o&&m(e,i,{get:()=>t[i],enumerable:!(s=T(t,i))||s.enumerable});return e};var l=(e,t,o)=>(o=e!=null?O(v(e)):{},w(t||!e||!e.__esModule?m(o,"default",{value:e,enumerable:!0}):o,e)),$=e=>w(m({},"__esModule",{value:!0}),e);var H={};M(H,{default:()=>L});module.exports=$(H);var n=require("@raycast/api"),c=require("react");var F=require("@raycast/api"),p=l(require("fs"));var k=require("@raycast/api");function E(){return(0,k.getPreferenceValues)().build}var x={Code:"vscode","Code - Insiders":"vscode-insiders"};function u(){let e=x[E()];return!e||e.length<=0?x.Code:e}function h(e){return e instanceof Error?e.message:"unknown error"}async function f(e){return p.promises.access(e,p.constants.F_OK).then(()=>!0).catch(()=>!1)}var Z=new Intl.NumberFormat("en",{notation:"compact"});function j(e){return new Promise(t=>setTimeout(t,e))}async function b(e,t=2e3){let o=new Date;for(;o.getTime()>0;){if(await j(10),await f(e))return!0;if(new Date().getTime()-o.getTime()>t)return!1}return!1}function C(e){return`${u()}://tonka3000.raycast/${e}`}async function R(e){await(0,F.open)(C(e))}var a=l(require("fs/promises")),I=l(require("os")),g=l(require("path"));var r=require("react/jsx-runtime");function U(){let e=E();return g.default.join(I.homedir(),`Library/Application Support/${e}/User/globalStorage/tonka3000.raycast/transit`)}function B(e){let t=e.command,o=t.category?`${t.category}: ${t.title}`:t.title;return(0,r.jsx)(n.Action.CreateQuicklink,{shortcut:{modifiers:["cmd"],key:"l"},quicklink:{link:C(`runcommand?cmd=${t.command}`),name:`VSCode - ${o}`}})}async function W(){let e=U();await a.mkdir(e,{recursive:!0});let t=g.default.join(e,"request.json"),o=g.default.join(e,"commands.json");if(await a.writeFile(t,JSON.stringify({command:"writecommands",args:{filename:o}},null,2)),await f(o)&&await a.rm(o),await b(o))return await _(o);throw new Error("Could not get VSCode commands")}function q(e){let t=e.command,o=i=>i.category?`${i.category}: ${i.title}`:i.title,s=async()=>{try{await R(`runcommand?cmd=${t.command}`),(0,n.popToRoot)()}catch(i){(0,n.showToast)({style:n.Toast.Style.Failure,title:"Could not run Command",message:h(i)})}};return(0,r.jsx)(n.List.Item,{title:o(t),actions:(0,r.jsxs)(n.ActionPanel,{children:[(0,r.jsxs)(n.ActionPanel.Section,{children:[(0,r.jsx)(n.Action,{title:"Run Command",onAction:s,icon:{source:n.Icon.Terminal}}),(0,r.jsx)(B,{command:t})]}),(0,r.jsx)(n.ActionPanel.Section,{children:(0,r.jsx)(n.Action.CopyToClipboard,{shortcut:{modifiers:["cmd","shift"],key:"."},title:"Copy Command ID",content:t.command})})]})})}function X(){return(0,r.jsx)(n.Action.OpenInBrowser,{title:"Install Raycast for VSCode",url:`${u()}:extension/tonka3000.raycast`,onOpen:()=>{(0,n.popToRoot)(),(0,n.showHUD)("Open VSCode Extension")}})}function L(){let{isLoading:e,commands:t,error:o,refresh:s}=Q();return o&&(0,n.showToast)({style:n.Toast.Style.Failure,title:"Error",message:o}),(0,r.jsxs)(n.List,{isLoading:e,searchBarPlaceholder:e===!0?"Load Commands from VSCode":"Search Commands",children:[(0,r.jsx)(n.List.Section,{title:"Commands",subtitle:`${t?.length}`,children:t?.map(i=>(0,r.jsx)(q,{command:i},i.command))}),o&&(0,r.jsx)(n.List.EmptyView,{title:"No Response from Raycast for VSCode extension",icon:"\u26A0\uFE0F",actions:(0,r.jsxs)(n.ActionPanel,{children:[(0,r.jsx)(n.Action,{title:"Reload",icon:n.Icon.RotateClockwise,shortcut:{modifiers:["cmd"],key:"r"},onAction:s}),(0,r.jsx)(X,{})]})})]})}async function _(e){let t=await a.readFile(e,"utf-8"),o=JSON.parse(t);return await a.rm(e),o}function Q(){let[e,t]=(0,c.useState)(!0),[o,s]=(0,c.useState)(),[i,S]=(0,c.useState)(),[N,P]=(0,c.useState)(new Date),V=()=>{P(new Date)};return(0,c.useEffect)(()=>{let d=!1;async function A(){if(!d){t(!0),S(void 0);try{let y=await W();d||s(y)}catch(y){d||S(h(y))}finally{d||t(!1)}}}return A(),()=>{d=!0}},[N]),{commands:o,isLoading:e,error:i,refresh:V}}
