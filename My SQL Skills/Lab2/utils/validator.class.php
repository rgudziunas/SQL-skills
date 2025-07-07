<?php
/**
 * Pork Formvalidator. validates fields by regexes and can sanatize them. Uses PHP filter_var built-in functions and extra regexes 
 * @package pork
 */


/**
 * Pork.FormValidator
 * Validates arrays or properties by setting up simple arrays
 * 
 * @package pork
 * @author SchizoDuckie
 * @copyright SchizoDuckie 2009
 * @version 1.0
 * @access public
 */
class validator
{
    public $regexes = Array(
		'date' => "^[0-9]{4}[-/][0-9]{1,2}[-/][0-9]{1,2}\$", // 2023-01-15
		'datetime' => "^[0-9]{4}[-/][0-9]{1,2}[-/][0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}(:[0-9]{1,2})?\$", // 2023-01-15 12:12, 2023-01-15 12:12:00
		'positivenumber' => "^[0-9\.]+\$", // teigiami sveikieji skaičiai bei skaičiai su kableliu (pvz.: 25.14)
		'price' => "^([1-9][0-9]*|0)(\.[0-9]{2})?\$", // kaina (pvz.: 25.99)
		'anything' => "^[\d\D]{1,}\$", // bet koks simbolis
		'alfanum' => "^[0-9a-zA-ZąčęėįšųūžĄČĘĖĮŠŲŪŽ ,.-_\\s\?\!]+\$", // tekstas
		'not_empty' => "[a-z0-9A-ZąčęėįšųūžĄČĘĖĮŠŲŪŽ]+", // bet kokia reikšmė, kuri prasideda raide arba skaitmeniu
		'words' => "^[A-Za-ząčęėįšųūžĄČĘĖĮŠŲŪŽ]+[A-Za-ząčęėįšųūžĄČĘĖĮŠŲŪŽ \\s]*\$", // žodžiai
		'phone' => "^[0-9]{9,14}\$" // telefonas (pvz.: 860000000)
		/* BE ŠIŲ FORMATŲ DAR GALIMA NAUDOTI STANDARTINIUS:
		 * email,
		 * int,
		 * float,
		 * boolean,
		 * ip,
		 * url*/
    );
	
    private $validations, $mandatories, $lengths, $errors, $corrects, $fields;

	/**
	 * Konstruktorius
	 * @param type $validations
	 * @param type $mandatories
	 */
    public function __construct($validations = array(), $mandatories = array(), $lengths = array()) {
    	$this->validations = $validations;
    	$this->mandatories = $mandatories;
		$this->lengths = $lengths;
    	$this->errors = array();
    	$this->corrects = array();
    }

	/**
	* Patikrinamas reikšmių masyvas
	* @param type $items
	* @return type
	*/
	public function validate($items) {
		$this->fields = $items;
		$havefailures = false;
		
		foreach($this->validations as $key=>$rules) {
			if(array_search($key, $this->mandatories) !== false && !isset($items[$key])) {
				$havefailures = true;
				$this->addError($key, 'not_empty');
			}
	
			if(isset($items[$key])) {
				$val = $items[$key];
				$result = false;
				
				if(is_array($val)) {
					$result = $this->validateArray($val, $key);
				} else {
					if($rules == 'not_empty' && trim($val) == '') {
						$result = false;
					} else {
						$result = $this->validateItem($val, $rules);
					}
				}
				
				if($result === true) {
					if(key_exists($key, $this->lengths) && strlen($val) > $this->lengths[$key]) {
						$result = false;
					}
				}
				
				if($result === false) {
					$havefailures = true;
					$this->addError($key, $rules);
				} else {
					$this->corrects[] = $key;
				}
			}
		}
	
		return(!$havefailures);
	}
	

    /**
	 * Pagal nurodytą tipą patikrinamos masyvo reikšmės
	 * @param type $var
	 * @param type $type
	 * @return type
	 */
	private function validateArray($array, $key) {
		$havefailures = false;
		if((key_exists($key, $this->validations) === false) && array_search($key, $this->mandatories) === false) {
			$this->corrects[] = $key;
			//
			return false;
		}
		
		foreach($array as $item) {
			$result = false;
			if($item == "" && array_search($key, $this->mandatories) === false) {
				$result = true;
			} else {
				$result = $this->validateItem($item, $this->validations[$key]);
			}

			if($result === false) {
				$havefailures = true;
				$this->addError($key, $this->validations[$key]);
			}
		}
		
		if($havefailures == false) {
			$this->corrects[] = $key;
		}
		
		//
		return !$havefailures;
	}

    /**
	 * Pagal nurodytą tipą patikrinama viena reikšmė
	 * @param type $var
	 * @param type $type
	 * @return type
	 */
    public function validateItem($var, $type) {
	    if(array_key_exists($type, $this->regexes)) {
    			//
			return filter_var($var, FILTER_VALIDATE_REGEXP, array("options"=> array("regexp"=>'!'.$this->regexes[$type].'!i'))) !== false;
	    }
	
    		$filter = false;
    		switch($type) {
    			case 'email':
    				$var = substr($var, 0, 254);
    				$filter = FILTER_VALIDATE_EMAIL;	
    			break;
    			case 'int':
    				$filter = FILTER_VALIDATE_INT;
    			break;
    			case 'float':
    				$filter = FILTER_VALIDATE_FLOAT;
    			break;
    			case 'boolean':
    				$filter = FILTER_VALIDATE_BOOLEAN;
    			break;
    			case 'ip':
    				$filter = FILTER_VALIDATE_IP;
    			break;
    			case 'url':
    				$filter = FILTER_VALIDATE_URL;
    			break;
    		}
	
		//
    		return ($filter === false) ? false : (filter_var($var, $filter) !== false ? true : false);
    }

    /**
	 * Gaunamas klaidos pranešimas
	 * @return type
	 */
	public function getErrorHTML() {
		if(!empty($this->errors)) {
    			$errors = array();
    			foreach($this->errors as $key=>$val) {
				$errors[] = "<li>" . $key . "</li>";
			}
    			$output = "<ul>" . implode('', $errors) . "</ul>";
    		}
		
		//
    		return($output);
    }

	/**
	 * Į klaidų masyvą įtraukiama klaida
	 * @param type $field
	 * @param type $type
	 */
	private function addError($field, $type='string') {
		$this->errors[$field] = $type;
	}

}

?>