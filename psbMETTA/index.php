<?php
    session_start();
    require_once '../lib/func.php';
    $modul = basename(dirname(__FILE__));
    isModul($modul);
    // $x= isModul($modul);
    // vd($x);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="sister">

    <link href="../css/metro-bootstrap.css" rel="stylesheet">
    <link href="../css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="../css/iconFont.css" rel="stylesheet">
    <link href="../css/docs.css" rel="stylesheet">
    <link href="../prettify/prettify.css" rel="stylesheet">

    <!-- Load JavaScript Libraries -->
    <script src="../js/jquery/jquery.min.js"></script>
    <script src="../js/jquery/jquery.widget.min.js"></script>
    <script src="../js/jquery/jquery.mousewheel.js"></script>   
<!--    <script src="../js/prettify/prettify.js"></script>-->

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="../js/load-metro.js"></script>
    <script src="js/metro.min.js"></script>
    <script>
          // function showDialog(id){
          //       var dialog = $("#"+id).data('dialog');
          //       if (!dialog.element.data('opened')) {
          //           dialog.open();
          //       } else {
          //           dialog.close();
          //       }
          //   }
    </script>
    <!-- Local JavaScript -->
    <script src="../js/docs.js"></script>
    <script src="../js/start-screen.js"></script>
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>

<<<<<<< HEAD
    <title>.:SISTER METTA:.</title>
=======
    <title>.:SISTERMETTA PSB:.</title>
>>>>>>> 2bf8f63e02267590706ca0ddccc2a79ca67120a0
</head>

<body class="metro">
    <!-- <nav class="navigation-bar light fixed-top"> -->
    <nav class="navigation-bar fixed-top">
        <nav class="navigation-bar-content">
            <a class="element brand" href="../">
                <span class="icon-grid-view"></span>  
                Menu Utama
            </a>
            
            <!-- nama modul-->
            <span class="element-divider"></span>
            <a class="element brand" href="./">
                <span class="icon-home"></span>  
                <?php echo $modul;?>
            </a>

            <!-- list menu -->
            <span class="element-divider"></span>
            <?php
                topMenu($modul);
            ?>
            <span class="element-divider place-right"></span>
            <div class="element place-right">
                <a class="dropdown-toggle" href="#">
                    <?php echo $_SESSION['namaS'].' ('.$_SESSION['levelS'].')';?>
                    <i class="icon-user"></i>
                </a>
                <ul class="dropdown-menu place-right" data-role="dropdown">
                    <li>
                        <a href="#" >
                            <span class="icon-cog"></span>
                            Setting
                        </a>
                    </li>
                    <li>
                        <a href="javascript:logout();">
                            <span class="icon-locked"></span>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </nav>

    <div class="tile-area tile-area-dark">
        <?php
            $d='views/';
            if(!isset($_GET['page'])){
                require $d.'v_home.php';
            }else{
                switch ($_GET['page']) {
                    // master
                    case 'vgolonganCalonSiswa':
                        require $d.'v_golonganCalonSiswa.php';
                    break;
                    case 'vsetAngsuran':
                        require $d.'v_setAngsuran.php';
                    break;
                     case 'vsetBiayaCalonSiswa':
                        require $d.'v_setBiayaCalonSiswa.php';
                    break;
                    case 'vsetDiskon':
                        require $d.'v_setDiskon.php';
                    break;

                    // transaksi
                    case 'vproses':
                        require $d.'v_proses.php';
                    break;
                    case 'vkelompok':
                        require $d.'v_kelompok.php';
                    break;
                    case 'vpendataan':
                        require $d.'v_pendataan.php';
                    break;
                    case 'vpenerimaan':
                        require $d.'v_penerimaan.php';
                    break;
                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
    <!-- // <script src="js/hitua.js"></script> -->
    <script src="../js/main.js"></script>

</body>
</html>
