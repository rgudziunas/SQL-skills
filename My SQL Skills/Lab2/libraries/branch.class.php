<?php
/**
 * Darbuotojų redagavimo klasė
 *
 * @author ISK
 */

class branch {
	
	private $filialai_lentele = '';
//	private $sutartys_lentele = '';
	
	public function __construct() {
		$this->filialai_lentele = config::DB_PREFIX . 'filialai';
//		$this->sutartys_lentele = config::DB_PREFIX . 'sutartys';
	}
	
	/**
	 * Darbuotojo išrinkimas
	 * @param type $id
	 * @return type
	 */
	public function getBranch($id) {
		$id = mysql::escapeFieldForSQL($id);

		$query = "SELECT *
				FROM `{$this->filialai_lentele}`
				WHERE `id_Filialas`='{$id}'";
		$data = mysql::select($query);
		
		//
		return $data[0];
	}
	
	/**
	 * Darbuotojų sąrašo išrinkimas
	 * @param type $limit
	 * @param type $offset
	 * @return type
	 */
	public function getBranchesList($limit = null, $offset = null) {
		if($limit) {
			$limit = mysql::escapeFieldForSQL($limit);
		}
		if($offset) {
			$offset = mysql::escapeFieldForSQL($offset);
		}

		$limitOffsetString = "";
		if(isset($limit)) {
			$limitOffsetString .= " LIMIT {$limit}";
		}
		if(isset($offset)) {
			$limitOffsetString .= " OFFSET {$offset}";
		}
		
		$query = "SELECT *
				FROM `{$this->filialai_lentele}`
				{$limitOffsetString}";
		$data = mysql::select($query);
		
		//
		return $data;
	}
	
	/**
	 * Darbuotojų kiekio radimas
	 * @return type
	 */
	public function getBranchesListCount() {
		$query = "SELECT COUNT(`Miestas`) as `kiekis`
				FROM `{$this->filialai_lentele}`";
		$data = mysql::select($query);
		
		//
		return $data[0]['kiekis'];
	}
	
	/**
	 * Darbuotojo šalinimas
	 * @param type $id
	 */
	public function deleteBranch($id) {
		$id = mysql::escapeFieldForSQL($id);

		$query = "DELETE
				FROM `{$this->filialai_lentele}`
				WHERE `id_Filialas`='{$id}'";
		mysql::query($query);
	}

		/**
	 * Darbuotojo atnaujinimas
	 * @param type $data
	 */
	public function updateBranch($data) {
		$data = mysql::escapeFieldsArrayForSQL($data);
	
		$query = "UPDATE `{$this->filialai_lentele}`
				SET `Miestas`='{$data['Miestas']}',
					`Adresas`='{$data['Adresas']}',
					`Tel__numeris`='{$data['Tel__numeris']}',
					`El__pastas`='{$data['El__pastas']}',
					`Vadovas`='{$data['Vadovas']}'
				WHERE `id_Filialas`='{$data['id_Filialas']}'";
		mysql::query($query);
	}
	
	/**
	 * Darbuotojo įrašymas
	 * @param type $data
	 */
	public function insertBranch($data) {
		$data = mysql::escapeFieldsArrayForSQL($data);
	
		$query = "INSERT INTO `{$this->filialai_lentele}`
						  (`Miestas`, `Adresas`, `Tel__numeris`, `El__pastas`, `Vadovas`, `id_Filialas`) 
				VALUES      ('{$data['Miestas']}', '{$data['Adresas']}', '{$data['Tel__numeris']}', '{$data['El__pastas']}', '{$data['Vadovas']}', '{$data['id_Filialas']}')";
		mysql::query($query);
	}
	

	
	
}