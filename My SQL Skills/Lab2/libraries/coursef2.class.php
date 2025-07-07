<?php
/**
 * Darbuotojų redagavimo klasė
 *
 * @author ISK
 */

class coursef2 {
	
	private $filialai_lentele = '';
	private $kursai_lentele = '';

	private $uzsakymo_prekes = '';
	private $yra_vedami = '';
	private $uzsiemimai = '';
	private $sertifikatai = '';
	private $atsiliepimai = '';
	private $klientai = '';
	

	public function __construct() {
		$this->filialai_lentele = config::DB_PREFIX . 'filialai';
		$this->kursai_lentele = config::DB_PREFIX . 'kursai';
		$this->uzsakymo_prekes = config::DB_PREFIX . 'uzsakymo_prekes';
		$this->yra_vedami = config::DB_PREFIX . 'yra_vedami';
		$this->uzsiemimai = config::DB_PREFIX . 'uzsiemimai';
		$this->sertifikatai = config::DB_PREFIX . 'sertifikatai';
		$this->atsiliepimai = config::DB_PREFIX . 'atsiliepimai';
		$this->klientai = config::DB_PREFIX . 'klientai';
	}

	public function getCoursesListCount() {
		$query = "SELECT COUNT(`{$this->kursai_lentele}`.`id_Kursas`) AS `kiekis`
					FROM `{$this->kursai_lentele}`
						LEFT JOIN `{$this->filialai_lentele}`
							ON `{$this->kursai_lentele}`.`fk_Filialasid_Filialas`=`{$this->filialai_lentele}`.`id_Filialas`";
						
		$data = mysql::select($query);
		
		//
		return $data[0]['kiekis'];
	}
	
	public function getCoursesList($limit, $offset) {
		$limit = mysql::escapeFieldForSQL($limit);
		$offset = mysql::escapeFieldForSQL($offset);

		$query = "SELECT `{$this->kursai_lentele}`.`Pavadinimas`,
					  `{$this->kursai_lentele}`.`Kurso_kaina`,
					  `{$this->kursai_lentele}`.`Kurso_kodas`,
					  `{$this->kursai_lentele}`.`Kurso_reitingas`,
					  `{$this->filialai_lentele}`.`Miestas` 
				FROM `{$this->kursai_lentele}`
					LEFT JOIN `{$this->filialai_lentele}`
						ON `{$this->kursai_lentele}`.`fk_Filialasid_Filialas`=`{$this->filialai_lentele}`.`id_Filialas`
					
				LIMIT {$limit} OFFSET {$offset}";
		$data = mysql::select($query);
		
		//
		return $data;
	}

	public function checkIfCourseNrExists($nr) {
		$nr = mysql::escapeFieldForSQL($nr);

		$query = "SELECT COUNT(`{$this->kursai_lentele}`.`id_Kursas`) AS `kiekis`
				FROM `{$this->kursai_lentele}`
				WHERE `{$this->kursai_lentele}`.`id_Kursas`='{$nr}'";
		$data = mysql::select($query);

		//
		return $data[0]['kiekis'];
	}

	public function insertContract($data) {
		$data = mysql::escapeFieldsArrayForSQL($data);

		$query = "INSERT INTO `{$this->kursai_lentele}`
						  (`Pavadinimas`,
						   `Kurso_kodas`,
						   `Kurso_kaina`,
						   `Ar_finansuojamas_UT`,
						   `Aprasymas`,
						   `Kurso_lygmuo`,
						   `Ar_reikalinga_programavimo_patirtis`,
						   `Naudojamos_technologijos`,
						   `Reikalinga_programine__ranga`,
						   `Kurso_reitingas`,
						   `Sertifikavimo_galimybe`,
						   `Mokymu_trukm__val`,
						   `Kokia_kalba_vedamas_kursas`,
						   `fk_Filialasid_Filialas`)
				VALUES      ('{$data['Pavadinimas']}',
						   '{$data['Kurso_kodas']}',
						   '{$data['Kurso_kaina']}',
						   '{$data['Ar_finansuojamas_UT']}',
						   '{$data['Aprasymas']}',
						   '{$data['Kurso_lygmuo']}',
						   '{$data['Ar_reikalinga_programavimo_patirtis']}',
						   '{$data['Naudojamos_technologijos']}',
						   '{$data['Reikalinga_programine__ranga']}',
						   '{$data['Kurso_reitingas']}',
						   '{$data['Sertifikavimo_galimybe']}',
						   '{$data['Mokymu_trukm__val']}',
						   '{$data['Kokia_kalba_vedamas_kursas']}',
						   '{$data['fk_Filialasid_Filialas']}')";
		mysql::query($query);
	}
	

