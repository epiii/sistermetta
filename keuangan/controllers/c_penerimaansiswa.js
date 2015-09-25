var mnu  ='penerimaansiswa'; 
var mnu2 ='departemen'; 
var mnu3 ='biaya'; 
var mnu6 ='tahunajaran'; 
var mnu7 ='tingkat'; 
var mnu8 ='subtingkat'; 
var mnu9 ='kelas'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='../psb/models/m_'+mnu3+'.php';
var dir6 ='../akademik/models/m_'+mnu6+'.php';
var dir7 ='../akademik/models/m_'+mnu7+'.php';
var dir8 ='../akademik/models/m_'+mnu8+'.php';
var dir9 ='../akademik/models/m_'+mnu9+'.php';

var contentFR ='';
// main function load first 
    $(document).ready(function(){
        cmbdepartemen('filter');
        //form content
        contentFR+= '<form  style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="pembayaranSV(this); return false;" id="'+mnu+'FR">'
                        +'<input id="ju_idformH" type="hidden">' 
                        +'<input id="idsiswaH" name="idsiswaH" type="hidden">' 
                        +'<input id="idmodulH" name="idmodulH" type="hidden">' 
                        +'<input id="rekkasH" name="rekkasH" type="hidden">' 
                        +'<input id="rekitemH" name="rekitemH" type="hidden">' 

                        +'<div  data-effect="fade" class="tab-control" data-role="tab-control">'
                            +'<ul class="tabs">'
                                +'<li id="keteranganNAV"><a href="#keteranganTAB">Keterangan </a></li>'
                                +'<li id="rincianNAV"><a href="#rincianTAB">Rincian Biaya</a></li>'
                                +'<li id="pembayaranNAV"><a href="#pembayaranTAB">Pembayaran</a></li>'
                                // +'<li id="pembayaranNAV" class="active"><a href="#pembayaranTAB">Pembayaran</a></li>'
                            +'</ul>'

                            +'<div style="background-color:white;" class="frames">'
                                +'<div class="frame" id="keteranganTAB">'
                                    +'<label><b>Nomor</b></label>'
                                    +'<div class="input-control text">'
                                        +'<input disatype="text" disabled name="nomerTB" id="nomerTB" >'
                                    +'</div>'
                                    
                                    +'<label>Tanggal </label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" name="tanggalTB" id="tanggalTB">'
                                    +'</div>'
                                    
                                    +'<label>Rekening Kas / Bank</label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" id="rek1TB" name="rek1TB">'
                                    +'</div>'

                                    +'<label ><b>Pada :</b></label>'
                                    +'<label>Rekening Perkiraan</label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" id="rek2TB" name="rek2TB">'
                                    +'</div>'

                                    +'<label>Uraian</label>'
                                    +'<div class="input-control textarea">'
                                        +'<textarea readonly name="uraianTB" id="uraianTB"></textarea>'
                                    +'</div>'
                                +'</div>'

                                +'<div class="frame" id="rincianTAB">'
                                    // ALL
                                    +'<label>Nominal</label>'
                                    +'<div class="input-control text4">'
                                        +'<input disabled type="text" id="nominalTB" name="nominalTB">'
                                        +'<span id="statusI"></span>'
                                    +'</div>'
                                    +'<input id="statusTB" type="text" disabled style="display:none;"/>'

                                    // DPP grup
                                    +'<div class="dppgrup" style="display:none;">'
                                        +'<label>Total Diskon</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" id="disctotalTB" name="disctotalTB">'
                                        +'</div>'
                                        +'<label>Nominal Net(setelah dipotong diskon)</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled class="bg-lightTeal" type="text" id="nominalnetTB" name="nominalnetTB">'
                                        +'</div>'
                                        +'<label>Angsuran </label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" id="jmlangsurTB" name="jmlangsurTB">'
                                        +'</div>'
                                    +'</div>'
                                    //end of untuk DPP grup
                                +'</div>'
                               
                                +'<div class="frame" id="pembayaranTAB">'
                                    // DPP & pendaftaran (joining fee)
                                    +'<div class="dppjoin" style="display:none;">'
                                        +'<label><a id="histBayar" href="#" >Sudah Dibayar <span class="icon-history"></span></a> </label>'
                                        +'<table id="histBayarT" style="display:none;" class="table hovered bordered striped">'
                                            +'<thead>'
                                                +'<tr class="info fg-white">'
                                                    +'<th>Tgl Bayar</th>'
                                                    +'<th>Angsuran</th>'
                                                    // +'<th>hapus</th>'
                                                +'</tr>'
                                            +'</thead>'
                                            +'<tbody id="histBayarTBL">'
                                            +'</tbody>'
                                        +'</table>'
                                        +'<div class="input-control text">'
                                            +'<input  disabled type="text"  class="text-right bg-yellow" id="terbayarTB" name="terbayarTB">'
                                        +'</div>'
                                    +'</div>'

                                    +'<label id="akanbayarLBL">Akan Dibayar </label>'
                                    // DPP
                                    +'<div class="input-control select dppgrup" style="display:none;">'
                                        +'<select class="text-right" name="akanbayarTB" id="akanbayarTB"></select>'
                                        +'<span id="statusI2"></span>'
                                    +'</div>'
                                    // pendaftaran (joining fee)
                                    +'<div class="input-control text joingrup" style="display:none;">'
                                        +'<input class="text-right" placeholder="isi nominal (angka)" name="akanbayar2TB" id="akanbayar2TB" onfocus="inputuang(this);" onclick="inputuang(this);">'
                                        +'<span id="akanbayarI" class="fg-white bg-red"></span>'
                                    +'</div>'   
                                 +'</div>'
    
                            +'</div>'
                        +'</div><br />'


                        +'<div class="form-actions">' 
                            +'<button class="button primary simpanBC">Bayar <span class="icon-floppy"></span></button>&nbsp;'
                            // +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'

                        // // +'<legend>Keterangan </legend>'
                        // +'<div class="balloon bottom">'
                        //     +'<div class="padding20">'
                        //         // +'<label><b>Nomor</b></label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disatype="text" disabled name="nomerTB" id="nomerTB" >'
                        //         // +'</div>'
                                
                        //         // +'<label>Tanggal </label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" name="tanggalTB" id="tanggalTB">'
                        //         // +'</div>'
                                
                        //         // +'<label>Rekening Kas / Bank</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="rek1TB" name="rek1TB">'
                        //         // +'</div>'

                        //         // +'<label ><b>Pada :</b></label>'
                        //         // +'<label>Rekening Perkiraan</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="rek2TB" name="rek2TB">'
                        //         // +'</div>'

                        //         // +'<label>Uraian</label>'
                        //         // +'<div class="input-control textarea">'
                        //         //     +'<textarea readonly name="uraianTB" id="uraianTB"></textarea>'
                        //         // +'</div>'
                        //     +'</div>'
                        // +'</div>'

                        // +'<legend >Rincian Biaya</legend>'
                        // +'<div class="balloon bottom">'
                        //     +'<div class="padding20">'
                        //         // // ALL
                        //         // +'<label>Nominal</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="nominalTB" name="nominalTB">'
                        //         // +'</div>'

                        //         // // DPP grup
                        //         // +'<div class="dppgrup" style="display:none;">'
                        //         //     +'<label>Total Diskon</label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text" id="disctotalTB" name="disctotalTB">'
                        //         //     +'</div>'
                        //         //     +'<label>Nominal Net(setelah dipotong diskon)</label>'
                        //         //     +'<div class="input-control text warning-state">'
                        //         //         +'<input disabled class="bg-orange" type="text" id="nominalnetTB" name="nominalnetTB">'
                        //         //     +'</div>'
                        //         //     +'<label>Angsuran </label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text" id="jmlangsurTB" name="jmlangsurTB">'
                        //         //     +'</div>'
                        //         // +'</div>'
                        //         // //end of untuk DPP grup

                        //     +'</div>'
                        // +'</div>'

                        // +'<legend class="bayargrup" style="display:none;">Pembayaran</legend>'
                        // +'<div class="balloon bottom bayargrup" style="display:none;">'
                        //     +'<div class="padding20">'
                        //         // // DPP & pendaftaran (joining fee)
                        //         // +'<div class="dppjoin" style="display:none;">'
                        //         //     +'<label>Sudah Dibayar </label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text"  class="bg-yellow" id="terbayarTB" name="terbayarTB">'
                        //         //     +'</div>'
                        //         // +'</div>'

                        //         // +'<label>Akan Dibayar </label>'
                        //         // // DPP
                        //         // +'<div class="input-control select dppgrup" style="display:none;">'
                        //         //     +'<select class="bg-lime" name="akanbayarTB" id="akanbayarTB"></select>'
                        //         // +'</div>'
                        //         // // pendaftaran (joining fee)
                        //         // +'<div class="input-control text joingrup" style="display:none;">'
                        //         //     +'<input  placeholder="isi nominal (angka)" name="akanbayar2TB" id="akanbayar2TB" onfocus="inputuang(this);" onclick="inputuang(this);">'
                        //         //     +'<span id="akanbayarI" class="fg-white bg-red"></span>'
                        //         // +'</div>'
                        //     +'</div>'
                        // +'</div>'
                    +'</form>';

        $('#nisS,#namasiswaS,#nisnS,#nopendaftaranS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });
    }); 

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
        if(subaksi=='formulir' || subaksi=='joiningf'){
            cari+='&kelompokS='+$('#kelompokS').val();
        }

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
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

/*save (insert & update)*/
    function pembayaranSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+curTab();
        if($('#akanbayarI').html()!='' || $('#akanbayarI').val()=='Rp. 0'){ 
            return false;
        }else{
            ajax(url,data).done(function (dt) {
                notif(dt.status,(dt.status=='sukses'?'green':'red'));
                if (dt.status=='sukses') {
                    $.Dialog.close();
                    viewTB(curTab());
                }
            });
        }
    }

