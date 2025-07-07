<?php

// sukuriame užklausų klasės objektą
$contractsObj = new course();

if(!empty($id)) {
	// pašaliname užsakytas paslaugas
//	$contractsObj->deleteOrderedServices($id);
	// šaliname sutartį
	$contractsObj->deleteCourse($id);



	// nukreipiame į sutarčių puslapį
	common::redirect("index.php?module={$module}&action=list");
	die();
}

?>