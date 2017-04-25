UE.registerUI('dialog',function(editor,uiName){

    //创建dialog
    var dialog = new UE.ui.Dialog({
        //指定弹出层中页面的路径，这里只能支持页面,因为跟addCustomizeDialog.js相同目录，所以无需加路径
        iframeUrl:'/ueditor/faceChange.html',
        //需要指定当前的编辑器实例
        editor:editor,
        //指定dialog的名字
        name:uiName,
        //dialog的标题
        title:"变脸",

        //指定dialog的外围样式
        cssRules:"width:600px;height:450px;",

        //如果给出了buttons就代表dialog有确定和取消
        buttons:[
            {
                className:'edui-okbutton',
                label:'确定',
                onclick:function () {
                    var curr_ue,curr_ifame;
                    if($('#myMix li.active a').html()=='简体'){
                        curr_ue=ue_mix;
                    }
                    else {
                        curr_ue=ue_mix_fan;
                    }
                    $('iframe').each(function(){
                        if(this.id.indexOf('_iframe')>-1){curr_ifame=$(this).attr('id');}
                    });
                    var w=document.getElementById(curr_ifame).contentWindow;
                    if(!w.changeUrl||!w.originUrl){
                        alert('请先上传图片');
                        return;
                    }
                    curr_ue.execCommand('inserthtml','<em change_wsize="'+w.$('#look2').attr('wsize')+'" change_hsize="'+w.$('#look2').attr('hsize')+'"  origin_wsize="'+w.$('#look1').attr('wsize')+'" origin_hsize="'+w.$('#look1').attr('hsize')+'" contenteditable="false" fenge="'+(w.$('#fenge').is(':checked')?'1':'')+'" bottom="'+w.$('#margin_bom').val()+'" changeurl="'+w.changeUrl+'" originurl="'+w.originUrl+'"  class="changePiture_wrap" style="display:block;border:2px dashed #a0a0a0;width:280px;position:relative;"><em contenteditable="false" style="display:block;width:280px;height:140px;position:relative;"><em contenteditable="false" style="display:block;position:absolute;width: 50%;height:100%;left: 0;top: 0;overflow: hidden;"><em contenteditable="false" src="'+w.originUrl+'" style="display:block;width:200%;height: 100%;background: url('+w.originUrl+') no-repeat;background-size: 100% 100%;"></em></em><em contenteditable="false" style="display:block;position:absolute;width: 50%;height:100%;right: 0;top: 0;overflow: hidden;"><em contenteditable="false" src="'+w.changeUrl+'" style="display:block;width:200%;height: 100%;position: absolute;right:0;background: url('+w.changeUrl+') no-repeat;background-size: 100% 100%;"></em></em><a contenteditable="false" style="position: absolute;top: 5px;right: 5px;width: 20px;height: 20px;background: url('+YohoConfig.mainUrl+'/ueditor/dialogs/video/images/delete.png) no-repeat;cursor:pointer;background-size: 100% 100%;z-index: 10;" onclick="javascript:this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode);" title="删除"></a></em><em contenteditable="false" style="display:block;padding-bottom:'+w.$('#margin_bom').val()+'px;"></em>'+(w.$('#fenge').is(':checked')?'<hr contenteditable="false">':'')+'<em class="aa"></em></em><br/>');
                    dialog.close(true);
                }
            },
            {
                className:'edui-cancelbutton',
                label:'取消',
                onclick:function () {
                    dialog.close(false);
                }
            }
        ]});

    //参考addCustomizeButton.js
    var btn = new UE.ui.Button({
        name:'dialogbutton' + uiName,
        title:'变脸',
        //需要添加的额外样式，指定icon图标，这里默认使用一个重复的icon
        cssRules :'background-position: -726px -78px;',
        onclick:function () {
            //渲染dialog
            dialog.render();
            dialog.open();
        }
    });

    return btn;
}/*index 指定添加到工具栏上的那个位置，默认时追加到最后,editorId 指定这个UI是那个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮*/);