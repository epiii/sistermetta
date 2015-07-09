var mnu  = 'tingkat';
var mnu2 = 'departemen';
var mnu3 = 'tahunajaran';
var mnu4 = 'kriteriaCalonSiswa';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = '../psb/models/m_'+mnu4+'.php';

var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // +'<label>Departemen</label>'
                        // +'<div styclass="input-control text">'
                            +'<input type="hidden" name="departemenH" id="departemenH">'
                            // +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                            // +'<button class="btn-clear"></button>'
                        // +'</div>'
                        
                        // tahun ajaran 
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="tahunajaranH" id="tahunajaranH">'
                            +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // kriteria
                        +'<label>Kriteria</label>'
                        +'<div class="input-control select">'
                            +'<select required name="kriteriaTB" id="kriteriaTB"></select>'
                        +'</div>'
                        
                        // keterangan
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        // combo departemen
        cmbdepartemen('');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#tahunajaranS').on('change',function (){
            viewTB();
        });$('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val(),'');
        });$('#tingkatS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });$('#keteranganS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#tingkatS').val('');
            $('#keteraganS').val('');
        });
    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(dep){
        $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen',
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
                    $('#departemenS').html(out);
                }cmbtahunajaran('filter',dt.departemen[0].replid,'');
            }
        });
    }
//end of combo departemen ---

// combo kriteria ---
    function cmbkriteria(krit){
        var u = dir4;
        var d = 'aksi=cmb'+mnu4+'&tahunajaran='+$('#tahunajaranS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.kriteria, function(id,item){
                    if(item.isActive==0){
                        if(krit==item.replid) stat=' class="fg-white bg-blue" selected';
                        else stat=' disabled';
                    }else stat='class="fg-white bg-green"';
                    out+='<option '+stat+' value="'+item.replid+'">'+item.kriteria+'</option>';
                });
            }
            $('#kriteriaTB').html('<option value="">-Pilih Kriteria-</option>'+out);
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(typ,dep,thn){
        var u = dir3;
        var d = 'aksi=cmbtahunajaran&departemen='+dep+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    out+='<option '+(thn==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+'</option>';
                });
            }
            if(typ=='form'){
                $('#tahunajaranTB').val(dt.tahunajaran[0].tahunajaran);                                
                $('#tahunajaranH').val(dt.tahunajaran[0].replid);                                
            }else{
                $('#tahunajaranS').html(out);
                viewTB(); 
            }
        });
    }
//end of combo tahunajaran ---

//save process ---
    function simpan(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
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
                    viewTB($('#departemenS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&tahunajaranS='+$('#tahunajaranS').val()
                    +'&tingkatS='+$('#tingkatS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

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
                if (id!='') { // edit mode
                    var u = dir;
                    var d = 'aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt){
                        var out;
                        $('#idformH').val(id);
                        cmbtahunajaran('form',$('#departemenS').val(),$('#tahunajaranS').val());
                        cmbkriteria(dt.kriteria);
                        $('#keteranganTB').val(dt.keterangan);
                    });
                    titlex='<span class="icon-pencil"></span> Ubah ';
                }else{
                    cmbtahunajaran('form',$('#departemenS').val(),$('#tahunajaranS').val());
                    cmbkriteria('');
                    // $('#tahunajaranH').val($('#tahunajaranS').val());
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                }
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
        $('#tingkatTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
    	var th  = $('#'+mnu+'TD_'+id).html();
    	var dep = $('#'+mnu2+'S').val();
    	//alert('d '+dep);
    	//return false;
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---
//
function ajax(u,d){
    return $.ajax({
        url:u,
        data:d,
        type:'post',
        dataType:'json'
    });
}