// form pembayaran 
    // pendaftaran
    function pembayaranFR (typ,sis) {
        ajax(dir,'aksi=ambiledit&subaksi='+typ+'&replid='+sis).done(function(dt){
            if(dt.status!=='sukses') notif('gagal menampilkan data','red');
            else{
                if(typ=='formulir'){ // pendaftaran (formulir)
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                    $('#tanggalTB').val(dt.datax.tanggal);
                    $('#nomerTB').val(dt.datax.nomer);
                    $('#rek1TB').val(dt.datax.rek1);
                    $('#rek2TB').val(dt.datax.rek2);
                    $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nCalon Siswa : '+dt.datax.siswa+' \nNo. Pendaftaran : '+dt.datax.nopendaftaran);
                    $('#nominalTB').val(dt.datax.nominal);
                    $('#pembayaranNAV').attr('style','display:none;');
                    $('#rincianNAV').addClass('active');
                    if(dt.datax.status=='lunas'){
                        $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum lunas';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }else if(typ=='joiningf'){ // pendaftaran (joining fee)
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                    $('#tanggalTB').val(dt.datax.tanggal);
                    $('#nomerTB').val(dt.datax.nomer);
                    $('#rek1TB').val(dt.datax.rek1);
                    $('#rek2TB').val(dt.datax.rek2);
                    $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nCalon Siswa : '+dt.datax.siswa+' \nNo. Pendaftaran : '+dt.datax.nopendaftaran);
                    $('#nominalTB').val(dt.datax.nominal2);
                    // data sudah terbayar 
                    $('#terbayarTB').val(dt.datax.terbayar2);
                    $('.joingrup').attr('style','display:visible;');
                    // $('#akanbayar2TB').attr('max',dt.datax.maxbayar);
                    $('.dppjoin').toggle('slow');
                    $('.bayargrup').toggle('slow');
                    // validasi nominal yg harus dibayar
                    $('#akanbayar2TB').on('keyup',function(){
                        validBayar('#akanbayar2TB','#akanbayarI',dt.datax.maxbayar,dt.datax.maxbayar2);
                    });
                    // cek history pembayaran
                    $('#histBayar').on('click',function(){
                        histBayar(dt.datax.idsiswa);
                    });
                    $('#pembayaranNAV').addClass('active');

                    if(dt.datax.status=='lunas'){
                        $('#akanbayar2TB').attr('style','display:none;');
                        $('.simpanBC').attr('style','display:none;');
                        $('#akanbayarLBL').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else if(dt.datax.status=='kurang'){
                        $('#akanbayar2TB').attr('required',true);
                        icon = 'minus-2';
                        clr  = 'orange';
                        info = 'kurang';
                    }else{ //  belum pernah 
                        $('#akanbayar2TB').attr('required',true);
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum';
                    }
                    var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }else if(typ=='dpp'){ // dpp (uang gedung)
                   // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                        // info pembayaran 
                        $('#tanggalTB').val(dt.datax.tanggal);
                        $('#nomerTB').val(dt.datax.nomer);
                        $('#rek1TB').val(dt.datax.rek1);
                        $('#rek2TB').val(dt.datax.rek2);
                        $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nSiswa : '+dt.datax.siswa+' \nNIS : '+dt.datax.nis);
                        // detail pembayaran (nominal dll)
                        $('#nominalTB').val(dt.datax.nominal);
                        $('#nominalnetTB').val(dt.datax.nominalnet);
                        $('#disctotalTB').val(dt.datax.disctotal);
                        $('#jmlangsurTB').val(dt.datax.jmlangsur+' x '+dt.datax.angsuran);
                        // data sudah terbayar 
                        $('#terbayarTB').val(dt.datax.terbayar);
                        // data akan dibayar
                        cmbakanbayar('dpp',dt.datax.idsiswa);
                    $('.dppgrup').toggle('slow');
                    $('.dppjoin').toggle('slow');
                    // cek history pembayaran
                    $('#histBayar').on('click',function(){
                        histBayar(dt.datax.idsiswa);
                    });

                    $('.bayargrup').toggle('slow');
                    $('#pembayaranNAV').addClass('active');

                    if(dt.datax.status=='lunas'){
                        // $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else if(dt.datax.status=='kurang'){
                        icon = 'minus-2';
                        clr  = 'orange';
                        info = 'kurang';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI2').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');

                }else{ //spp
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                        // info pembayaran 
                        $('#tanggalTB').val(dt.datax.tanggal);
                        $('#nomerTB').val(dt.datax.nomer);
                        $('#rek1TB').val(dt.datax.rek1);
                        $('#rek2TB').val(dt.datax.rek2);
                        $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nSiswa : '+dt.datax.siswa+' \nNIS : '+dt.datax.nis);
                        // detail pembayaran (nominal dll)
                        $('#nominalTB').val(dt.datax.nominal);
                    $('#pembayaranNAV').attr('style','display:none;');
                    $('#rincianNAV').addClass('active');
                    if(dt.datax.status=='lunas'){
                        $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum lunas';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }
            }
        });
        // setTimeout(function(){
            loadModal(typ,contentFR);
        // },500);
    }

    function cmbakanbayar(typ,sis){
        var url  = dir;
        var data = 'aksi=cmbakanbayar&siswa='+sis+'&subaksi='+typ;
        ajax(url,data).done(function (dt) {
            var out='';
            if (dt.status=='sukses') {
                $.each(dt.datax, function(id,item){
                    out+='<option value="'+item.idAngsur+'"> '+item.nomAngsur+'</option>';
                });
            }else{
                out+='<option value="">0</option>';
                console.log(dt.status);
                $('.simpanBC').attr('style','display:none;');
            }$('#akanbayarTB').html(out);
        });
    }

    // form pop up
    function loadModal(titl,cont){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
            }
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
// end of input uang --------------------------

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

// print to PDF -------
    function printPDF(mn){
        var par='',tok='',p=v='';
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });
        if(mn=='formulir' || mn=='joiningf') {
            par+='&kelompokS='+$('#kelompokS').val();
            tok+=$('#kelompokS').val();
        }
        var x     = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// combo departemen ---
    function cmbdepartemen(typ){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                });
            }
            if(typ=='filter') {
                $('#departemenS').html(out);
                cmbtahunajaran('filter');
            }else $('#departemenTB').html(out);
        });
    }
