﻿// 彩票开奖配置
exports.cp=[
	
	{
		title:'重庆时时彩',
		source:'作者',
		name:'cqssc',
		enable:true,
		timer:'cqssc', 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/ssccq/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFrom360CP(str,1);
			}catch(err){
				//throw('重庆时时彩解析数据不正确');
			}
		}
	},////////////

	{
		title:'江西时时彩',
		source:'作者',
		name:'jxssc',
		enable:true,
		timer:'jxssc',
 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/sscjx/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFrom360CP(str,3);
			}catch(err){
				throw('江西时时彩解析数据不正确');
			}
		}
	},////////////

	{
		title:'江苏快3',
		source:'360彩票',
		name:'jsk3',
		enable:true,
		timer:'jsk3',
 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/k3js/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFrom360CPK3(str,25);
			}catch(err){
				throw('江西时时彩解析数据不正确');
			}
		}
	},

	//{{{
	{
		title:'新疆时时彩',
		source:'作者',
		name:'xjssc',
		enable:true,
		timer:'xjssc',

		option:{
			host:"www.xjflcp.com",
			timeout:50000,
			path: '/ssc/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		
		parse:function(str){
			return getFromXJFLCPWeb(str,12);
		}
	},
	//}}}
	
		{
		title:'重庆快乐十分',
		source:'彩乐乐',
		name:'klsf',
		enable:true,
		timer:'klsf',

		option:{
			host:"www.cailele.com",
			timeout:50000,
			path: '/static/cqklsf/newlyopenlist.xml',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0)"
			}
		},
		
		parse:function(str){
			try{
				//return getFromCaileWeb(str,21);
				str=str.substr(0,200);
				var reg=/<row expect="(\d+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/; 
				//<row expect="2013072213" opencode="07,16,03,17,01,05,13,12" opentime="2013-07-22 02:03:20" />
				var m;
	
				if(m=str.match(reg)){
					return {
						type:18,
						time:m[3],
						number:m[1].replace(/^(\d{8})(\d{2})$/, '$1-0$2'),
						data:m[2]
					};
				}					
			}catch(err){
				//throw('重庆快乐十分解析数据不正确');
			}
		}
	},
	
	//{{{
	{
		title:'福彩3D',
		source:'作者',
		name:'fc3d',
		enable:true,
		timer:'fc3d',

		option:{
			host:"www.500wan.com",
			timeout:50000,
			path: '/static/info/kaijiang/xml/sd/list10.xml',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		
		parse:function(str){
			try{
				str=str.substr(0,300);
				var m;
				var reg=/<row expect="(\d+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)" trycode="[\d\,]*?" tryinfo="" \/>/;
                                        
				if(m=str.match(reg)){
					return {
						type:9,
						time:m[3],
						number:m[1],
						data:m[2]
					};
				}
			}catch(err){
				throw('福彩3D解析数据不正确');
			}
		}
	},
	
	{
		title:'排列3',
		source:'作者',
		name:'pai3',
		enable:true,
		timer:'pai3',

		option:{
			host:"www.500wan.com",
			timeout:50000,
			path: '/static/info/kaijiang/xml/pls/list10.xml',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		
		parse:function(str){
			try{
				str=str.substr(0,300);
				var m;	 
				var reg=/<row expect="(\d+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/;
				if(m=str.match(reg)){
					return {
						type:10,
						time:m[3],
						number:20+m[1],
						data:m[2]
					};
				}
			}catch(err){
				throw('排3解析数据不正确');
			}
		}
	},
	//}}}
	
	{
		title:'重庆11选5',
		source:'作者',
		name:'cq11x5',
		enable:true,
		timer:'cq11x5',

		option:{
			host:"www.cailele.com",
			timeout:50000,
			path: '/lottery/cq11x5/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFromCaileleWeb_1(str,15);
			}catch(err){
				//throw('重庆11选5解析数据不正确');
			}
		}
	},////////////
	
	{
		title:'广东11选5',
		source:'作者',
		name:'gd11x5',
		enable:true,
		timer:'gd11x5',

 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/gd11/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFrom360CP(str,6);
			}catch(err){
				//throw('广东11选5解析数据不正确');
			}
		}
	},////

	{
		title:'江西11选5',
		source:'作者',
		name:'jx11x5',
		enable:true,
		timer:'jx11x5',
 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/dlcjx/',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
			}
		},
		parse:function(str){
			try{
				return getFrom360CP(str,16);
			}catch(err){
				//throw('江西多乐彩解析数据不正确');
			}
		}
	},////////////

	//}}}
	{
		title:'山东11选5',
		source:'作者',
		name:'sd11x5',
		enable:true,
		timer:'sd11x5', 

		option:{
			host:"cp.360.cn",
			timeout:50000,
			path: '/yun11/',
			headers:{
				"User-Agent": "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; Sleipnir/2.9.8) "
			}
		},
		parse:function(str){
			try{
				return getFrom360sd11x5(str,7);
			}catch(err){
				//throw('山东11选5解析数据不正确');
			}
		}
	},////////
	
	//{{{
	{
		title:'北京PK10',
		source:'万金娱乐平台',
		name:'bjpk10',
		enable:true,
		timer:'bjpk10',

		option:{

			host:"www.bwlc.net",
			timeout:50000,
			path: '/bulletin/trax.html',
			headers:{
				"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/29.0.1271.64 Safari/537.11"
			}
		},
		
		parse:function(str){
			try{
				return getFromPK10(str,20);
			}catch(err){
				throw('解析数据不正确');
			}
		}
	},//(((
	
	//{{{
	{
		title:'五分彩',
		source:'qtllc',
		name:'qtllc',
		enable:true,
		timer:'qtllc',

		option:{
			host:"www.i168data.com",
			timeout:50000,
			path: '/index.php?tnt=5fc',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) "
			}
		},
		parse:function(str){
			try{
				str=str.substr(0,200);
				
				var reg=/<row expect="([\d\-]+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/; 
				//<row expect="20130720017" opencode="4,9,1,2,9" opentime="2013-07-20 01:25:30"/>
				
				var m;
				if(m=str.match(reg)){
					return {
						type:14,
						time:m[3],
						number:m[1],
						data:m[2]
					};
				}					
				
			}catch(err){
				throw('五分彩解析数据不正确');
			}
		}
	},

	{
		title:'两分彩',
		source:'lfc',
		name:'lfc',
		enable:true,
		timer:'lfc',

		option:{
			host:"www.i168data.com",
			timeout:50000,
			path: '/index.php?tnt=2fc',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) "
			}
		},
		parse:function(str){
			try{
				str=str.substr(0,200);
				
				var reg=/<row expect="([\d\-]+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/; 
				//<row expect="20130720017" opencode="4,9,1,2,9" opentime="2013-07-20 01:25:30"/>
				
				var m;
				if(m=str.match(reg)){
					return {
						type:26,
						time:m[3],
						number:m[1],
						data:m[2]
					};
				}					
				
			}catch(err){
				throw('两分彩解析数据不正确');
			}
		}
	},

	{
		title:'分分彩',
		source:'ffc',
		name:'ffc',
		enable:true,
		timer:'ffc',
		option:{
			host:"www.i168data.com",
			timeout:50000,
			path: '/index.php?tnt=ffc',
			headers:{
				"User-Agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) "
			}
		},
		parse:function(str){
			try{
				str=str.substr(0,200);	
				var reg=/<row expect="([\d\-]+?)" opencode="([\d\,]+?)" opentime="([\d\:\- ]+?)"/; 
				var m;
				if(m=str.match(reg)){
					return {
						type:5,
						time:m[3],
						number:m[1],
						data:m[2]
					};
				}					
			}catch(err){
				throw('分分彩解析数据不正确');
			}
		}
	}
];


