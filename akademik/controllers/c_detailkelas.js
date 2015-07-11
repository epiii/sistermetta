var mnu  = 'detailkelas';
var mnu2 = 'tahunajaran';
var mnu3 = 'tingkat';
var mnu4 = 'subtingkat';
var mnu5 = 'departemen';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = 'models/m_'+mnu5+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<div style="overflow:scroll;height:550px;"  class="">'
                        +'<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        // header
                       +'<table width="100%" >'
                            +'<tr>'
                                +'<td  width="25%" ><b>Tahun Ajaran</b></td><td width="1%">:</td>'
                                +'<td id="tahunajaranDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Tingkat</b></td><td  width="1%">:</td>'
                                +'<td id="tingkatDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Sub Tingkat</b></td><td  width="1%">:</td>'
                                +'<td id="subtingkatDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Kelas</b></td><td  width="1%">:</td>'
                                +'<td id="kelasDV"></td>'
                            +'</tr>'
                        +'</table>'

                        // kapasitas
                        +'<label>Kapasitas</label>'
                        +'<div class="input-control text">'
                            +'<input required type="number" min="1" max="1000" placeholder="kapasitas" name="kapasitasTB" id="kapasitasTB">'
                        +'</div>'

                        // wali kelas
                        +'<label>Wali Kelas (NIP/Nama Guru)</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="waliH" id="waliH">'
                            +'<input required placeholder="NIP / Nama" name="waliTB" id="waliTB">'
                        +'</div>'
                        
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
                    +'</div>'
        cmbdepartemen('filter','');
        // cmbtahunajaran('filter','');
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

    /*filtering*/
        // combo
        $('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val());
        });
        $('#tahunajaranS').on('change',function (){
            cmbtingkat('filter','');
        });
        $('#tingkatS').on('change',function (){
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
        var u = dir3;
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
            var u=dir4;
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
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                $.Dialog.content(contentFR);
                $('#kapasitasTB').focus();
                $.Dialog.title('Ubah Detail Kelas');
                var titlex;
                ajax(dir,'aksi=ambiledit&replid='+id).done(function  (dt) {
                    $('#idformH').val(id);
                    $('#tahunajaranDV').html(dt.datax.tahunajaran);
                    $('#tingkatDV').html(dt.datax.tingkat);
                    $('#subtingkatDV').html(dt.datax.subtingkat);
                    $('#kelasDV').html(dt.datax.kelas);
                    
                    $('#kapasitasTB').val(dt.datax.kapasitas);
                    $('#waliTB').val(dt.datax.wali);
                    autoSuggest('wali','wali');
                });
            }
        });
    }
// end of form ---

  // autosuggest
    function autoSuggest(el,subaksi){
        var urlx= '?aksi=autocomp&subaksi='+subaksi;
        var col = [{
                'align':'left',
                'columnName':'nip',
                'hide':true,
                'width':'10',
                'label':'NIP'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'90',
                'label':'NAMA'
        }];
        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'750px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nip+' / '+ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
                            }
                        }
                    });
                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
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
// combo departemen  ---
    function cmbdepartemen(typ,dep){
        var u=dir5;
        var d='aksi=cmb'+mnu5;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option '+(item.replid==dep?'selected':'')+' value="'+item.replid+'"> '+item.nama+'</option>';
                });
                if(typ=='filter'){
                    $('#departemenS').html(out);
                    cmbtahunajaran('filter',dt.departemen[0].replid);
                }else{
                    $('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
                }
            }
        });
    }
// combo tahun ajaran  ---
    function cmbtahunajaran(typ,dep,thn){
        var u=dir2;
        var d='aksi=cmb'+mnu2+(dep!=''?'&departemen='+dep:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    if(item.aktif=='1')
                        out+='<option selected value="'+item.replid+'"> '+item.tahunajaran+' (aktif)</option>';
                    else{
                        out+='<option '+(item.replid==thn?'selected':'')+' value="'+item.replid+'"> '+item.tahunajaran+'</option>';
                    }
                });
                if(typ=='filter'){
                    $('#tahunajaranS').html(out);
                    cmbtingkat('filter','');
                }else{
                    $('#tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                }
            }
        });
    }
