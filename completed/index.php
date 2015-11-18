<?php
$keyword = null;

if (!empty($_GET['search'])) {


	$keyword = stripslashes($_GET['search']);
	
	try {
	
		$objDb = new PDO('mysql:dbname=search;charset=UTF-8', 'root', 'password');
		
		$sql = "INSERT INTO `search` (`keyword`)
				VALUES (:keyword)
				ON DUPLICATE KEY UPDATE `times` = `times` + 1";
				
		$statement = $objDb->prepare($sql);
		$statement->execute(array(':keyword' => $keyword));
	
	} catch(PDOException $e) {
		echo $e->getMessage();
	}


}


try {

	$objDb = new PDO('mysql:dbname=search;charset=UTF-8', 'root', 'password');
	
	$sql = "SELECT `s`.*,
			IF (
				(
					SELECT `id`
					FROM `search`
					ORDER BY `date` DESC
					LIMIT 0, 1
				) = `s`.`id`,
				1,
				0
			) AS `latest`
			FROM `search` `s`
			ORDER BY `s`.`keyword` ASC";
			
	$statement = $objDb->query($sql);
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);

} catch(PDOException $e) {
	echo $e->getMessage();
}

?>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Save search requests to database</title>
	<meta name="description" content="Save search requests to database" />
	<meta name="keywords" content="Save search requests to database" />
	<link href="/css/core.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>

<section id="wrapper">	

	<form method="get">
		<input type="text" name="search" id="search" class="field" value="<?php echo $keyword; ?>" />
		<input type="submit" class="button" value="Search" />
	</form>
	
	<?php if (!empty($result)) { ?>
	
		<table cellpadding="0" cellspacing="0" border="0" class="tbl_repeat">
			<tr>
				<th>Keyword</th>
				<th class="tar">Searched</th>
			</tr>
			<?php foreach($result as $row) { ?>
			<tr<?php echo $row['latest'] == 1 ? ' class="active"' : null; ?>>
				<td><?php echo $row['keyword']; ?></td>
				<td class="tar"><?php echo $row['times']; ?></td>
			</tr>
			<?php } ?>
		</table>
		
	<?php } else { ?>
		<p>There are currently no searches available.</p>
	<?php } ?>
	
</section>

</body>
</html>