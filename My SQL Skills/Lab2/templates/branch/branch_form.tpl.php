<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.php">Pradžia</a></li>
		<li class="breadcrumb-item" aria-current="page"><a href="index.php?module=<?php echo $module; ?>&action=list">Filialai</a></li>
		<li class="breadcrumb-item active" aria-current="page"><?php if(!empty($id)) echo "Darbuotojo redagavimas"; else echo "Naujas darbuotojas"; ?></li>
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
		<label for="Miestas">Miestas<?php echo in_array('Miestas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Miestas" name="Miestas" class="form-control" value="<?php echo isset($data['Miestas']) ? $data['Miestas'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Adresas">Adresas<?php echo in_array('Adresas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Adresas" name="Adresas" class="form-control" value="<?php echo isset($data['Adresas']) ? $data['Adresas'] : ''; ?>">
	</div>
	
	<div class="form-group">
		<label for="Tel__numeris">Telefono numeris<?php echo in_array('Tel__numeris', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Tel__numeris" name="Tel__numeris" class="form-control" value="<?php echo isset($data['Tel__numeris']) ? $data['Tel__numeris'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="El__pastas">Elektroninis pastas<?php echo in_array('El__pastas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="El__pastas" name="El__pastas" class="form-control" value="<?php echo isset($data['El__pastas']) ? $data['El__pastas'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="Vadovas">Vadovas<?php echo in_array('Vadovas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="Vadovas" name="Vadovas" class="form-control" value="<?php echo isset($data['Vadovas']) ? $data['Vadovas'] : ''; ?>">
	</div>

	<div class="form-group">
		<label for="id_Filialas">ID<?php echo in_array('id_Filialas', $required) ? '<span> *</span>' : ''; ?></label>
		<input type="text" id="id_Filialas" <?php if(isset($data['editing'])) { ?> readonly="readonly" <?php } ?> name="id_Filialas" class="form-control" value="<?php echo isset($data['id_Filialas']) ? $data['id_Filialas'] : ''; ?>">
	</div>

	<p class="required-note">* pažymėtus laukus užpildyti privaloma</p>

	<input type="submit" class="btn btn-primary w-25" name="submit" value="Išsaugoti">
</form>