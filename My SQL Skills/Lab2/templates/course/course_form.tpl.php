<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.php">Pradžia</a></li>
		<li class="breadcrumb-item" aria-current="page"><a href="index.php?module=<?php echo $module; ?>&action=list">Kursai</a></li>
		<li class="breadcrumb-item active" aria-current="page"><?php if(!empty($id)) echo "Darbuotojo redagavimas"; else echo "Naujas kursas"; ?></li>
	</ol>
</nav>

<?php if($formErrors != null) { ?>
	<div class="alert alert-danger" role="alert">
		Neįvesti arba neteisingai įvesti šie laukai:
		<?php 
			echo $formErrors;
		?>
	</div>
<?php } ?>

<form action="" method="post" class="d-grid gap-3">
	<div class="form-group">
		<label for="Pavadinimas">Pavadinimas<?php echo in_array('Pavadinimas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Pavadinimas" name="Pavadinimas" class="form-control" value="<?php echo isset($data['Pavadinimas']) ? $data['Pavadinimas'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Kurso_kodas">Kodas<?php echo in_array('Kurso_kodas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Kurso_kodas" name="Kurso_kodas" class="form-control" value="<?php echo isset($data['Kurso_kodas']) ? $data['Kurso_kodas'] : ''; ?>">
	</div>
	
	<div class="form-group">
		<label for="Kurso_kaina">Kaina<?php echo in_array('Kurso_kaina', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Kurso_kaina" name="Kurso_kaina" class="form-control" value="<?php echo isset($data['Kurso_kaina']) ? $data['Kurso_kaina'] : ''; ?>">
	</div>

	<div class="form-group">
    <label for="Ar_finansuojamas_UT">Ar finansuojamas<?php echo in_array('Ar_finansuojamas_UT', $required) ? '<span> *</span>' : ''; ?></label>
    <select id="Ar_finansuojamas_UT" name="Ar_finansuojamas_UT" class="form-control">
        <option value="1" <?php echo (isset($data['Ar_finansuojamas_UT']) && $data['Ar_finansuojamas_UT'] == 1) ? 'selected' : ''; ?>>Taip</option>
        <option value="0" <?php echo (isset($data['Ar_finansuojamas_UT']) && $data['Ar_finansuojamas_UT'] == 0) ? 'selected' : ''; ?>>Ne</option>
    </select>
	</div>

	<div class="form-group">
		<label for="Aprasymas">Aprasymas<?php echo in_array('Aprasymas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Aprasymas" name="Aprasymas" class="form-control" value="<?php echo isset($data['Aprasymas']) ? $data['Aprasymas'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Kurso_lygmuo">Kurso lygmuo<?php echo in_array('Kurso_lygmuo', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Kurso_lygmuo" name="Kurso_lygmuo" class="form-control" value="<?php echo isset($data['Kurso_lygmuo']) ? $data['Kurso_lygmuo'] : ''; ?>">
	</div>

	<div class="form-group">
	<label for="Ar_reikalinga_programavimo_patirtis">Ar reikalinga patirtis<?php echo in_array('Ar_reikalinga_programavimo_patirtis', $required) ? '<span> *</span>' : ''; ?></label>
    <select id="Ar_reikalinga_programavimo_patirtis" name="Ar_reikalinga_programavimo_patirtis" class="form-control">
        <option value="1" <?php echo (isset($data['Ar_reikalinga_programavimo_patirtis']) && $data['Ar_reikalinga_programavimo_patirtis'] == 1) ? 'selected' : ''; ?>>Taip</option>
        <option value="0" <?php echo (isset($data['Ar_reikalinga_programavimo_patirtis']) && $data['Ar_reikalinga_programavimo_patirtis'] == 0) ? 'selected' : ''; ?>>Ne</option>
    </select>
		
	</div>

	<div class="form-group">
		<label for="Naudojamos_technologijos">Naudojamos technologijos<?php echo in_array('Naudojamos_technologijos', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Naudojamos_technologijos" name="Naudojamos_technologijos" class="form-control" value="<?php echo isset($data['Naudojamos_technologijos']) ? $data['Naudojamos_technologijos'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Reikalinga_programine__ranga">Reikalinga programine iranga<?php echo in_array('Reikalinga_programine__ranga', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Reikalinga_programine__ranga" name="Reikalinga_programine__ranga" class="form-control" value="<?php echo isset($data['Reikalinga_programine__ranga']) ? $data['Reikalinga_programine__ranga'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Kurso_reitingas">Kurso reitingas<?php echo in_array('Kurso_reitingas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Kurso_reitingas" name="Kurso_reitingas" class="form-control" value="<?php echo isset($data['Kurso_reitingas']) ? $data['Kurso_reitingas'] : ''; ?>">
	</div>

	<div class="form-group">
	<label for="Sertifikavimo_galimybe">Sertifikavimo galimybe<?php echo in_array('Sertifikavimo_galimybe', $required) ? '<span> *</span>' : ''; ?></label>
    <select id="Sertifikavimo_galimybe" name="Sertifikavimo_galimybe" class="form-control">
        <option value="1" <?php echo (isset($data['Sertifikavimo_galimybe']) && $data['Sertifikavimo_galimybe'] == 1) ? 'selected' : ''; ?>>Taip</option>
        <option value="0" <?php echo (isset($data['Sertifikavimo_galimybe']) && $data['Sertifikavimo_galimybe'] == 0) ? 'selected' : ''; ?>>Ne</option>
    </select>
		
	</div>

	<div class="form-group">
		<label for="Mokymu_trukm__val">Mokymu trukme valandomis<?php echo in_array('Mokymu_trukm__val', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Mokymu_trukm__val" name="Mokymu_trukm__val" class="form-control" value="<?php echo isset($data['Mokymu_trukm__val']) ? $data['Mokymu_trukm__val'] : ''; ?>">
	</div>

	<div class="form-group">
    <label for="Kokia_kalba_vedamas_kursas">Kursu kalba<?php echo in_array('Kokia_kalba_vedamas_kursas', $required) ? '<span> *</span>' : ''; ?></label>
    <select id="Kokia_kalba_vedamas_kursas" name="Kokia_kalba_vedamas_kursas" class="form-control">
        <option value="1" <?php echo (isset($data['Kokia_kalba_vedamas_kursas']) && $data['Kokia_kalba_vedamas_kursas'] == 1) ? 'selected' : ''; ?>>Lietuvių</option>
        <option value="2" <?php echo (isset($data['Kokia_kalba_vedamas_kursas']) && $data['Kokia_kalba_vedamas_kursas'] == 2) ? 'selected' : ''; ?>>Anglų</option>
        <option value="3" <?php echo (isset($data['Kokia_kalba_vedamas_kursas']) && $data['Kokia_kalba_vedamas_kursas'] == 3) ? 'selected' : ''; ?>>Rusų</option>
    </select>
	</div>


	<div class="form-group">
		<label for="id_Kursas">ID<?php echo in_array('id_Kursas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="id_Kursas" <?php if(isset($data['editing'])) { ?> readonly="readonly" <?php } ?> name="id_Kursas" class="form-control" value="<?php echo isset($data['id_Kursas']) ? $data['id_Kursas'] : ''; ?>">
	</div>

	<div class="form-group">
    <label for="fk_Filialasid_Filialas">Filialasid_Filialas<?php echo in_array('fk_Filialasid_Filialas', $required) ? '<span> *</span>' : ''; ?></label>
    <select id="fk_Filialasid_Filialas"  <?php if(isset($data['editing'])) { ?> readonly="readonly" <?php } ?> name="fk_Filialasid_Filialas" class="form-control" >
        <?php 
		$courseObj = new course();
        $branchIds = $courseObj->getBranchIds();
        foreach ($branchIds as $branch) {
            echo '<option value="' . $branch['id_Filialas'] . '"' . (isset($data['fk_Filialasid_Filialas']) && $data['fk_Filialasid_Filialas'] == $branch['id_Filialas'] ? ' selected' : '') . '>' . $branch['id_Filialas'] . '</option>';
        }
        ?>
    </select>
	</div>


	<p class="required-note">* pažymėtus laukus užpildyti privaloma</p>

	<input type="submit" class="btn btn-primary w-25" name="submit" value="Išsaugoti">
</form>