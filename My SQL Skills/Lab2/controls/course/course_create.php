<?php

// sukuriame užklausų klasių objektus
$branchObj = new course();

$formErrors = null;
$data = array();
$data['uzsakytos_paslaugos'] = array();

// nustatome privalomus laukus
$required = array('Pavadinimas', 'Kurso_kodas', 'Kurso_kaina', 'Ar_finansuojamas_UT', 'Aprasymas', 'Sertifikavimo_galimybe', 'Mokymu_trukm__val', 'Kokia_kalba_vedamas_kursas', 'fk_Filialasid_Filialas' );

// vartotojas paspaudė išsaugojimo mygtuką
if(!empty($_POST['submit'])) {
	// nustatome laukų validatorių tipus
	$validations = array (
		'Pavadinimas' => 'not_empty',
		'Kurso_kodas' => 'not_empty',
		'Kurso_kaina' => 'price',
		'Ar_finansuojamas_UT' => 'alfanum',
		'Aprasymas' => 'not_empty',
		'Sertifikavimo_galimybe' => 'alfanum',
		'Mokymu_trukm__val' => 'positivenumber',
		'Kokia_kalba_vedamas_kursas' => 'alfanum',
		'fk_Filialasid_Filialas' => 'alfanum');
	
	// sukuriame laukų validatoriaus objektą
	$validator = new validator($validations, $required);

	// laukai įvesti be klaidų
	if($validator->validate($_POST)) {
		// patikriname, ar nėra sutarčių su tokiu pačiu numeriu
		$kiekis = $branchObj->checkIfCourseNrExists($_POST['Kurso_kodas']);

		if($kiekis > 0) {
			// sudarome klaidų pranešimą
			$formErrors = "Sutartis su įvestu numeriu jau egzistuoja.";
			// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
			$data = $_POST;
		} else {
			// įrašome naują sutartį
			$branchObj->insertContract($_POST);

			// įrašome užsakytas paslaugas
//			foreach($_POST[''] as $keyForm => $serviceForm) {

				// gauname paslaugos id, galioja nuo ir kaina reikšmes {$price['fk_paslauga']}#{$price['galioja_nuo']}
//				$tmp = explode("#", $serviceForm);
				
//				$serviceId = $tmp[0];
//				$priceFrom = $tmp[1];

//				$contractsObj->insertOrderedService($_POST['nr'], $serviceId, $priceFrom, $_POST['paslaugos_kaina'][$keyForm], $_POST['paslaugos_kiekis'][$keyForm]);
			}
		}

		// nukreipiame vartotoją į sutarčių puslapį
		if($formErrors == null) {
			common::redirect("index.php?module={$module}&action=list");
			die();
		}

		
	} else {
		// gauname klaidų pranešimą
//		$formErrors = $validator->getErrorHTML();
		
		// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
		$data = $_POST;

//		$data['uzsakytos_paslaugos'] = array();
//		if(isset($_POST['paslauga'])) {
//			$i = 0;
//			foreach($_POST['paslauga'] as $key => $val) {
				// gauname paslaugos id, galioja nuo ir kaina reikšmes {$price['fk_paslauga']}#{$price['galioja_nuo']}
//				$tmp = explode("#", $val);
				
//				$serviceId = $tmp[0];
//				$priceFrom = $tmp[1];
				
//				$data['uzsakytos_paslaugos'][$i]['fk_paslauga'] = $serviceId;
//				$data['uzsakytos_paslaugos'][$i]['fk_kaina_galioja_nuo'] = $priceFrom;
//				$data['uzsakytos_paslaugos'][$i]['kaina'] = $_POST['paslaugos_kaina'][$key];
//				$data['uzsakytos_paslaugos'][$i]['kiekis'] = $_POST['paslaugos_kiekis'][$key];

//				$i++;
//			}
//		}
	}



// į užsakytų paslaugų masyvo pradžią įtraukiame tuščią reikšmę, kad užsakytų paslaugų formoje
// būtų visada išvedami paslėpti formos laukai, kuriuos galėtume kopijuoti ir pridėti norimą
// kiekį paslaugų
//array_unshift($data['uzsakytos_paslaugos'], array());

// įtraukiame šabloną
include "templates/{$module}/{$module}_form.tpl.php";

?>