(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[55082,66406,91828],{30684:(e,r,a)=>{"use strict";a.d(r,{A:()=>_});var t=a(51895),o=a(91025),i=a(96353),n=a(14041),s=a(54357),l=a(90028),d=a(33818),c=a(44116),u=a(38827),v=a(75531),m=a(31085);let p=(0,v.A)((0,m.jsx)("path",{d:"M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"}),"Person");var g=a(8749),h=a(56375),f=e=>{var{classes:r,variant:a,colorDefault:t}=e;return(0,l.A)({root:["root",a,t&&"colorDefault"],img:["img"],fallback:["fallback"]},g.k,r)},b=(0,d.Ay)("div",{name:"MuiAvatar",slot:"Root",overridesResolver:(e,r)=>{var{ownerState:a}=e;return[r.root,r[a.variant],a.colorDefault&&r.colorDefault]}})((0,c.A)(e=>{var{theme:r}=e;return{position:"relative",display:"flex",alignItems:"center",justifyContent:"center",flexShrink:0,width:40,height:40,fontFamily:r.typography.fontFamily,fontSize:r.typography.pxToRem(20),lineHeight:1,borderRadius:"50%",overflow:"hidden",userSelect:"none",variants:[{props:{variant:"rounded"},style:{borderRadius:(r.vars||r).shape.borderRadius}},{props:{variant:"square"},style:{borderRadius:0}},{props:{colorDefault:!0},style:(0,t._)({color:(r.vars||r).palette.background.default},r.vars?{backgroundColor:r.vars.palette.Avatar.defaultBg}:(0,t._)({backgroundColor:r.palette.grey[400]},r.applyStyles("dark",{backgroundColor:r.palette.grey[600]})))}]}})),x=(0,d.Ay)("img",{name:"MuiAvatar",slot:"Img",overridesResolver:(e,r)=>r.img})({width:"100%",height:"100%",textAlign:"center",objectFit:"cover",color:"transparent",textIndent:1e4}),y=(0,d.Ay)(p,{name:"MuiAvatar",slot:"Fallback",overridesResolver:(e,r)=>r.fallback})({width:"75%",height:"75%"});let _=n.forwardRef(function(e,r){var a=(0,u.b)({props:e,name:"MuiAvatar"}),{alt:l,children:d,className:c,component:v="div",slots:p={},slotProps:g={},imgProps:_,sizes:A,src:k,srcSet:w,variant:T="circular"}=a,j=(0,i._)(a,["alt","children","className","component","slots","slotProps","imgProps","sizes","src","srcSet","variant"]),z=null,P=(0,o._)((0,t._)({},a),{component:v,variant:T}),R=function(e){var{crossOrigin:r,referrerPolicy:a,src:t,srcSet:o}=e,[i,s]=n.useState(!1);return n.useEffect(()=>{if(t||o){s(!1);var e=!0,i=new Image;return i.onload=()=>{e&&s("loaded")},i.onerror=()=>{e&&s("error")},i.crossOrigin=r,i.referrerPolicy=a,i.src=t,o&&(i.srcset=o),()=>{e=!1}}},[r,a,t,o]),i}((0,o._)((0,t._)({},_,"function"==typeof g.img?g.img(P):g.img),{src:k,srcSet:w})),I=k||w,B=I&&"error"!==R;P.colorDefault=!B,delete P.ownerState;var D=f(P),[N,M]=(0,h.A)("img",{className:D.img,elementType:x,externalForwardedProps:{slots:p,slotProps:{img:(0,t._)({},_,g.img)}},additionalProps:{alt:l,src:k,srcSet:w,sizes:A},ownerState:P});return z=B?(0,m.jsx)(N,(0,t._)({},M)):d||0===d?d:I&&l?l[0]:(0,m.jsx)(y,{ownerState:P,className:D.fallback}),(0,m.jsx)(b,(0,o._)((0,t._)({as:v,className:(0,s.A)(D.root,c),ref:r},j),{ownerState:P,children:z}))})},8749:(e,r,a)=>{"use strict";a.d(r,{A:()=>n,k:()=>i});var t=a(86310),o=a(18526);function i(e){return(0,o.Ay)("MuiAvatar",e)}let n=(0,t.A)("MuiAvatar",["root","colorDefault","circular","rounded","square","img","fallback"])},5674:(e,r,a)=>{"use strict";a.r(r),a.d(r,{Team:()=>n});var t=a(51895),o=a(31085),i=(0,a(75531).A)((0,o.jsx)("path",{d:"M11.333 4c-3.314 0-6 2.686-6 6s2.686 6 6 6c3.309 0 5.992-2.679 6-5.986v-.001c0-3.316-2.685-6.006-5.999-6.013h-.001zm0 9.333C9.492 13.333 8 11.841 8 10s1.492-3.333 3.333-3.333c1.841 0 3.333 1.492 3.333 3.333v.014-.001c-.008 1.835-1.497 3.32-3.333 3.32zM15.667 18.667H7c-2.427 0-4.333 2.547-4.333 5.827v3.507H20v-3.507c0-3.28-1.907-5.827-4.333-5.827zm1.666 6.666h-12v-.827c0-1.987.973-3.173 1.667-3.173h8.667c.693 0 1.667 1.2 1.667 3.173zM20.667 4c-.937.006-1.822.227-2.608.616l.035-.016c.534.662.984 1.424 1.312 2.247l.021.06c.36-.152.779-.24 1.219-.24h.022-.001C22.508 6.667 24 8.159 24 10s-1.492 3.333-3.333 3.333a3.2275 3.2275 0 01-1.261-.261l.021.008c-.35.887-.799 1.654-1.347 2.338l.014-.018c.748.362 1.628.573 2.556.573 3.306 0 5.987-2.68 5.987-5.987 0-3.3-2.671-5.977-5.969-5.987h-.001zM25 18.667h-4.213c.573.76 1.028 1.648 1.318 2.607l.016.06h2.827c.693 0 1.667 1.2 1.667 3.16v.84h-3.947v2.667h6.667v-3.493c0-3.28-1.907-5.84-4.333-5.84z"}),"Team.svg"),n=e=>(0,o.jsx)(i,(0,t._)({viewBox:"0 0 32 32"},e))},22296:(e,r,a)=>{"use strict";a.r(r),a.d(r,{User:()=>n});var t=a(51895),o=a(31085),i=(0,a(75531).A)((0,o.jsx)("path",{d:"M16 16.667c3.733 0 6.667-2.933 6.667-6.667S19.734 3.333 16 3.333 9.333 6.266 9.333 10s2.933 6.667 6.667 6.667zM16 6c2.267 0 4 1.733 4 4s-1.733 4-4 4-4-1.733-4-4 1.733-4 4-4zm6.667 13.333H9.334c-3.733 0-6.667 2.933-6.667 6.667v4h26.667v-4c0-3.733-2.933-6.667-6.667-6.667zm4 8H5.334V26c0-2.267 1.733-4 4-4h13.333c2.267 0 4 1.733 4 4v1.333z"}),"User.svg"),n=e=>(0,o.jsx)(i,(0,t._)({viewBox:"0 0 32 32"},e))},38468:(e,r,a)=>{"use strict";a.d(r,{d:()=>o,k:()=>i});var t=a(18652),o=e=>{var{urlParams:r={}}=e,a="/groups/".concat(r.groupId);return{url:a,formattedUrl:(0,t.format)({pathname:a})}},i=e=>{var{urlParams:r={}}=e,a="/groups/".concat(r.groupId,"/users");return{url:a,formattedUrl:(0,t.format)({pathname:a,query:{perPage:5e3}})}}},41812:(e,r,a)=>{"use strict";a.r(r),a.d(r,{ProfileDrawerIcon:()=>b});var t=a(31085),o=a(83894),i=a.n(o)()(()=>a.e(36269).then(a.bind(a,33920)).then(e=>({default:e.ProfileDrawer})),{loadableGenerated:{webpack:()=>[33920]},ssr:!1}),n=a(6061),s=a(89522),l=a(5073),d=a(64669),c=a(3229),u=a(74330),v=a(36),m=a(79487),p=a(98301),g=a(14041),h=(0,a(33497).n9)()(e=>{var{palette:r,tokens:{spacing:a}}=e;return{avatarButton:{color:r.text.secondary,"&:hover":{background:"none",color:r.text.primary},padding:0,borderTopLeftRadius:a.m,borderBottomLeftRadius:a.m},avatarTextTruncation:{maxWidth:"".concat(110,"px"),whiteSpace:"nowrap","& div":{overflow:"hidden",textOverflow:"ellipsis"}},drawerTextContent:{color:r.text.primary,display:"flex",flexDirection:"column",alignItems:"flex-start"},reverse:{color:"white"}}}),f=e=>{var{ariaLabel:r="",loadDrawer:a,toggleDrawer:o,showTextLabels:i=!1,shouldDisableDrawer:f=!1,reverse:b=!1}=e,x=(0,p.y)(),y=!!(null==x?void 0:x.organizationId)&&(null==x?void 0:x.maxUsers)!==1,{classes:_,cx:A,theme:k}=h(),{tokens:{fontSize:w}}=(0,n.A)(),T=(0,m.a)({breakpoint:"sm"}),[j,z]=(0,g.useState)(!0);return(0,g.useEffect)(()=>{z(!1)},[]),(0,t.jsx)(t.Fragment,{children:T?(0,t.jsx)(u.K,{"aria-label":r,classes:{root:_.avatarButton},color:"primary","data-automation":"siteHeader_profileButton",onClick:o,onMouseEnter:a,disabled:j||f,size:"large",clickTrack:"topNav.profile",children:(0,t.jsx)(v.H,{enablePersonalization:!0,user:x,showGoldBorder:null==x?void 0:x.isEnterpriseUser,isTeam:y})}):(0,t.jsxs)(c.$n,{disabled:j||f,"aria-label":r,onMouseEnter:a,onClick:o,clickTrack:"topNav.profile",children:[(0,t.jsx)(v.H,{enablePersonalization:!0,user:x,showGoldBorder:null==x?void 0:x.isEnterpriseUser,isTeam:y}),i&&(0,t.jsx)(s.A,{className:_.drawerTextContent,pl:3,children:x?(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(d.A,{classes:A({root:_.avatarTextTruncation}),variant:"caption",children:(0,t.jsx)(s.A,{fontSize:w.xs,color:b?k.palette.grey[50]:"inherit",fontWeight:"fontWeightBold","data-automation":"SiteHeader_ProfileButton",children:x.teamName||x.username})}),(0,t.jsx)(d.A,{classes:A({root:_.avatarTextTruncation}),variant:"caption",children:(0,t.jsx)(s.A,{color:b?k.palette.grey[50]:"inherit",fontSize:10,children:x.fullName})})]}):(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(l.A,{width:110,height:10}),(0,t.jsx)(l.A,{width:110,height:10})]})})]})})},b=e=>{var{ariaLabels:r={},showTextLabels:a,shouldDisableDrawer:o=!1,reverse:n=!1}=e,[s,l]=(0,g.useState)(!1),[d,c]=(0,g.useState)(!1),u=()=>l(!s);return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(f,{showTextLabels:a,ariaLabel:r.profileIconButton,loadDrawer:()=>c(!0),toggleDrawer:u,reverse:n,shouldDisableDrawer:o}),d&&(0,t.jsx)(i,{isActive:s,toggleDrawer:u})]})}},36:(e,r,a)=>{"use strict";a.d(r,{H:()=>_});var t=a(31085),o=a(5073),i=a(30684),n=a(3319),s=a(45182),l=a(10405),d={imageIllustration:s.$E,editorialImage:s.K2,editorialVideo:s.YS,imagePhoto:s.vo,imageGenerated:s.KB,imageVector:s.kc,video:s.G_,sfx:s.M9,music:s.on,template:s.QT},c=a(88677),u=a(48976),v=a(39067),m=a.n(v),p={user:m().shape({createTime:m().string,customerId:m().number,email:m().string,firstName:m().string,fullName:m().string,id:m().string,isDisabled:m().bool,language:m().string,lastName:m().string,locales:m().arrayOf(m().string),meta:m().shape({}),organizationId:m().number,roles:m().arrayOf(m().string),type:m().string,username:m().string})},g=a(5674),h=a(22296),f=a(74299),b=(0,a(33497).n9)()(e=>{var{tokens:{border:r,color:a}}=e;return{avatarRoot:{border:"solid ".concat(r.width.m," ").concat(a.gold)}}}),x=e=>{var{t:r,teamName:a}=e;return{avatarAlt:r("ent:teamname_avatar_image",{TEAM_NAME:a})}},y=e=>{var r;switch(e){case s.vo:case s.on:case s.M9:case s.QT:r="#D365E2";break;case s.G_:case s.kc:r="#EA6C06";break;case s.K2:case s.YS:r="#5465FF";break;case s.KB:r="#FF0084";break;case s.$E:r="#1A9FB7";break;default:r="#BDBDBD"}return r},_=e=>{var{enablePersonalization:r,user:a,showGoldBorder:s=!1,isTeam:v=!0}=e,{classes:m,cx:p}=b(),{t:_}=(0,f.Bd)(n.K0D),{avatarAlt:A}=x({t:_,teamName:null==a?void 0:a.teamName}),{isBrandSstk:k}=(0,u.P)(),w=function(){var e,r,a,t,o,i,{data:n}=(0,l.k)(),s=(null==n?void 0:null===(a=n.data)||void 0===a?void 0:null===(r=a.attributes)||void 0===r?void 0:null===(e=r.contentMix)||void 0===e?void 0:e.licensed)||{},c=(null==n?void 0:null===(i=n.data)||void 0===i?void 0:null===(o=i.attributes)||void 0===o?void 0:null===(t=o.contentMix)||void 0===t?void 0:t.browsed)||{};if(Object.entries(s).length>0&&(c=s),0===Object.entries(c).length)return null;var u=Object.entries(c);return u.sort((e,r)=>r[1]-e[1]),d[u[0][0]]}(),T="#BDBDBD";return k&&r&&(T=y(w)),(0,t.jsx)(t.Fragment,{children:a?(0,t.jsx)(i.A,{sx:{bgcolor:T},alt:a.avatarThumbnailUrl&&A,classes:{root:p({[m.avatarRoot]:s})},src:a.avatarThumbnailUrl,"data-automation":"user_Avatar",children:v?(0,t.jsx)(g.Team,{}):(0,t.jsx)(h.User,{})}):(0,t.jsx)(o.A,{variant:"circular",width:c.gR,height:c.gR})})};_.prototype={user:p.user.isRequired}},64380:(e,r,a)=>{"use strict";a.d(r,{N:()=>d});var t=a(38468),o=a(73072),i=a(74490),n=a(34559),s=a(42105),l=a(48917),d=e=>{var{data:r,mutate:a}=(0,l.Ay)(e?(0,t.d)({urlParams:{groupId:e}}).formattedUrl:null,e=>i.Vw.get(e)),d=(0,o.h)();return r&&!r.data&&d({actionName:"FREN-503 - useFetchOrganization meta error",customAttributes:{response:r,organizationId:e}}),{data:(null==r?void 0:r.data)?(0,s.T)((0,n.A)(r.data)):void 0,mutate:a}}},50717:(e,r,a)=>{"use strict";a.d(r,{M:()=>v});var t=a(51895),o=a(63870),i=a(93255),n=a(18570),s=a(65915),l=a(36908),d=a(74490),c=a(34559),u=a(48917),v=function(){var{queryParams:e}=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},{data:r}=(0,l.rA)(),a=(0,t._)({target:i.A_I,site_name:n.RJ,setting_type:i.A_I},e);return(0,u.Ay)((null==r?void 0:r.id)&&(null==r?void 0:r.organizationId)&&(0,o.h_)({queryParams:a}).formattedUrl,e=>d.Bn.get(e).then(e=>(0,c.A)(e.data)),{dedupingInterval:s.iW})}},98301:(e,r,a)=>{"use strict";a.d(r,{y:()=>h});var t=a(51895),o=a(91025),i=a(96353),n=a(18570),s=a(70196),l=a(79253),d=a.n(l),c=a(64380),u=a(50717),v=a(36908),m=a(82168),p=/http.*.com/,{publicRuntimeConfig:{assets:{avatarThumbsUrl:g}}}=d()(),h=()=>{var e,{data:r,isLoading:a}=(0,v.rA)(),{data:l,mutate:d,isLoading:h}=(0,u.M)({queryParams:{site_name:n.ln}}),{data:f,isLoading:b,mutate:x}=(0,c.N)(null==r?void 0:r.organizationId),{data:y,isLoading:_}=(0,m.R)(null==r?void 0:r.id);if(!(null==r?void 0:r.organizationId))return(0,o._)((0,t._)({},r),{userType:(null==r?void 0:r.id)?s.zv:void 0,isEnterpriseUser:!1,workspaces:y});if(a||b||_||h)return null;var A={},k={};if(r){var{roles:w}=r,T=(0,i._)(r,["roles"]);A=(0,t._)({},A,T)}if((null==r?void 0:r.id)&&(null==y?void 0:y.length)>=1){var j="".concat(null==r?void 0:r.id,"-").concat(null==r?void 0:r.organizationId);e=null==(k=y.find(e=>(null==e?void 0:e.id)===j))?void 0:k.type}if(f){var{id:z,displayName:P}=f,R=(0,i._)(f,["id","displayName"]);A=(0,o._)((0,t._)({},A,R),{teamName:P})}if(l){var{avatarOriginalUrl:I,avatarThumbnailUrl:B}=l;A=(0,o._)((0,t._)({},A),{avatarThumbnailUrl:null==B?void 0:B.replace(p,g),avatarOriginalUrl:I})}return(0,o._)((0,t._)({},A),{mutateOrgSettings:d,mutateTeamData:x,isEnterpriseUser:e===s.uX,userType:e,workspaces:y,currentUserWorkspace:k})}},82168:(e,r,a)=>{"use strict";a.d(r,{R:()=>d});var t=a(51895),o=a(63870),i=a(89272),n=a(74490),s=a(34559),l=a(48917),d=e=>{var r=(0,i.P)(),a={urlParams:{id:e},queryParams:(0,t._)({},r&&{accept_invite:1})};return(0,l.Ay)(e?(0,o.k0)(a).formattedUrl:null,e=>n.Bn.get(e).then(e=>{var{data:r}=e;if(r)return(0,s.A)(r)}))}},36999:(e,r,a)=>{"use strict";var t=a(36848);function o(){}function i(){}i.resetWarningCache=o,e.exports=function(){function e(e,r,a,o,i,n){if(n!==t){var s=Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");throw s.name="Invariant Violation",s}}function r(){return e}e.isRequired=e;var a={array:e,bigint:e,bool:e,func:e,number:e,object:e,string:e,symbol:e,any:e,arrayOf:r,element:e,elementType:e,instanceOf:r,node:e,objectOf:r,oneOf:r,oneOfType:r,shape:r,exact:r,checkPropTypes:i,resetWarningCache:o};return a.PropTypes=a,a}},39067:(e,r,a)=>{e.exports=a(36999)()},36848:e=>{"use strict";e.exports="SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED"}}]);
//# sourceMappingURL=ProfileDrawerIcon.4c868de06a1f4541.js.map