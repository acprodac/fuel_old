<?php 

if($_SESSION["verify"] != "FileManager4TinyMCE") die('forbiden');

function deleteDir($dir) {
    if (!file_exists($dir)) return true;
    if (!is_dir($dir)) return unlink($dir);
    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') continue;
        if (!deleteDir($dir.DIRECTORY_SEPARATOR.$item)) return false;
    }
    return rmdir($dir);
}

function rename_file($old_path,$name){
    if(file_exists($old_path)){
	$info=pathinfo($old_path);
	$new_path=$info['dirname']."/".$name.".".$info['extension'];
	if(file_exists($new_path)) return false;
	return rename($old_path,$new_path);
    }
}

function rename_folder($old_path,$name){
    if(file_exists($old_path)){
	$new_path=dirname($old_path)."/".$name;
	if(file_exists($new_path)) return false;
	return rename($old_path,$new_path);
    }
}

function create_img_gd($imgfile, $imgthumb, $newwidth, $newheight="") {
    require_once('php_image_magician.php');  
    $magicianObj = new imageLib($imgfile);
    // *** Resize to best fit then crop
    $magicianObj -> resizeImage($newwidth, $newheight, 'crop');  

    // *** Save resized image as a PNG
    $magicianObj -> saveImage($imgthumb);
}

function makeSize($size) {
   $units = array('B','KB','MB','GB','TB');
   $u = 0;
   while ( (round($size / 1024) > 0) && ($u < 4) ) {
     $size = $size / 1024;
     $u++;
   }
   return (number_format($size, 1, ',', '') . " " . $units[$u]);
}

function create_folder($path=false,$path_thumbs=false){
    $oldumask = umask(0);
    if ($path && !file_exists($path))
        mkdir($path, 0777, true); // or even 01777 so you get the sticky bit set 
    if($path_thumbs && !file_exists($path_thumbs)) 
        mkdir($path_thumbs, 0777, true) or die("$path_thumbs cannot be found"); // or even 01777 so you get the sticky bit set 
    umask($oldumask);
}

function fix_filename($str){
    $str = iconv('UTF-8', 'US-ASCII//TRANSLIT', $str);
    $str = preg_replace("/[^a-zA-Z0-9\._| -]/", '', $str);
    $str = str_replace(' ','_',$str);
    return strtolower($str);
}

function fix_path($path){
    $info=pathinfo($path);
    $tmp_path=$info['dirname'];
    $str=fix_filename($info['filename']);
    if($tmp_path!="")
	return $tmp_path.DIRECTORY_SEPARATOR.$str;
    else
	return $str;
}

function config_loading($current_path,$fld){
    if(file_exists($current_path.$fld.".config")){
	require_once($current_path.$fld.".config");
	return true;
    }
    echo "!!!!".$parent=dirname($fld);
    if($parent!="." && !empty($parent)){
	config_loading($current_path,$parent);
    }
    
    return false;
}



function pegaExtensao($arquivo){
  $ext = explode('.',$arquivo);
  $ext = array_reverse($ext);
  return ".".$ext[0]; 
}
function pegaSomenteNome($arquivo){
  $nome = pathinfo($arquivo);
  return $nome['filename'];
}
function geraNomeAleatorio($arquivo){
  $extensao    = pegaExtensao($arquivo);
  $somenteNome = pegaSomenteNome($arquivo);
  $rand        = rand(0, 99999);
  //ou
  //$rand = sha1($somenteNome.time());
  return $somenteNome.$rand.$extensao;
}
?>