	public function updateCourse($data) {
		$data = mysql::escapeFieldsArrayForSQL($data);

		$query = "UPDATE `{$this->kursai_lentele}`
				SET `Pavadinimas`='{$data['Pavadinimas']}',
					`Kurso_kodas`='{$data['Kurso_kodas']}',
					`Kurso_kaina`='{$data['Kurso_kaina']}',
					`Ar_finansuojamas_UT`='{$data['Ar_finansuojamas_UT']}',
					`Aprasymas`='{$data['Aprasymas']}',
					`Kurso_lygmuo`='{$data['Kurso_lygmuo']}',
					`Ar_reikalinga_programavimo_patirtis`='{$data['Ar_reikalinga_programavimo_patirtis']}',
					`Naudojamos_technologijos`='{$data['Naudojamos_technologijos']}',
					`Reikalinga_programine__ranga`='{$data['Reikalinga_programine__ranga']}',
					`Kurso_reitingas`='{$data['Kurso_reitingas']}',
					`Sertifikavimo_galimybe`='{$data['Sertifikavimo_galimybe']}',
					`Mokymu_trukm__val`='{$data['Mokymu_trukm__val']}',
					`Kokia_kalba_vedamas_kursas`='{$data['Kokia_kalba_vedamas_kursas']}'
				WHERE `id_Kursas`='{$data['id_Kursas']}'";
		mysql::query($query);
	}
	
	public function getCourse($nr) {
		$nr = mysql::escapeFieldForSQL($nr);
	
		$query = "SELECT `{$this->kursai_lentele}`.`Pavadinimas`,
					  `{$this->kursai_lentele}`.`Kurso_kodas`,
					  `{$this->kursai_lentele}`.`Kurso_kaina`,
					  `{$this->kursai_lentele}`.`Ar_finansuojamas_UT`,
					  `{$this->kursai_lentele}`.`Aprasymas`,
					  `{$this->kursai_lentele}`.`Kurso_lygmuo`,
					  `{$this->kursai_lentele}`.`Ar_reikalinga_programavimo_patirtis`,
					  `{$this->kursai_lentele}`.`Naudojamos_technologijos`,
					  `{$this->kursai_lentele}`.`Reikalinga_programine__ranga`,
					  `{$this->kursai_lentele}`.`Kurso_reitingas`,
					  `{$this->kursai_lentele}`.`Sertifikavimo_galimybe`,
					  `{$this->kursai_lentele}`.`Mokymu_trukm__val`,
					  `{$this->kursai_lentele}`.`Kokia_kalba_vedamas_kursas`,
					  `{$this->kursai_lentele}`.`id_Kursas`,
					  `{$this->kursai_lentele}`.`fk_Filialasid_Filialas`
				FROM `{$this->kursai_lentele}`
				WHERE`{$this->kursai_lentele}`.`Kurso_kodas`='{$nr}'";
		$data = mysql::select($query);
	
		if (!empty($data)) {
			return $data[0];
		} else {
			// Handle the case where no data is found
			return null;  // Or you might return an empty array, or false, or throw an exception, depending on how you want to handle this scenario
		}
	}
	
	
	/**
	 * Sutarties šalinimas
	 * @param type $id
	 */
	public function deleteCourse($kursoKodas) {
		// First, escape the input to prevent SQL injection
		$kursoKodas = mysql::escapeFieldForSQL($kursoKodas);
	
		// Retrieve the 'id_Kursas' from the 'kursai' table based on 'Kurso_kodas'
		$query = "SELECT `id_Kursas` FROM `{$this->kursai_lentele}` WHERE `Kurso_kodas`='{$kursoKodas}'";
		$data = mysql::select($query);
	
		// Check if the course exists and retrieve the 'id_Kursas'
		if (!empty($data)) {
			$id_Kursas = $data[0]['id_Kursas'];
	
			// Delete all related records using 'id_Kursas'
			$this->deleteRelatedOrders($id_Kursas);
			$this->deleteRelatedOrders1($id_Kursas);
			$this->deleteRelatedOrders2($id_Kursas);
			$this->deleteRelatedOrders3($id_Kursas);
			$this->deleteRelatedOrders4($id_Kursas);
	
			// Now delete the course record from 'kursai' table
			$query = "DELETE FROM `{$this->kursai_lentele}` WHERE `id_Kursas`='{$id_Kursas}'";
			mysql::query($query);
		}
	}
	
	

