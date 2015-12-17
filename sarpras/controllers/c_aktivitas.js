var mnu       ='aktivitas'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" style="overflow:scroll;height:600px;" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input required id="tanggal1TB" name="tanggal1TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal Selesai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input id="tanggal2TB" name="tanggal2TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Aktivitas</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="aktivitas" required type="text" name="aktivitasTB" id="aktivitasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        +'<label>Detail Anggaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="detilanggaranH" name="detilanggaranH" />'
                            +'<input onfocus="autoSuggest(\'detilanggaran\')" placeholder="detail anggaran" required type="text" name="detilanggaranTB" id="detilanggaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Tanggal tagihan</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input id="tgltagihanTB" name="tgltagihanTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // +'<label>History Pelunasan</label>'
                        +'<div class="input-control text">'
                            +'<a class="button fg-white bg-orange" target="_blank" href="/sister/keuangan/transaksi"><i class="icon-printer"></i> Report Sarpras </a>'
                            +'<a onclick="$(\'#ssIMG\').toggle(\'slow\');" class="fg-white bg-lightGreen button" href="#"><i class="icon-info"></i> Petunjuk</a>'
                            +'<img id="ssIMG" style="display:none;" src="img/sar_aktivitas_report_ss.png" alt="" />'
                            // +'<a href="keuangan/transaksi" target="_blank" >Lihat Keuangan : tab laporan sarpras</a>'
                        +'</div>'

                        // button 
                        +'<legend style="font-weight:bold;">Item  : '
                            +'<a id="addTRBC" onclick="addItemTR();" href="#" class="place-right button bg-blue fg-white">'
                                +'<i class="icon-plus-2"></i>'
                            +'</a>'
                        +'</legend>'

                        // tabel item 
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Item</th>'
                                    +'<th class="text-center">Jumlah</th>'
                                    +'<th class="text-center">Biaya Satuan</th>'
                                    +'<th class="text-center">Biaya Total</th>'
                                    // +'<th class="text-center">Biaya Total (Realisasi)</th>'
                                    // +'<th class="text-center">Tgl Tagihan</th>'
                                    // +'<th class="text-center">Tgl Pelunasan</th>'
                                    +'<th class="text-center">Hapus</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="itemTBL"></tbody>'
                            +'<tfoot>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th colspan="2" class="text-right">Jumlah :</th>'
                                    +'<th id="totNominal1TD" class="text-right">Rp. 0</th>'
                                    +'<th id="totNominal2TD" class="text-right">Rp. 0</th>'
                                    // +'<th id="totNominal3TD" class="text-right">Rp. 0</th>'
                                    +'<th colspan="3"></th>'
                                +'</tr>'
                            +'</tfoot>'
                        +'</table>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //combo lokasi
        cmblokasi();
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
            viewTB();
        });
        $('#aktivitasS,#keteranganS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13) viewTB();
        });
        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#aktivitasS').val('');
            $('#keteranganS').val('');
        });
    }); 
// end of main function ---

// combo departemen ---
    function cmblokasi(){
        $.ajax({
            url:dir2,
            data:'aksi=cmblokasi',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.lokasi, function(id,item){
                        out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });
                }
                $('#lokasiS').html(out);
                viewTB(); 
            }
        });
    }
