<?php
	
// sukuriame užklausų klasės objektą
$branchObj = new branch();

$formErrors = null;
$data = array();

// nustatome privalomus formos laukus
$required = array('Miestas', 'Adresas', 'Tel__numeris', 'El__pastas', 'Vadovas', 'id_Filialas');

$maxLengths = array (
	'Miestas' => 20,
	'Adresas' => 20,
	'Tel__numeris' => 20,
	'El__pastas' => 20,
	'Vadovas' => 20,
	'id_Filialas' => 20
);

// vartotojas paspaudė išsaugojimo mygtuką
if(!empty($_POST['submit'])) {
	// nustatome laukų validatorių tipus
	$validations = array (
		'Miestas' => 'alfanum',
		'Adresas' => 'alfanum',
		'Tel__numeris' => 'alfanum',
		'El__pastas' => 'alfanum',
		'Vadovas' => 'alfanum',
		'id_Filialas' => 'alfanum');

	// sukuriame laukų validatoriaus objektą
	$validator = new validator($validations, $required, $maxLengths);

	// laukai įvesti be klaidų
	if($validator->validate($_POST)) {
		// redaguojame klientą
		$branchObj->updateBranch($_POST);

		// nukreipiame vartotoją į klientų puslapį
		common::redirect("index.php?module={$module}&action=list");
		die();
	}
	else {
		// gauname klaidų pranešimą
		$formErrors = $validator->getErrorHTML();

		// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
		$data = $_POST;
	}
} else {
	// išrenkame klientą
	$data = $branchObj->getBranch($id);
}

// nustatome požymį, kad įrašas redaguojamas norint išjungti ID redagavimą šablone
$data['editing'] = 1;

// įtraukiame šabloną
include "templates/{$module}/{$module}_form.tpl.php";

?>