	public function deleteRelatedOrders($id) {
		$courseId = mysql::escapeFieldForSQL($id);
	
		$query = "DELETE FROM `{$this->uzsakymo_prekes}`
				  WHERE `fk_Kursasid_Kursas`='{$id}'";
		mysql::query($query);
	}

	public function deleteRelatedOrders1($id) {
		$courseId = mysql::escapeFieldForSQL($id);
	
		$query = "DELETE FROM `{$this->yra_vedami}`
				  WHERE `fk_Kursasid_Kursas`='{$id}'";
		mysql::query($query);
	}

	public function deleteRelatedOrders2($id) {
		$courseId = mysql::escapeFieldForSQL($id);
	
		$query = "DELETE FROM `{$this->uzsiemimai}`
				  WHERE `fk_Kursasid_Kursas`='{$id}'";
		mysql::query($query);
	}

	public function deleteRelatedOrders3($id) {
		$courseId = mysql::escapeFieldForSQL($id);
	
		$query = "DELETE FROM `{$this->sertifikatai}`
				  WHERE `fk_Kursasid_Kursas`='{$id}'";
		mysql::query($query);
	}

	public function deleteRelatedOrders4($id) {
		$courseId = mysql::escapeFieldForSQL($id);
	
		$query = "DELETE FROM `{$this->atsiliepimai}`
				  WHERE `fk_Kursasid_Kursas`='{$id}'";
		mysql::query($query);
	}
	



	public function getAuthor() {

		$query = "SELECT `id_Klientas`, `Vartotojo_vardas` FROM `{$this->klientai}`";

		$data = mysql::select($query);
		return $data;
	}
	
	public function insertReview($courseId, $clientId, $reviewText, $rating, $reviewDate) {
		$reviewText = mysql::escapeFieldForSQL($reviewText);
		$rating = intval($rating);
	
		// Assuming the 'atsiliepimai' table has columns for text, rating, course id, and client id
		$query = "INSERT INTO `{$this->atsiliepimai}` 
					(`Tekstas`, `_vertinimas`, `Data`, `fk_Kursasid_Kursas`, `fk_Klientasid_Klientas`)
				  VALUES 
					('{$reviewText}', '{$rating}', '{$reviewDate}', '{$courseId}', '{$clientId}')";
		mysql::query($query);
	}
	

	public function getBranchIds() {
		$query = "SELECT `id_Filialas` FROM `{$this->filialai_lentele}`";
		$data = mysql::select($query);
	
		return $data;
	}
	
	public function getClientIdFromNickname($clientNickname) {
		$clientNickname = mysql::escapeFieldForSQL($clientNickname);
		
		$query = "SELECT `id_Klientas` FROM `{$this->klientai}`
				  WHERE `Vartotojo_vardas`='{$clientNickname}'";
		$data = mysql::select($query);
		
		return !empty($data) ? $data[0]['id_Klientas'] : null;
	}

	public function getCourseId($Nickname) {
		$clientNickname = mysql::escapeFieldForSQL($Nickname);
		
		$query = "SELECT `id_Kursas` FROM `{$this->kursai_lentele}`
				  WHERE `Kurso_kodas`='{$clientNickname}'";
		$data = mysql::select($query);
		
		return !empty($data) ? $data[0]['id_Kursas'] : null;
	}
	
}