//end of combo departemen ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan&idDelTR='+idDelTR;
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
                    // viewTB($('#aktivitasS').val());
                    viewTB($('#'+mnu2+'S').val()); //value : combo box LOKASI 
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+$('#lokasiS').val()
                +'&aktivitasS='+$('#aktivitasS').val()
                +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
    // record rekening perkiraan
    var iTR = 1;    
    var idDelTR = [];
    var idAddTR = [];

    function itemTR (n,arr) {
        var tr='';
        var isLoop=true;
        if(typeof n=='undefined'){ isLoop=false; n=iTR;}
        for(var i=n; i>=iTR; i--){
            var ke = parseInt(i)-1;
            var iditem    = (typeof arr!='undefined')?arr[ke].iditem:null;
            var item      = (typeof arr!='undefined')?arr[ke].item:'';
            var jumlah    = (typeof arr!='undefined')?arr[ke].jumlah:1;
            var biayaSat  = (typeof arr!='undefined')?arr[ke].biayaSat:0;
            var biayaTot  = (typeof arr!='undefined')?arr[ke].biayaTot:0;
            var biayaTot2 = (typeof arr!='undefined')?arr[ke].biayaTot2:0;
            var tglbayar  = (typeof arr!='undefined')?arr[ke].tglbayar:'';
            var tgllunas  = (typeof arr!='undefined')?arr[ke].tgllunas:'';
            console.log(biayaSat);
            var mode = (typeof arr!='undefined')?'edit':'add';

            tr+='<tr class="itemTR"  id="itemTR_'+ke+'">'
            // tr+='<tr  class="itemTR '+(biayaTot2!=0?'bg-lightTeal':'bg-amber')+'" id="itemTR_'+ke+'">'
                    // item
                    +'<td align="center">'
                        +'<input type="hidden" name="mode'+ke+'H" value="'+mode+'" />'
                        +'<input type="hidden" class="iditem" value="'+iditem+'" name="iditem_'+ke+'H" id="iditem_'+ke+'H">'
                        +'<input type="hidden" class="idTR" value="'+ke+'" name="idTR[]" id="idTR_'+ke+'">'
                        +'<div class="input-control text size3">'
                            +'<input  value="'+item+'" required id="item_'+ke+'TB" name="item_'+ke+'TB">'
                            // +'<input '+(biayaTot2!=0?'disabled':'')+' value="'+item+'" required id="item_'+ke+'TB" name="item_'+ke+'TB">'
                        +'</div>' 
                    +'</td>'
                    // jumlah item 
                    +'<td align="center">'
                        +'<div class="input-control text">'
                            +'<input onkeyup="itemTotNominal();" value="'+jumlah+'"  type="number" required min="1" id="jumlah_'+ke+'TB" name="jumlah_'+ke+'TB">'
                            // +'<input '+(biayaTot2!=0?'disabled':'')+' onkeyup="itemTotNominal();" value="'+jumlah+'"  type="number" required min="1" id="jumlah_'+ke+'TB" name="jumlah_'+ke+'TB">'
                        +'</div>' 
                    +'</td>'
                    // biaya satuan (yg diajukan) 
                    +'<td align="center">'
                        +'<span class="input-control text">'
                            +'<input onkeyup="itemTotNominal();" value="Rp. '+biayaSat.setCurr()+'" required class="text-right itemNominal1" onfocus="inputuang(this);" onclick="inputuang(this);"' 
                                +' id="biaya_'+ke+'TB" name="biaya_'+ke+'TB" >'
                                // +(biayaTot2!=0?'disabled':'')+' id="biaya_'+ke+'TB" name="biaya_'+ke+'TB" >'
                        +'</span>'
                    +'</td>'
                    // biaya total (yg diajukan) 
                    +'<td align="right">'
                        +'<span class="text-right itemNominal2" id="biayaTot2_'+ke+'TB">Rp. '+biayaTot.setCurr()+'</span>'
                    +'</td>'
                    // hapus
                    +'<td align="center">'
                        +(biayaTot2!=0?'-':'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delItemTR('+ke+','+iditem+',\'\');':'delItemTR('+ke+','+iditem+',\'\')')+'"  class="button"><i class="icon-cancel-2"></i></a>')
                    +'</td>'
                +'</tr>';
        }
        // console.log(tr);
        if(isLoop) iTR+=n;
        else iTR++;

        return tr; 
    }

//add TR rekening into an element 
    function addItemTR(n,arr){
        $('#itemTBL').prepend(itemTR(n,arr));
    }