//end of combo departemen---
        
// combo tingkat  ---
    function cmbtingkat(typ){
        var u = dir7;
        var d = 'aksi=cmb'+mnu7+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tingkat, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
                });
                if(typ=='filter'){
                    $('#tingkatS').html(out);
                    cmbsubtingkat('filter');
                }else{
                    $('#subtingkatTB').html(out);
                }
            }
        });
    }
//end of combo tingkat---

// combo subtingkat  ---
    function cmbsubtingkat(typ,tkt){
        var u = dir8;
        var d = 'aksi=cmb'+mnu8+'&tingkat='+$('#tingkatS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.subtingkat, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.subtingkat+'</option>';
                });
                if(typ=='filter'){
                    $('#subtingkatS').html(out);
                    cmbbiaya('filter');
                }else{
                    $('#subtingkatTB').html(out);
                }
            }
        });
    }

// combo biaya  ---
    function cmbbiaya(typ){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.biaya, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.biaya+'</option>';
                });
                if(typ=='filter'){
                    $('#biayaS').html(out);
                    viewTB();
                }else{
                    $('#biayaTB').html(out);
                }
            }
        });
    }

// combo kelas  ---
    function cmbkelas(typ,subt){
        $.ajax({
            url:dir9,
            data:'aksi=cmb'+mnu9+'&subtingkat='+subt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelas, function(id,item){
                        out+='<option value="'+item.replid+'"> '+item.kelas+'</option>';
                    });
                    if(typ=='filter'){
                        $('#spp_kelasS').html(out);
                        viewTB('spp');
                    }else{
                        $('#kelasTB').html(out);
                    }
                }
            }
        });
    }
