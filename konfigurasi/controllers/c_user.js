var mnu  = 'user';
var mnu2 = 'level';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';

var aksiFR = levelFR = contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" >' 
                        +'<input name="idformlevelH" id="idformlevelH" type="hidden">' 
                        // nama
                        +'<label>Nama</label>'
                        +'<div class="input-control text">'
                            +'<input required placeholder="nama" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // username
                        +'<label>Username</label>'
                        +'<div class="input-control text">'
                            +'<input required placeholder="username" name="usernameTB" id="usernameTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // pass
                        +'<label>Password</label>'
                        +'<div class="input-control text">'
                            +'<input type="password" required placeholder="password" name="passwordTB" id="passwordTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // Level
                        +'<label>Level</label>'
                        +'<div id="levelDV"></div>'

                        // departemen
                        +'<label>Departemen</label>'
                        +'<div>'
                            +'<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input value="0" required type="radio" name="b_sumberTB" />'
                                    +'<span class="check"></span>'
                                    +'Beli'
                                +'</label>'
                            +'</div><br />'
                            +'<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input value="0" required type="radio" name="b_sumberTB" />'
                                    +'<span class="check"></span>'
                                    +'Beli'
                                +'</label>'
                            +'</div>'
                        +'</div>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        cmblevel('filter','');
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('level','');
        });

        //search action
        $('#namaS, #usernameS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });
        $('#levelS,#aktifS').on('change',function (){
            viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#'+mnu+'S').val('');
        });
    }); 
// end of save process ---

//save process ---
    function simpan(subaksi){
        var urlx ='&aksi=simpan&subaksi='+subaksi;
        if($('#idform'+subaksi+'H').val()!='') 
           urlx += '&id_'+mnu+'='+$('#idform'+subaksi+'H').val();

        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('#'+subaksi+'FR').serialize()+urlx,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    kosongkan();
                    if(subaksi=='level'){ //level 
                        $.Dialog.close();
                        viewTB($('#departemenS').val());
                    }else{ // levelaksi
                        viewFR('levelaksi',$('#idform2H').val());
                    }
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---
    
    function levelAksiVW (level) {
        $.ajax({
            url:dir,
            data:'aksi=tampil&subaksi=levelaksi&id_level='+level,
            type:'post',
            dataType:'json',
            success:function(dt){
                // alert(dt);return false;
                console.log(dt);
                if(dt.status!='sukses'){
                    notif(dt.status,'red');
                }else{
                    alert(level);
                    $('#idformlevelaksiH').val(dt.data.level);
                    $('#levelTD').html(': '+dt.data.keterangan+'('+dt.data.level+')');
                    // return false;
                    // data detail barang
                    // var tbl='';
                    // $.each(dt.data.barangArr,function(id,item){
                    //     var btn;
                    //     tbl+='<tr>'
                    //         +'<td><input '+(item.status==3||item.status==4?'disabled':'')+' type="checkbox" dp="'+item.iddpeminjaman+'" brg="'+item.idbarang+'" /></td>'
                    //         +'<td>'+item.kode+'</td>'
                    //         +'<td>'+item.barang+'</td>'
                    //         +'<td>'+item.tgl_kembali2+'</td>'
                    //         +'<td>'
                    //             +'<button style="background-color:'+item.color+'" '
                    //                 +(item.status==3||item.status==4?'onclick="alert(\'sudah dikembalikan\')"':'onclick="kembalikanFC('+item.iddpeminjaman+','+item.idbarang+')"')+'>'
                    //                 +'<i style="color:white;" class="icon-undo"></i>'
                    //             +'</button>'
                    //         +'</td>'
                    //     +'</tr>';
                    // });$('#barangTBL2').html(tbl);
                }
            }
        });
        // contentFR=contentDetail;
    }


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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// level
    function levelFC(lv){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function  (dt) {
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.level.length==0) out+='level masih kosong (hubungi admin konfigurasi)';
                else{
                    $.each(dt.level,function(id,item){
                        out+='<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input '+(typeof lv!=undefined && item.id_level==lv?'checked':'')+' value="'+item.id_level+'" required type="radio" name="b_sumberTB" />'
                                    +'<span class="check"></span>'
                                    +item.keterangan
                                +'</label>'
                            +'</div><br />';
                    });
                }$('#levelDV').html(out);
            }
        });
    }     
// form ---
    function viewFR(menu,idlevel){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '50%',
            padding: 10,
            onShow: function(){
                if(idlevel!=''){
                    var u = dir;
                    var d ='aksi=ambiledit&id_level='+idlevel;
                    ajax(u,d).done(function  (dt) {
                        if(dt.status!='sukses'){
                            notif(dt.status,'red');
                        }else{
                            $('#idformlevelH').val(idlevel);
                            $('#levelTB').val(dt.level);
                            $('#keteranganTB').val(dt.keterangan);
                            levelFC(dt.id_level);
                        }
                    });
                }else{
                    levelFC();
                }
                titlex='<span class="icon-plus-2"></span> Tambah ';
                $.Dialog.title(titlex+' '+mnu);
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
                $(el2).html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
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
            data:'aksi=hapus&id_'+mnu+'='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                    viewTB();
                }notif(cont,clr);
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
        $('#'+mnu+'TB').val('');
        $('#tglmulaiTB').val('');
        $('#saldoTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
    	var th  = $('#'+mnu+'TD_'+id).html();
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&id_'+mnu+'='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                    viewTB();
                }
                notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---


    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }
    // urutan tabel
    function urutFC (e) {
        var u = dir;
        var d ='aksi=urutan&replid1='+$(e).attr('replid1')+'&urutan2='+$(e).val();
        ajax(u,d).done(function(dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Merubah urutan ';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Merubah Urutan ';
                clr  ='green';
            }notif(cont,clr);
        });
    }

// combo level---
    function cmblevel(typ,lv){
        var u = dir2;
        var d ='aksi=cmb'+mnu2+(lv!=''?'&id_'+mnu2+'='+lv:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.level, function(id,item){
                    out+='<option '+(lv!='' && lv==item.id_level?'selected':'')+' value="'+item.id_level+'">'+item.keterangan+' ['+item.level+']</option>';
                });
            }
            if(typ=='filter'){
                $('#levelS').html('<option value="">-SEMUA-</option>'+out);
                viewTB();
            }else{
                $('#levelTB').html('<option value="">-Pilih level-</option>'+out);
            }
        });
    }
