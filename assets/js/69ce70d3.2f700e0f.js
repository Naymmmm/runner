"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[966],{4129:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>c,contentTitle:()=>d,default:()=>u,frontMatter:()=>i,metadata:()=>s,toc:()=>l});const s=JSON.parse('{"id":"Modules","title":"Modules","description":"To create modules, you must create a ModuleScript that has a function OR method called Init, it is case sensitive. Runner cheks if","source":"@site/docs/Modules.md","sourceDirName":".","slug":"/Modules","permalink":"/Runner/docs/Modules","draft":false,"unlisted":false,"editUrl":"https://github.com/Naymmmm/runner/edit/master/docs/Modules.md","tags":[],"version":"current","sidebarPosition":3,"frontMatter":{"sidebar_position":3},"sidebar":"defaultSidebar","previous":{"title":"Setup","permalink":"/Runner/docs/Setup"}}');var r=t(4848),o=t(8453);const i={sidebar_position:3},d="Modules",c={},l=[{value:"Example Module",id:"example-module",level:2}];function a(e){const n={a:"a",code:"code",h1:"h1",h2:"h2",header:"header",p:"p",pre:"pre",strong:"strong",...(0,o.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.header,{children:(0,r.jsx)(n.h1,{id:"modules",children:"Modules"})}),"\n",(0,r.jsxs)(n.p,{children:["To create modules, you must create a ",(0,r.jsx)(n.code,{children:"ModuleScript"})," that has a ",(0,r.jsx)(n.strong,{children:"function OR method"})," called ",(0,r.jsx)(n.code,{children:"Init"}),", it is case sensitive. Runner cheks if\r\n",(0,r.jsx)(n.code,{children:"Init"})," exists in your module. If it does not then it warns you and cancels the operation."]}),"\n",(0,r.jsx)(n.h2,{id:"example-module",children:"Example Module"}),"\n",(0,r.jsx)(n.p,{children:"Here is an example module."}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-lua",children:'--!strict\r\n\r\nlocal MyModule = {}\r\n\r\nMyModule.Init = function(tbl: ActiveRunner)\r\n    print("foobar")\r\n    print(tbl.Version)\r\nend\r\n\r\nreturn MyModule\n'})}),"\n",(0,r.jsxs)(n.p,{children:["As you can see, when calling ",(0,r.jsx)(n.a,{href:"/api/Runner#new",children:(0,r.jsx)(n.code,{children:"Runner.new()"})}),", it passes the ",(0,r.jsx)(n.a,{href:"/api/Runner#ActiveRunner",children:(0,r.jsx)(n.code,{children:"ActiveRunner"})})," to ",(0,r.jsx)(n.code,{children:"Init"}),", this is for debugging and other stuff."]})]})}function u(e={}){const{wrapper:n}={...(0,o.R)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(a,{...e})}):a(e)}},8453:(e,n,t)=>{t.d(n,{R:()=>i,x:()=>d});var s=t(6540);const r={},o=s.createContext(r);function i(e){const n=s.useContext(o);return s.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function d(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:i(e.components),s.createElement(o.Provider,{value:n},e.children)}}}]);