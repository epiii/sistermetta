var mnu ='grupmodul';
var dir ='models/m_'+mnu+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        viewTB();
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 

                        +'<input id="idformH" type="hidden">' 
                        
                        // grupm Modul
                        +'<label>Grup Modul</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="grup modul" required type="text" name="grupmodulTB" id="grupmodulTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // size
                        +'<label>Size</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text"  placeholder="size" name="sizeTB" id="sizeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#grupmodulS,#sizeS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        })
    }); 
// end of main function ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
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
                    viewTB($('#departemenS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
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
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#grupmodulTB').val(dt.grupmodul);
                            $('#sizeTB').val(dt.size);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,subaksi){ 
        var aksi ='aksi='+aksix+'&subaksi='+subaksi+'&starting='+page;
        var cari ='';
        var el,el2;

        if(subaksi!=''){ // multi paging 
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
            url:dir,
            type:"post",
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
                    viewTB($('#departemenS').val());
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
        $('#angkatanTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

// urutan tabel
    function urutFC (e) {
        // alert(id1);return false;
        // if(confirm('melanjutkan untuk merubah urutan ?')){
            $.ajax({
                url:dir,
                dataType:'json',
                type:'post',
                data:'aksi=urutan&replid1='+$(e).attr('replid1')+'&urutan2='+$(e).val(),
                beforeSend:function(){
                    $('#tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    var cont,clr;
                    // cont = '..Gagal Merubah urutan '+$('#'+mnu+'TD_'+$(e).attr('replid1')).html()+' ..';
                    if(dt.status!='sukses'){
                        cont = '..Gagal Merubah urutan ';
                        clr  ='red';
                    }else{
                        viewTB();
                        cont = '..Berhasil Merubah Urutan ';
                        clr  ='green';
                    }
                    // alert($(e).attr('urutan1'));return false;
                    // var idx = $(e).attr('urutan1');
                    // $('#TR_'+idx).addClass('success');
                    // $('#TR_2').html('<td>aseeeeeeeeem</td>');
                    // $('#TR_'+idx).html('<td>aseeeeeeeeem</td>');
                    notif(cont,clr);
                }
            });
        // }else{
        //     alert('gak sido');
        // }
    }
//end of urutan tabel


// combo grupmodul ---
    function cmbgrupmodul(typ,gm){
        var u = dir2;
        var d ='aksi=cmb'+mnu2+(gm!=''?'&replid='+gm:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.grupmodul, function(id,item){
                    out+='<option '+(gm!='' && gm==item.replid?'selected':'')+' value="'+item.replid+'">'+item.grupmodul+'</option>';
                });
            }
            if(typ=='filter'){
                $('#grupmodulS').html(out);
                viewTB();
            }else{
                $('#grupmodulTB').html('<option value="">-Pilih Grup Modul-</option>'+out);
            }
        });
    }
