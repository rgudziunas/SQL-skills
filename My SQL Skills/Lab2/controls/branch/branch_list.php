<?php

// sukuriame užklausų klasės objektą
$branchObj = new branch();

// suskaičiuojame bendrą įrašų kiekį
$elementCount = $branchObj->getBranchesListCount();

// sukuriame puslapiavimo klasės objektą
$paging = new paging(config::NUMBER_OF_ROWS_IN_PAGE);

// suformuojame sąrašo puslapius
$paging->process($elementCount, $pageId);

// išrenkame nurodyto puslapio darbuotojus
$data = $branchObj->getBranchesList($paging->size, $paging->first);

// įtraukiame šabloną
include "templates/{$module}/{$module}_list.tpl.php";

?>