//end of combo kelas---

// combo tahun ajaran  ---
    function cmbtahunajaran(typ){
        console.log('masuk tahu ajaran ');
        var u= dir6;
        var d = 'aksi=cmb'+mnu6;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    var ta = item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1);
                    out+='<option '+(item.aktif=='1'?'selected':'')+' value="'+item.replid+'">'+ta+'</option>';
                });
                if(typ=='filter'){
                    $('#tahunajaranS').html(out);
                    cmbtingkat('filter',dt.tahunajaran[0].replid);
                }else{
                    $('#tahunajaranTB').html(out);
                }
            }
        });
    }
//end of combo tahun ajaran---
    function getUang(x){
        var xx = x.replace(/[^0-9]+/g,'');
        return xx;
    }

    function numbValid(e){
        if($(e).val()!=$(e).val().replace(/[^0-9]/g,'')){
            $(e).val($(e).val().replace(/[^0-9]/g,''));
        }
    }

    function validBayar(e1,e2,nom,nom2){
        if(getUang($(e1).val())>nom) $(e2).html('maximal '+nom2);
        else $(e2).html('');
    }

    function histBayar(siswa){
        var url  = dir;
        var data = '&aksi=histBayar&subaksi='+(curTab()=='joiningf'?'joining fee':curTab())+'&siswa='+siswa;
        $('#histBayarTBL').html('<tr><td colspan="2" align="center"><img src="img/w8loader.gif"></td></tr>');
        ajax(url,data).done(function (dt) {
            if (dt.status!='sukses') { //gagal
                notif(dt.status,'red');
            }else{ // sukses
                $('#histBayarT').attr('style','display:visible;');
                var out='';
                if(dt.datax.length==0)
                    out+='<tr><td colspan="2" class="text-center fg-white bg-orange">belum ada angsuran</td></tr>'
                else{
                    $.each(dt.datax,function(id,item){
                        out+='<tr>'
                            +'<td>'+item.tanggal+'</td>'
                            +'<td align="right">'+item.cicilan+'</td>'
                            // +'<td><a href="#" hint="hapus" onclick="alert('+item.replid+');"><span class="icon-remove"></span></a></href="#" td>'
                        +'</tr>'
                    });
                }setTimeout(function(){
                    $('#histBayarTBL').html(out);
                },500);
            }
        });
    }