// form ---
    function viewFR(id){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 700,
            padding: 10,
            onShow: function(){
                var titlex;
                // setTimeout(function(){
                    if(id==''){  //add mode
                        titlex='<span class="icon-plus-2"></span> Tambah ';
                        var u = dir2;
                        var d = 'aksi=cmblokasi&replid='+$('#lokasiS').val();
                        ajax(u,d).done(function(dt){
                            $('#tanggal1TB').val(getToday());
                            $('#tanggal2TB').val(getToday());
                            $('#tgltagihanTB').val(getToday());
                            $('#lokasiTB').val(dt.lokasi[0].nama);
                            $('#lokasiH').val($('#lokasiS').val());
                            addItemTR(1);
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
                                $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                                $('#lokasiTB').val(dt.lokasi);
                                $('#tanggal1TB').val(dt.tanggal1);
                                $('#tgltagihanTB').val(dt.tgltagihan);
                                $('#tanggal2TB').val(dt.tanggal2);
                                $('#aktivitasTB').val(dt.aktivitas);
                                $('#keteranganTB').val(dt.keterangan);
                                $('#detilanggaranH').val(dt.iddetilanggaran);
                                $('#detilanggaranTB').val(dt.detilanggaran);
                                var t1=t2=t3=0;
                                $.each(dt.itemArr,function(id,item){
                                    t1+=parseInt(item.biayaSat);
                                    t2+=parseInt(item.biayaTot);
                                    t3+=parseInt(item.biayaTot2);
                                });
                                $('#totNominal1TD').html('Rp. '+t1.setCurr());
                                $('#totNominal2TD').html('Rp. '+t2.setCurr());
                                $('#totNominal3TD').html('Rp. '+t3.setCurr());
                                var n = dt.itemArr.length;
                                addItemTR(n,dt.itemArr);
                                $('#addTRBC').attr('style','display:none;');
                            }
                        });
                    }
                // },200);
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){ 
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari  = '&lokasiS='+$('#lokasiS').val();
                    // +'&tempatS='+$('#tempatS').val()
                    // +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
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
// end of notifikasi
// hjkagj
//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#tanggal1TB').val('');
        $('#tanggal1TB').val('');
        $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 



// left pad (replace with 0)
    function lpadZero (n, length){
        var str = (n > 0 ? n : -n) + "";
        var zeros = "";
        for (var i = length - str.length; i > 0; i--)
            zeros += "0";
        zeros += str;
        return n >= 0 ? zeros : "-" + zeros;
    }

    function validUang () {
        //TODO
    }

/*about date*/ 
// get month format -------------
    function monthFormat(mon){
        switch(mon){
            case 1:return 'Jan';break;
            case 2:return 'Feb';break;
            case 3:return 'Mar';break;
            case 4:return 'Apr';break;
            case 5:return 'May';break;
            case 6:return 'Jun';break;
            case 7:return 'Jul';break;
            case 8:return 'Aug';break;
            case 9:return 'Sep';break;
            case 10:return 'Oct';break;
            case 11:return 'Nov';break;
            case 12:return 'Dec';break;
        }
    }

//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
    }

//global u/ tanggal --------
    var now  = new Date();
    var dd   = now.getDate();
    var mm   = now.getMonth()+1;
    var yyyy = now.getFullYear();

//tanggal terakhir : dd
    function lastDate(m,y){
        return 32 - new Date(y, (m-1), 32).getDate();
    }
// tanggal hari ini : dd mm yyyy
    function getToday() {
        // function addLeadingZeros (n, length){
        return dateFormatx('id',lpadZero(dd,2),monthFormat(mm),yyyy);
    }
// tanggal pertama bulan ini : dd mm yyyy 
    function getFirstDate() {
        return dateFormatx('id','01',monthFormat(mm),yyyy);
    }
// tanggal terakhir bulan ini  : dd mm yyyy
    function getLastDate() {
        var dd = lastDate(mm,yyyy);
        return dateFormatx('id',dd,monthFormat(mm),yyyy);
    }

// fungsi AJAX : asyncronous
    function ajax(u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            thousands:'.', 
            affixesStay: true
        });
    }
// end of input uang --------------------------

    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iTR=1; // reset rekTR's counter
            idDelTR=[]; // reset rekTR's counter
            itemArr=[]; // reset itemArr's counter
        }
    }


