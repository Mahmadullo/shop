<?php

include_once __DIR__ . "/../../../common/src/Model/Comments.php";
include_once __DIR__ . "/../../../common/src/Service/UserService.php";

class CommentController 
{
    public function index()
    {
		header("Content-Type: application/json");
	
		$productId = (int)$_GET['product_id'];
        $all = (new Comments())->getByProductId($productId);
		
		print json_encode($all);
		die();
	}
}

?>