exports.errorSleepTime=5;


exports.restartTime=0;

exports.submit={
	host:'localhost',
	path:'/admin778899.php/dataSource/kj'
}

exports.dbinfo={
	host:'localhost',
	user:'root',
	password:'root',
	database:'chuncai'

}

global.log=function(log){
	var date=new Date();
	console.log('['+date.toDateString() +' '+ date.toLocaleTimeString()+'] '+log)
}

function getFromXJFLCPWeb(str, type){
	str=str.substr(str.indexOf('<td><a href="javascript:detatilssc'), 300).replace(/[\r\n]+/g,'');
         
	var reg=/(\d{10}).+(\d{2}\:\d{2}).+<p>([\d ]{9})<\/p>/,
	match=str.match(reg);
	
	if(!match) throw new Error('数据不正确');
	//console.log('期号：%s，开奖时间：%s，开奖数据：%s', match[1], match[2], match[3]);
	
	try{
		var data={
			type:type,
			time:match[1].replace(/^(\d{4})(\d{2})(\d{2})\d{2}/, '$1-$2-$3 ')+match[2],
			number:match[1].replace(/^(\d{8})(\d{2})$/, '$1-$2'),
			data:match[3].split(' ').join(',')
		};
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
}


function getFromCaileleWeb(str, type, slen){
	if(!slen) slen=380;
	str=str.substr(str.indexOf('<tr bgcolor="#FFFAF3">'),slen);
	//console.log(str);
	var reg=/<td.*?>(\d+)<\/td>[\s\S]*?<td.*?>([\d\- \:]+)<\/td>[\s\S]*?<td.*?>((?:[\s\S]*?<div class="ball_yellow">\d+<\/div>){3,5})\s*<\/td>/,
	match=str.match(reg);
	if(match.length>1){
		
		if(match[1].length==7) match[1]='2015'+match[1].replace(/(\d{4})(\d{3})/,'$1-$2');
		if(match[1].length==8){
			if(parseInt(type)!=11){
				match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-0$2');
			}else{match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-$2');}
		}
		if(match[1].length==9) match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-$2');
		if(match[1].length==10) match[1]=match[1].replace(/(\d{8})(\d{2})/,'$1-0$2');
		var mynumber=match[1].replace(/(\d{8})(\d{3})/,'$1-$2');
	try{
		var data={
			type:type,
			time:match[2],
			number:mynumber
		}
		
		reg=/<div.*>(\d+)<\/div>/g;
		data.data=match[3].match(reg).map(function(v){
			var reg=/<div.*>(\d+)<\/div>/;
			return v.match(reg)[1];
		}).join(',');
		
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
   }
}

function getFrom360CP(str, type){

	str=str.substr(str.indexOf('<em class="red" id="open_issue">'),380);
	//console.log(str);
	var reg=/[\s\S]*?(\d+)<\/em>[\s\S].*?<ul id="open_code_list">((?:[\s\S]*?<li class=".*?">\d+<\/li>){3,5})[\s\S]*?<\/ul>/,
	match=str.match(reg);
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	//console.log(match);
	if(match.length>1){
		if(match[1].length==7) match[1]=year+match[1].replace(/(\d{8})(\d{3})/,'$1-$2');
		if(match[1].length==6) match[1]=year+match[1].replace(/(\d{4})(\d{2})/,'$1-0$2');
		if(match[1].length==9) match[1]='20'+match[1].replace(/(\d{6})(\d{2})/,'$1-$2');
		if(match[1].length==10) match[1]=match[1].replace(/(\d{8})(\d{2})/,'$1-0$2');
		var mynumber=match[1].replace(/(\d{8})(\d{3})/,'$1-$2');
		
		try{
			var data={
				type:type,
				time:mytime,
				number:mynumber
			}
			
			reg=/<li class=".*?">(\d+)<\/li>/g;
			data.data=match[2].match(reg).map(function(v){
				var reg=/<li class=".*?">(\d+)<\/li>/;
				return v.match(reg)[1];
			}).join(',');
			
			//console.log(data);
			return data;
		}catch(err){
			throw('解析数据失败');
		}
	}
}

function getFrom360CPK3(str, type){

	str=str.substr(str.indexOf('<em class="red" id="open_issue">'),380);
	//console.log(str);
	var reg=/[\s\S]*?(\d+)<\/em>[\s\S].*?<ul id="open_code_list">((?:[\s\S]*?<li class=".*?">\d+<\/li>){3,5})[\s\S]*?<\/ul>/,
	match=str.match(reg);
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString();
	//console.log(match);
	match[1]=match[1].replace(/(\d{4})(\d{2})/,'$1$2');
		
		try{
			var data={
				type:type,
				time:mytime,
				number:match[1]
			}
			
			reg=/<li class=".*?">(\d+)<\/li>/g;
			data.data=match[2].match(reg).map(function(v){
				var reg=/<li class=".*?">(\d+)<\/li>/;
				return v.match(reg)[1];
			}).join(',');
			
			//console.log(data);
			return data;
		}catch(err){
			throw('解析数据失败');
		}
}

function getFromPK10(str, type){

	str=str.substr(str.indexOf('<div class="lott_cont">'),350).replace(/[\r\n]+/g,'');
    //console.log(str);
	var reg=/<tr class=".*?">[\s\S]*?<td>(\d+)<\/td>[\s\S]*?<td>(.*)<\/td>[\s\S]*?<td>([\d\:\- ]+?)<\/td>[\s\S]*?<\/tr>/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	//console.log(match);
	try{
		var data={
			type:type,
			time:match[3],
			number:match[1],
			data:match[2]
		};
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
	
}

function getFromK8(str, type){

	str=str.substr(str.indexOf('<div class="lott_cont">'),450).replace(/[\r\n]+/g,'');
    //console.log(str);
	var reg=/<tr class=".*?">[\s\S]*?<td>(\d+)<\/td>[\s\S]*?<td>(.*)<\/td>[\s\S]*?<td>(.*)<\/td>[\s\S]*?<td>([\d\:\- ]+?)<\/td>[\s\S]*?<\/tr>/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	//console.log(match);
	try{
		var data={
			type:type,
			time:match[4],
			number:match[1],
			data:match[2]+'|'+match[3]
		};
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
	
}


function getFromCJCPWeb(str, type){

	//console.log(str);
	str=str.substr(str.indexOf('<table class="qgkj_table">'),1200);
	
	//console.log(str);
	
	var reg=/<tr>[\s\S]*?<td class=".*">(\d+).*?<\/td>[\s\S]*?<td class=".*">([\d\- \:]+)<\/td>[\s\S]*?<td class=".*">((?:[\s\S]*?<input type="button" value="\d+" class=".*?" \/>){3,5})[\s\S]*?<\/td>/,
	match=str.match(reg);
	
	//console.log(match);
	
	if(!match) throw new Error('数据不正确');
	try{
		var data={
			type:type,
			time:match[2],
			number:match[1].replace(/(\d{8})(\d{2})/,'$1-0$2')
		}
		
		reg=/<input type="button" value="(\d+)" class=".*?" \/>/g;
		data.data=match[3].match(reg).map(function(v){
			var reg=/<input type="button" value="(\d+)" class=".*?" \/>/;
			return v.match(reg)[1];
		}).join(',');
		
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
	
}

function getFromCaileleWeb_1(str, type){
	str=str.substr(str.indexOf('<tbody id="openPanel">'), 120).replace(/[\r\n]+/g,'');
         
	var reg=/<tr.*?>[\s\S]*?<td.*?>(\d+)<\/td>[\s\S]*?<td.*?>([\d\:\- ]+?)<\/td>[\s\S]*?<td.*?>([\d\,]+?)<\/td>[\s\S]*?<\/tr>/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	//console.log(match);
	var number,_number,number2;
	var d = new Date();
	var y = d.getFullYear();
	if(match[1].length==9 || match[1].length==8){number='20'+match[1];}else if(match[1].length==7){number='2015'+match[1];}else{number=match[1];}
	_number=number;
	if(number.length==11){number2=number.replace(/^(\d{8})(\d{3})$/, '$1-$2');}else{number2=number.replace(/^(\d{8})(\d{2})$/, '$1-0$2');_number=number.replace(/^(\d{8})(\d{2})$/, '$10$2');}
	try{
		var data={
			type:type,
			time:_number.replace(/^(\d{4})(\d{2})(\d{2})\d{3}/, '$1-$2-$3 ')+match[2],
			number:number2,
			data:match[3]
		};
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
}

function getFrom360sd11x5(str, type){

	str=str.substr(str.indexOf('<em class="red" id="open_issue">'),380);
	//console.log(str);
	var reg=/[\s\S]*?(\d+)<\/em>[\s\S].*?<ul id="open_code_list">((?:[\s\S]*?<li class=".*?">\d+<\/li>){3,5})[\s\S]*?<\/ul>/,
	match=str.match(reg);
	var myDate = new Date();
	var year = myDate.getFullYear();       //年   
    var month = myDate.getMonth() + 1;     //月   
    var day = myDate.getDate();            //日
	if(month < 10) month="0"+month;
	if(day < 10) day="0"+day;
	var mytime=year + "-" + month + "-" + day + " " +myDate.toLocaleTimeString(); 
	//console.log(mytime);
	//console.log(match);
	
	if(!match) throw new Error('数据不正确');
	try{
		var data={
			type:type,
			time:mytime,
			number:year+match[1].replace(/(\d{4})(\d{2})/,'$1-0$2')
		}
		
		reg=/<li class=".*?">(\d+)<\/li>/g;
		data.data=match[2].match(reg).map(function(v){
			var reg=/<li class=".*?">(\d+)<\/li>/;
			return v.match(reg)[1];
		}).join(',');
		
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
}

function getFromCaileleWeb_2(str, type){

	str=str.substr(str.indexOf('<tbody id="openPanel">'), 500).replace(/[\r\n]+/g,'');
	//console.log(str);
	var reg=/<tr>[\s\S]*?<td>(\d+)<\/td>[\s\S]*?<td>([\d\:\- ]+?)<\/td>[\s\S]*?<td>([\d\,]+?)<\/td>[\s\S]*?<\/tr>/,
	match=str.match(reg);
	if(!match) throw new Error('数据不正确');
	//console.log(match);
	var number,_number,number2;
	var d = new Date();
	var y = d.getFullYear();
	if(match[1].length==9 || match[1].length==8){number='20'+match[1];}else if(match[1].length==7){number='2015'+match[1];}else{number=match[1];}
	_number=number;
	if(number.length==11){number2=number.replace(/^(\d{8})(\d{3})$/, '$1-$2');}else{number2=number.replace(/^(\d{8})(\d{2})$/, '$1-0$2');_number=number.replace(/^(\d{8})(\d{2})$/, '$10$2');}
	try{
		var data={
			type:type,
			time:_number.replace(/^(\d{4})(\d{2})(\d{2})\d{3}/, '$1-$2-$3 ')+match[2],
			number:number2,
			data:match[3]
		};
		//console.log(data);
		return data;
	}catch(err){
		throw('解析数据失败');
	}
}