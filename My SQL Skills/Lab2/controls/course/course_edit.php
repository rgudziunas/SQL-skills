<?php

// sukuriame užklausų klasių objektus
$branchObj = new course();

$formErrors = null;
$data = array();

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
	if($validator->validate($_POST)) 
	{
		// atnaujiname sutartį
		$branchObj->updateCourse($_POST);

		// pašaliname nebereikalingas paslaugas ir įrašome naujas
		// gauname esamas paslaugas
	/*	$servicesFromDb = $contractsObj->getOrderedServices($id);

		// jeigu paslaugos kainos nerandame iš formos gautame masyve, šaliname
		foreach($servicesFromDb as $serviceDb) {
			$found = false;
			if(isset($_POST['paslauga'])) {
				foreach($_POST['paslauga'] as $keyForm => $serviceForm) {
					// gauname paslaugos id, galioja nuo ir kaina reikšmes {$price['fk_paslauga']}#{$price['galioja_nuo']}
					$tmp = explode("#", $serviceForm);
					
					$serviceId = $tmp[0];
					$priceFrom = $tmp[1];
					
					if($serviceDb['fk_paslauga'] == $serviceId && $serviceDb['fk_kaina_galioja_nuo'] == $priceFrom && $serviceDb['kaina'] == $_POST['kaina'][$keyForm] && $serviceDb['kiekis'] == $_POST['kiekis'][$keyForm]) {
						$found = true;
					}
				}
			}

			if(!$found) {
				// šalinama paslaugos kaina
				$contractsObj->deleteOrderedService($id, $serviceDb['fk_paslauga'], $serviceDb['fk_kaina_galioja_nuo']);
			}
		}
		
		if(isset($_POST['paslauga'])) {
			foreach($_POST['paslauga'] as $keyForm => $serviceForm) {
				// jeigu užsakytos paslaugos nerandame duomenų bazėje, tačiau ji yra formoje, įrašome

				// gauname paslaugos id, galioja nuo ir kaina reikšmes {$price['fk_paslauga']}#{$price['galioja_nuo']}
				$tmp = explode("#", $serviceForm);
				
				$serviceId = $tmp[0];
				$priceFrom = $tmp[1];

				$found = false;
				foreach($servicesFromDb as $serviceDb) {
					if($serviceDb['fk_paslauga'] == $serviceId && $serviceDb['fk_kaina_galioja_nuo'] == $priceFrom && $serviceDb['kaina'] == $_POST['paslaugos_kaina'][$keyForm] && $serviceDb['kiekis'] == $_POST['paslaugos_kiekis'][$keyForm]) {
						$found = true;
					}
				}

				if(!$found) {
					// įrašoma paslaugos kaina
					$contractsObj->insertOrderedService($id, $serviceId, $priceFrom, $_POST['paslaugos_kaina'][$keyForm], $_POST['paslaugos_kiekis'][$keyForm]);
				}
			}
		}*/

		// nukreipiame vartotoją į sutarčių puslapį
		common::redirect("index.php?module={$module}&action=list");
		die();
	} 
	
//	else {
		// gauname klaidų pranešimą
		$formErrors = $validator->getErrorHTML();

		// laukų reikšmių kintamajam priskiriame įvestų laukų reikšmes
	/*	$data = $_POST;
		if(isset($_POST['paslauga'])) {
			$i = 0;
			foreach($_POST['paslauga'] as $key => $val) {
				// gauname paslaugos id, galioja nuo ir kaina reikšmes {$price['fk_paslauga']}#{$price['galioja_nuo']}
				$tmp = explode("#", $val);
				
				$serviceId = $tmp[0];
				$priceFrom = $tmp[1];
				
				$data['uzsakytos_paslaugos'][$i]['fk_sutartis'] = $id;
				$data['uzsakytos_paslaugos'][$i]['fk_paslauga'] = $serviceId;
				$data['uzsakytos_paslaugos'][$i]['fk_kaina_galioja_nuo'] = $priceFrom;
				$data['uzsakytos_paslaugos'][$i]['kaina'] = $_POST['paslaugos_kaina'][$key];
				$data['uzsakytos_paslaugos'][$i]['kiekis'] = $_POST['paslaugos_kiekis'][$key];

				$i++;
			}
		}
		
		array_unshift($data['uzsakytos_paslaugos'], array());*/
//	}

} 
//else {
	//  išrenkame elemento duomenis ir jais užpildome formos laukus.
	$data = $branchObj->getCourse($id);
//	$data['uzsakytos_paslaugos'] = $contractsObj->getOrderedServices($id);

	// į užsakytų paslaugų masyvo pradžią įtraukiame tuščią reikšmę, kad užsakytų paslaugų formoje
	// būtų visada išvedami paslėpti formos laukai, kuriuos galėtume kopijuoti ir pridėti norimą
	// kiekį paslaugų
//	array_unshift($data['uzsakytos_paslaugos'], array());
//}

// nustatome požymį, kad įrašas redaguojamas norint išjungti ID redagavimą šablone
$data['editing'] = 1;

// įtraukiame šabloną
include "templates/{$module}/{$module}_form.tpl.php";

?>