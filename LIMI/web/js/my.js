// JavaScript Document


function loadpage(){
    var zyName = document.getElementById('dropdown');
    var text = null;
    for(var i=0;i<zyName.options.length;i++){
             var op = zyName.options[i];
               if(op.selected){
                       text =op.text;
               }
    }
    if (text == null){
        //text = "\'No *.m selected!Please upload file first!\'";
        text = "No *.m file seleted, please upload dataset first!";
        var url = 'nmessage.jsp?message='+text;
        new Ajax.Updater('content', url, { method: 'get'});
    }else {
    var url = 'parse.jsp?fd='+text;
    new Ajax.Updater('content', url, { method: 'get'});
    }
}

function ConfirmInsertData_Click(){
    var url = 'insertdata.jsp'
    new Ajax.Updater('content', url, { method: 'get'});
}

function getSelect(selectName){
        var options = $(selectName).getElementsByTagName('option');
        options = $A(options);
        
        //var opt = options.find( function(employee){
        //    return (employee.value == $F(selectName));
        //});
        alert(opt.innerHTML);
        }
        
function redirectpage(url){
   self.location = url;
}

function loadpage2(n){
	switch(n)
	{
		case 1:
			new Ajax.Updater('left','submenu/news.html', { method: 'get' });
			new Ajax.Updater('content', 'submenu/news/work.html', { method: 'get' });	
			break;
		case 2:
			new Ajax.Updater('left','submenu/course.html', { method: 'get' });
			new Ajax.Updater('content', 'submenu/course/resource.html', { method: 'get' });	
			break;
		case 3:
			new Ajax.Updater('content', 'submenu/about/resume.html', { method: 'get' });	
			break;
	    case 4:
		    new Ajax.Updater('left','submenu/about.html', { method: 'get' });
		    new Ajax.Updater('content', 'submenu/about/resume.html', { method: 'get' });
			break;
	}		
		
}
function loadpage_init(n){
	//var num = randomNumber(2);
	
	//new Ajax.PeriodicalUpdater('leftbottom', 'photo/photo'+randomNumber(3)+'.html',	{ method: 'post', frequency: 8,  decay: 1 });   
	//new Ajax.Updater('leftbottom', 'photo/photo2.html', { method:'post',evalScripts:true });
	//new Ajax.Updater('leftbottom', 'photo/photo'+randomNumber(3)+'.html', { method:'get'});
	//loadpage2(n);
	//if(navigator.appName == "Netscape")
		 //alert("hello, you are using Firefox");
	setTimeout("new Ajax.PeriodicalUpdater('leftbottom', 'photo/photo'+0+'.html',	{ method: 'post', frequency: 18,  decay: 1 });", 0);
	setTimeout("new Ajax.PeriodicalUpdater('leftbottom', 'photo/photo'+1+'.html',	{ method: 'post', frequency: 18,  decay: 1 });", 6000);
	setTimeout("new Ajax.PeriodicalUpdater('leftbottom', 'photo/photo'+2+'.html',	{ method: 'post', frequency: 18,  decay: 1 });", 12000);
	loadpage2(1);

}

function randomNumber(limit){
  return Math.floor(Math.random()*limit);
}

