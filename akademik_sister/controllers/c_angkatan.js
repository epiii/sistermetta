var mnu  ='angkatan';
var mnu2 ='departemen';
var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        // departemen
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="departemenH" id="departemenH" class="span2">'
                            +'<input disabled="disabled" name="departemenTB" id="departemenTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // angkatan
                        +'<label>angkatan</label>'
                        +'<div class="input-control text">'
                            +'<input name="angkatanH" id="angkatanH" type="hidden">' 
                            +'<input required type="number" min="1945" max="9999" name="angkatanTB" id="angkatanTB">'
                        +'</div>'
                        // keterangan
                        +'<label>keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="keteranganTB" id="keteranganTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //combo departemen
        cmbdepartemen('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#angkatanS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB($('#departemenS').val());
        });$('#keteranganS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB($('#departemenS').val());
        });$('#departemenS').on('change',function(){
            viewTB($(this).val());
        })

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#angkatanS').val('');
            $('#keteranganS').val('');
        });

    }); 
// end of main function ---

// combo departemen ---
    function cmbdepartemen(typ,dep){
        $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen'+(dep!=''?'&replid='+dep:''),
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#departemenS').html(out);
                    viewTB();
                }else // form
                    $('#departemenTB').html(dt.departemen[0].nama);
            }
        });
    }
//end of combo departemen ---

function ajax (u,d) {
    return $.ajax({
        url:u,
        data:d,
        dataType:'json',
        type:'post'
    });
}

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        var u = dir;
        var d = $('form').serialize()+urlx;
        ajax(u,d).done(function(dt){
            if(dt.status=='gagal'){
                cont = 'Gagal menyimpan data';
                clr  = 'red';
            }else if(dt.status=='unavailable'){
                cont = 'angkatan sudah terdaftar';
                clr  = 'red';
            }else{
                $.Dialog.close();
                kosongkan();
                viewTB();
                cont = 'Berhasil menyimpan data';
                clr  = 'green';
            }notif(cont,clr);
        });
    }
//end of save process ---

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
        var cari ='';
        var el,el2;

        // alert(subaksi);
        // return false;
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
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmbdepartemen&replid='+$('#departemenS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#departemenH').val($('#departemenS').val());
                            $('#departemenTB').val(dt.departemen[0].nama);
                        }
                    });
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#departemenH').val($('#departemenS').val());
                            $('#departemenTB').val(dt.nama);
                            $('#angkatanH').val(dt.angkatan);
                            $('#angkatanTB').val(dt.angkatan);
                            $('#keteranganTB').val(dt.keterangan);
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
        $('#angkatanTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- //