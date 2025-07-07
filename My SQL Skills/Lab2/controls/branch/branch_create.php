<?php
	
// sukuriame užklausų klasės objektą
$branchObj = new branch();

$formErrors = null;
$data = array();

// nustatome privalomus formos laukus
$required = array('Miestas', 'Adresas', 'Tel__numeris', 'El__pastas', 'Vadovas', 'id_Filialas');

// maksimalūs leidžiami laukų ilgiai
$maxLengths = array (
	'Miestas' => 20,
	'Adresas' => 50,
	'Tel__numeris' => 60,
	'El__pastas' => 60,
	'Vadovas' => 50,
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
		// įrašome naują klientą
		$branchObj->insertBranch($_POST);

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
}

// įtraukiame šabloną
include "templates/{$module}/{$module}_form.tpl.php";

?>