// remove TR rekening
    function delItemTR (ke,iditem) {
        console.log('id item ='+iditem);
        console.log(validDelRek().status);

        if(validDelRek().status==false){
            notif(validDelRek().msg,'red');
        }else{
            if(iditem!=null) {
                idDelTR.push(iditem);
            } 

            //jika ada hapus (jurnal umum)
            $('#itemTR_'+ke).fadeOut('slow',function(){
                $('#itemTR_'+ke).remove();
                itemArrFC();
                console.log('arr terpilih in delitem=>'+idDelTR);
            });
            // console.log(idDelTR);
        }
    }

    function itemArrFC(){
        itemArr=[];
        $('.iditem').each(function(id,item){
            itemArr.push($(this).val());
        });return itemArr;
    }

    function validDelRek () {
        var ret={'status':true,'msg':null};
        // if($('#subaksiH').val()=='ju' && $('.rekTR').length<=2){
        //     ret.status=false;
        //     ret.msg='minimal lengkapi kredit dan debit';
        // }else 
        // if($('#subaksiH').val()!='ju'){
            if($('.itemTR').length<=1){
                ret.status=false;
                ret.msg='minimal isi 1 item';
            }else{
                itemTotNominal();
            }
        // }
        return ret;
    }
    // get total nominal rekening (ex : Rp. 500.000)
    function itemTotNominal () {
        var tot1=tot2=tot3=0;
        $('.itemNominal1').each(function() {
            tot1+=getCurr($(this).val());
        });
        $('.itemNominal2').each(function() {
            tot2+=getCurr($(this).val());
        });
        $('.itemNominal3').each(function() {
            tot3+=getCurr($(this).val());
        });
        $('#totNominal1TD').html('Rp. '+tot1.setCurr());
        $('#totNominal2TD').html('Rp. '+tot2.setCurr());
        $('#totNominal3TD').html('Rp. '+tot3.setCurr());
    }

    // currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        var x = Number(n.replace(/[^0-9\,]+/g,""));
        return x;
    }

    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

    function autoSuggest(el){
            var urlx= '?aksi=autocomp';
            var col =[{
                    'align':'left',
                    'columnName':'nama',
                    'hide':true,
                    'width':'20',
                    'label':'Anggaran'
            },{   
                    'align':'left',
                    'columnName':'kategorianggaran',
                    'width':'10',
                    'label':'Kategori'
            },{   
                    'align':'left',
                    'columnName':'tingkat',
                    'width':'15',
                    'label':'Jenjang'
            },{ 
                    'align':'right',
                    'columnName':'kuotaCur',
                    'width':'15',
                    'label':'Kuota'
            },{   
                    'align':'right',
                    'columnName':'terpakaiCur',
                    'width':'15',
                    'label':'Terpakai'
            },{   
                    'align':'right',
                    'columnName':'sisaCur',
                    'width':'15',
                    'label':'Sisa'
            }];

        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nama+' [ sisa :'+ui.item.kuotaCur+'  kuota : '+ui.item.sisaCur+' ]');
                var x = el.substring(22);
                $('#out_come_sisaanggaran'+x+'H').val(getCurr(ui.item.sisaCur));
                // $('#out_come_rek'+x+'TB').html(ui.item.rekening);
                // $('#out_come_rek'+x+'H').val(ui.item.idrekening);

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');

                                $('#out_come_sisaanggaran'+(el.substring(22))+'H').val(''); // :: out_come
                                $('#'+el+'sisaH').val(''); // sisa rekening :: in/out/ju/
                                // collectArr();
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

/*save (insert & update)*/
    /*function transSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+$('#subaksiH').val();
        if($('#subaksiH').val()=='ju') data+='&idDelTR='+idDelTR;
        if(validForm().status!=true){ // tidak valid
            var m = '';
            $.each(validForm().msg,function(id,item){
                m+='<span class="fg-white"><i class="icon-warning"></i> '+item+'</span><br />';
            });notif(m,'red');
        }else{ // valid 
            console.log('ok');
            ajax(url,data).done(function(dt){
                notif(dt.status,dt.status!='sukses'?'red':'green');
                if(dt.status=='sukses'){
                    if($('#kwitansiCB').prop('checked')) printPDF('kwitansi');
                    $.Dialog.close();
                    $('#rekTBL').html('');
                    loadAll();
                    // viewTB('ju');
                }
            });
        }
    }*/