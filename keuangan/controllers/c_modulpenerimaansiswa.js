var mnu  ='modulpenerimaansiswa'; 
var mnu2 ='katmodulpembayaran'; 
var mnu3 ='angkatan'; 
var mnu4 ='departemen'; 
var mnu5 ='tahunajaran'; 
var mnu6 ='semester'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='../akademik_sister/models/m_'+mnu3+'.php';
var dir4 ='../akademik_sister/models/m_'+mnu4+'.php';
var dir5 ='../akademik_sister/models/m_'+mnu5+'.php';
var dir6 ='../akademik_sister/models/m_'+mnu6+'.php';

var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR +='<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<input name="angkatanH"  id="angkatanH" type="hidden">' 
                        +'<label>Kategori Modul</label>'
                            +'<div class="input-control select">'
                                +'<select name="katmodulpembayaranTB" id="katmodulpembayaranTB"></select>'
                            +'</div>'
                        +'</div>'

                        +'<label>Nama Pembayaran</label>'
                            +'<div class="input-control text">'
                                +'<input placeholder="Nama Pembayaran" required name="namaTB" id="namaTB">'
                            +'</div>'
                        +'</div>'

                        +'<label>Rek. Kas</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek1H" name="rek1H" />'
                            +'<input placeholder="Rekening Kas" name="rek1TB" id="rek1TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Rek. Pendapatan</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek2H" name="rek2H" />'
                            +'<input placeholder="Rekening Pendapatan" name="rek2TB" id="rek2TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Rek. Piutang</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek3H" name="rek3H" />'
                            +'<input placeholder="Rekening Piutang" name="rek3TB" id="rek3TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // +'<label>Nominal</label>'
                        // +'<div class="input-control text">'
                            // +'<input onclick="inputuang(this);" placeholder="Nominal" name="nominalTB" id="nominalTB">'
                            // +'<button class="btn-clear"></button>'
                        // +'</div>'
                        
                        // +'<label>Cicilan</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="cicilan" onclick="inputuang(this);"  name="cicilanTB" id="cicilanTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        
                        // +'<label>Diskon</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="diskon" onclick="inputuang(this);"  name="diskonTB" id="diskonTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'

                        // +'<label>Biaya Administrasi</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="biayaadmin" onclick="inputuang(this);"  name="biayaadminTB" id="biayaadminTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                  +'</form>';

        cmbdepartemen('filter','');
        
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kodeS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        //filtering :combo
        $('#departemenS').on('change',function(){
            cmbangkatan('filter',$(this).val(),'');
        });$('#angkatanS').on('change',function(){
            cmbkatmodulpembayaran('filter','');
        });$('#katmodulpembayaranS').on('change',function(){
            cmbtahunajaran('filter',$('#departemenS').val(),'');
        });$('#tahunajaranS').on('change',function(){
            cmbsemester('filter',$(this).val(),'');
        });$('#semesterS').on('change',function(){
            cmbbulan('filter',$(this).val(),'');
        });$('#bulanS').on('change',function(){
            viewTB();
        });
        //filtering : textbox
        $('#namaS,#keteranganS').on('keydown',function (e){ 
            if(e.keyCode == 13)viewTB();
        });
    }); 
// end of main function ---

// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir4;
        var d = 'aksi=cmb'+mnu4+(dep!=''?'&replid='+dep:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    $('#departemenS').html(out);
                    cmbangkatan('filter',dt.departemen[0].replid,'');
                }else{ // form (add || edit)
                    $('#departemenTB').html(dt.departemen[0].nama);
                }
            }
        });
    }

// combo angkatan ---
    function cmbangkatan(typ,dep,angk){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3+'&departemen='+dep+(angk!=''?'&replid='+angk:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.angkatan, function(id,item){
                    out+='<option value="'+item.replid+'">Angkatan '+item.angkatan+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    $('#angkatanS').html(out);
                    cmbkatmodulpembayaran('filter','');
                }else{ // form (add || edit)
                    $('#angkatanTB').html(out);
                }
            }
        });
    }

// combo kategori modul pembayaran  ---
    function cmbkatmodulpembayaran(typ,kat){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.katmodulpembayaran, function(id,item){
                    out+='<option '+(kat==item.replid?'selected':'')+' value="'+item.replid+'"> '+item.nama+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    $('#katmodulpembayaranS').html('<option value="">-SEMUA-</option>'+out);
                    cmbtahunajaran('filter',$('#departemenS').val(),'');
                    // viewTB();
                }else{ // form (add || edit)
                    $('#katmodulpembayaranTB').html(out);
                }
            }
        });
    }

// combo tahun ajaran  ---
    function cmbtahunajaran(typ,dep,thn){
        var u = dir5;
        var d = 'aksi=cmb'+mnu5+'&departemen='+dep+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    out+='<option '+(thn==item.replid?'selected':'')+' value="'+item.replid+'"> '+item.tahunajaran+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    $('#tahunajaranS').html('<option value="">-SEMUA-</option>'+out);
                    cmbsemester('filter','','');
                }else{ // form (add || edit)
                    $('#tahunajaranTB').html(out);
                }
            }
        });
    }

// combo semester ---
    function cmbsemester(typ,thn,sem){
        var u = dir6;
        var d = 'aksi=cmb'+mnu6+(thn!=''?'&tahunajaran='+thn:'')+(sem!=''?'replid='+sem:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.semester, function(id,item){
                    out+='<option '+(thn==item.replid?'selected':'')+' value="'+item.replid+'"> '+item.semester+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    $('#semesterS').html('<option value="">-SEMUA-</option>'+(thn!=''?out:''));
                    cmbbulan('filter','','');
                }else{ // form (add || edit)
                    $('#semesterTB').html(out);
                }
            }
        });
    }

// combo bulan (in semester)
    function cmbbulan(typ,sem,bln){
        if(sem==''){ // semester tidak terpilih 
            $('#bulanS').html('<option value="">-SEMUA-</option>');
            viewTB();
        }else{ // semester terpilih
            var u = dir6;
            var d ='aksi=cmb'+mnu6+(sem!=''?'&replid='+sem:'');
            ajax(u,d).done(function(dt){
                var out='';
                if(dt.status!='sukses'){
                    notif(dt.status,'red');
                }else{
                    if(sem==''){ // semester kosong
                        out+='<option value="">-SEMUA-</option>';
                    }else{ // semester terpilih
                        var arr=new Array();
                            arr=dt.semester[0];
                            console.log(dt.semester);
                        var b1 =parseInt(arr.tglMulai.substr(5,2)); // bulan @tahun awal 
                        var b2 =parseInt(arr.tglSelesai.substr(5,2)); // bulan @tahun akhir
                        var t1 =parseInt(arr.tglMulai.substr(0,4)); // tahun @tahun awal 
                        var bln =['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'];
                        
                        out+='<option value="">-SEMUA-</option>';
                        $.each(bln, function(id,item){
                            disx='';
                            if((id+1)<b1) disx = 'disabled'; // 1,2,3,4,5(disabled) | 6,7,8,9,10,11,12(enabled)
                            if((id+1)>b2) disx = 'disabled'; // 8,9,10,11,12(disabled) | 1,2,3,4,5,6,7(enabled)
                            out+='<option '+disx+' value="'+(parseInt(id)+1)+'">'+item+'</option>';
                        });
                    }$('#bulanS').html(out);
                    viewTB();
                }
            });
        }
    }

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
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                    viewTB();
                }notif(cont,clr);
            }
        });
    }

    // view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
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
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr>');
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
            width: '75%',
            padding: 10,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    cmbkatmodulpembayaran('form','');
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            // $('#nominalTB').val(dt.nominal);
                            $('#diskonTB').val(dt.diskon);
                            $('#cicilanTB').val(dt.cicilan);
                            $('#biayaadminTB').val(dt.biayaadmin);
                            $('#rek1TB').val(dt.rek1);
                            $('#rek2TB').val(dt.rek2);
                            $('#rek3TB').val(dt.rek3);
                            $('#rek1H').val(dt.idrek1);
                            $('#rek2H').val(dt.idrek2);
                            $('#rek3H').val(dt.idrek3);
                            $('#namaTB').val(dt.nama);
                            $('#keteranganTB').val(dt.keterangan);
                            cmbkatmodulpembayaran('form',dt.katmodulpembayaran);
                        }
                    });
                }
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
        $('#angkatanH').val($('#angkatanS').val());

        // autosuggest rek 1
        $("#rek1TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&subaksi=kas', /*epiii*/
            select: function( event, ui ) {
                $('#rek1H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek1H').val()!=''){
                                $('#rek1H').val('');
                                $('#rek1TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
        // autosuggest rek 2
        $("#rek2TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&subaksi=pendapatan', /*epiii*/
            select: function( event, ui ) {
                $('#rek2H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek2H').val()!=''){
                                $('#rek2H').val('');
                                $('#rek2TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
        // autosuggest rek 3
        $("#rek3TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&nama=piutang', /*epiii*/
            select: function( event, ui ) {
                $('#rek3H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek3H').val()!=''){
                                $('#rek3H').val('');
                                $('#rek3TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
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
                    // viewTB($('#tempatS').val());
                    viewTB($('#'+mnu2+'S').val());
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

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }

// normal AJAX
    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }
