var mnu  = 'detailpelajaran';
var mnu2 = 'departemen';
var mnu3 = 'tahunajaran';
var mnu4 = 'tingkat';
var mnu5 = 'subtingkat';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = 'models/m_'+mnu5+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbtingkat('filter','');
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // Tingkat 
                        +'<label>Tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="tingkatTB" id="tingkatTB">'
                        +'</div>'

                        // Sub Tingkat 
                        +'<label>Sub Tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="subtingkatH" id="subtingkatH">'
                            +'<input disabled name="subtingkatTB" id="subtingkatTB">'
                        +'</div>'

                        // pelajaran
                        +'<label>Mata Pelajaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="pelajaranH" id="pelajaranH">'
                            +'<input placeholder="pelajaran" required id="pelajaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#tingkatS').on('change',function (){
            cmbsubtingkat('filter',$(this).val(),'');
        });$('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });
        $('#subtingkatS').on('change',function(){
            viewTB();
        });

        $('#statusS').on('change',function(){
            viewTB();
        });

        $('#pelajaranS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });$('#singkatanS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });$('#skmS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });$('#keteranganS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });

        // search button
        // $('#cariBC').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     $('#tingkatS').val('');
        //     $('#keteraganS').val('');
        // });
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
                }cmbtahunajaran(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
                        }
                    });
                    // viewTB(dep,dt.tahunajaran[0].replid); 
                }
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

// autosuggest
    function autoSuggest(pel,el,subaksi){
        var urlx= '?aksi=autocomp&subaksi='+subaksi+(pel!=''?'&pelajaran='+pel:'')+'&subtingkat='+$('#subtingkatS').val();
        var col =[{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'20',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'80',
                'label':'Mata Pelajaran'
            }];

        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'500px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nama+' ('+ui.item.kode+')');

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

// form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '30%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(contentFR);
                $('#pelajaranTB').focus();
                var titlex;
                var u =dir;
                var d ='aksi=ambiledit&replid='+id;
                if (id!='') { // edit mode
                    ajax(u,d).done(function (dt) {
                        $('#idformH').val(id);
                        $('#pelajaranTB').val(dt.pelajaran);
                        $('#subtingkatH').val(dt.subtingkat);
                        cmbtingkat('form',dt.tingkat);
                        cmbsubtingkat('form',dt.tingkat,dt.subtingkat);
                        autoSuggest(dt.idpelajaran,'pelajaran','pelajaran');
                    });
                    titlex='<span class="icon-pencil"></span> Ubah ';
                }else{ //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $('#subtingkatH').val($('#subtingkatS').val());
                    cmbtingkat('form',$('#tingkatS').val());
                    cmbsubtingkat('form',$('#tingkatS').val(),$('#subtingkatS').val());
                    autoSuggest('','pelajaran','pelajaran');
                }
                $.Dialog.title(titlex+' '+mnu);
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
                    cont = dt.status;
                    clr  ='red';
                    tim  = 5000;
                }else{
                    viewTB();
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }notif(cont,clr,tim);
            }
        });
    }
//end of del process ---
    
// notifikasi
    function notif(cont,clr,tim) {
        var not = $.Notify({
            caption : "<b>Notifikasi</b>",
            content : cont,
            timeout : (typeof tim=='undefined'?3000:tim),
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
    function statusFC(idx,stat){
        if(confirm(' ubah status ?'))
        var u=dir;
        var d='aksi=aktifkan&replid='+idx+'&status='+stat;
        ajax(u,d).done(function (dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Mengaktifkan '+th+' ..';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Mengaktifkan '+th+' ..';
                clr  ='green';
            }notif(cont,clr);
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

// combo tingkat ---
    function cmbtingkat(typ,ting){
        console.log(ting);
        var u=dir4;
        var d='aksi=cmb'+mnu4+(ting!=''?'&replid='+ting:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tingkat.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option '+(ting==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.tingkat+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tingkatS').html(out);
                    cmbsubtingkat('filter',dt.tingkat[0].replid,'');
                }else{ // form (edit & add)
                    $('#tingkatTB').val(dt.tingkat[0].tingkat);
                }
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
            var d= 'aksi=cmb'+mnu5+(ting!=''?'&tingkat='+ting:'replid='+sub)+(sub!=''?'&replid='+sub:'');
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option '+(sub!='' && sub==item.replid?' selected ':'')+' value="'+item.replid+'">Kelas '+item.subtingkat+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#subtingkatS').html(out);
                    viewTB();
                }else{
                    $('#subtingkatTB').val(dt.subtingkat[0].subtingkat);
                }
            });
        }
    }
