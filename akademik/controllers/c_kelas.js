var mnu       = 'kelas';
var mnu4      = 'tingkat';
var mnu5      = 'subtingkat';

var dir       = 'models/m_'+mnu+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<div style="overflow:scroll;height:550px;"  class="">'
                        +'<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        // tingkat
                        +'<label>Tingkat</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbsubtingkat(\'form\',$(this).val(),\'\');" required id="tingkatTB"  name="tingkatTB"></select>'
                        +'</div>'

                        // subtingkat
                        +'<label>Sub Tingkat</label>'
                        +'<div class="input-control select">'
                            +'<select required id="subtingkatTB"  name="subtingkatTB"><option value="">-Pilih Tingkat Dulu-</option></select>'
                        +'</div>'

                        // kelas
                        +'<label>Kelas</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kelas" required type="text" name="kelasTB" id="kelasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // keterngan
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
                    +'</div>'

        // combo departemen
        cmbtingkat('filter','');
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

    /*filtering*/
        // combo
        $('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val());
        });$('#tahunajaranS').on('change',function (){
            cmbtingkat('filter',$(this).val());
        });$('#tingkatS').on('change',function (){
            cmbsubtingkat('filter',$(this).val());
        });$('#subtingkatS').on('change',function (){
            viewTB(); 
        })
        //textbox
        $('#kelasS,#keteranganS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });

        // button actions 
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kelasS').val('');
            $('#waliS').val('');
        });
    }); 
// end of save process ---

// combo tingkat ---
    function cmbtingkat(typ,ting){
        var u = dir4;
        var d ='aksi=cmbtingkat';
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tingkat, function(id,item){
                    out+='<option '+(ting!='' && ting==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+'</option>';
                });
            }
            if(typ=='filter'){
                $('#tingkatS').html('<option value="">-SEMUA-</option>'+out);
                cmbsubtingkat('filter','','');
            }else{
                $('#tingkatTB').html('<option value="">-Pilih Tingkat-</option>'+out);
            }
        });
    }
//end of combo tingkat ---

// combo subtingkat ---
    function cmbsubtingkat(typ,ting,sub){
        if(typ=='filter' && ting==''){
            $('#subtingkatS').html('<option value="">-SEMUA-</option>');
            viewTB();
        }else{
            var u=dir5;
            var d= 'aksi=cmbsubtingkat'+(ting!=''?'&tingkat='+ting:'replid='+sub);
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option '+(sub!='' && sub==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.subtingkat+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#subtingkatS').html('<option value="">-SEMUA-</option>'+out);
                    viewTB();
                }else{
                    $('#subtingkatTB').html('<option value="">-Pilih Sub Tingkat-</option>'+out);
                }
            });
        }
    }
//end of combo tahunajaran ---


//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    kosongkan();
                    viewTB();
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
        if(typeof subaksi!=='undefined'){
            aksi+='&subaksi='+subaksi;
        }
        var cari ='';
        var el,el2;

        if(typeof subaksi!=='undefined'){ // multi paging
            el  = '.'+subaksi+'_cari';
            el2 = '#'+subaksi+'_tbody';
        }else{ // single paging
            el  = '.cari';
            el2 = '#tbody';
        }

        $(el).each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table

// form ---
    function viewFR(id){
        var thn = $('#tahunajaranS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                $.Dialog.content(contentFR);
                $('#tingkatTB').focus();
                var titlex;
                if (id!=''){ // edit
                    ajax(dir,'aksi=ambiledit&replid='+id).done(function  (dt) {
                        $('#idformH').val(id);
                        $('#kelasTB').val(dt.datax.kelas);
                        $('#keteranganTB').val(dt.datax.keterangan);
                        cmbtingkat('form',dt.datax.tingkat);
                        cmbsubtingkat('form',dt.datax.tingkat,dt.datax.subtingkat);
                    });
                }else{
                    cmbtingkat('form','');
                }
                $.Dialog.title(titlex+' '+mnu);
            }
        });
    }
// end of form ---

  // autosuggest
    function autoSuggest(jenis,el,subaksi,tingkat){
        var urlx= '?aksi=autocomp&subaksi='+subaksi+(jenis!=''?'&jenis='+jenis:'');
        var col = [{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'10',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'90',
                'label':'Rekening'
        }];
        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'750px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');
                var arr = rekArrFC();
                var str = arr.toString();

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
            
                                var str = rekArr.toString();
                                console.log('terpilih in auto 2 =>'+str+' arr=> '+rekArr);
                                if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                            }
                        }
                    });
                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                            if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                        }
                    });
                return false;
            }
        });
    }


//paging ---
     function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
         var cari = '&departemenS='+$('#departemenS').val()
                    +'&tahunajaranS='+$('#tahunajaranS').val()
                    +'&tingkatS='+$('#tingkatS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }   
//end of paging ---
    
//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB();
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---
    
// notifikasi
function notif(cont,clr) {
    var not = $.Notify({
        caption : "<b>Notifikasi</b>",
        content : cont,
        timeout : 3000,
        style :{
            background: clr,
            color:'white'
        },
    });
}
// end of notifikasi

//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#tingkatTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }
