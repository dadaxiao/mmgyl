<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model;
class ProshowController extends Controller {
	/*
	 * 商品详情展示
	 */
    public function proShow(){
    	$pro = M("pro");
		$pro_picture = M("pro_picture");
//		$data = $pro ->where(pSn = )
//      $model = new Model();
		$where['pSn'] = $_GET['pSn'];
//		$data = $model->query("select * from `pro` left join `pro_picture` using(pSn) where pSn=$pSn");
//		$data['basicInfo'] = $model->query("select * from `pro`  where pSn=$pSn");
//		$data['picUrl'] = $model->query("select picUrl from `pro_picture`  where pSn=$pSn");
		$data['basicInfo'] = $pro -> where($where) -> select();
		$data['picUrl'] = $pro_picture ->field('picUrl') -> where($where) -> select();
		
//		var_dump($data);
		
		if ($data['basicInfo'] != NULL) {
			$return['ret'] = "1";
			$return['data'] = $data;
			$this -> ajaxReturn($return);
    }
		//获取商品失败
		else {
			$return["ret"] = "0";
			$this -> ajaxReturn($return);
		}
		
}
	
	/*
	 * 商品分类列表，点击二级分类出现的商品列表
	 */
	 	 public function proCate()
	 {
	 	$cate = M("cate");
    	$pro = M("pro");
		$where['cateName'] = $_GET['cateName'];
		$pid = $cate -> field('pid') -> where($where) -> limit(0,1) -> select();
		
		$pid1 = (int)($pid[0]['pid']); 
        if($pid != NULL)
		{
		  $data['basicInfo'] = $pro -> where('cId='.$pid1) -> select();
			  if ($data['basicInfo'] != NULL) 
			  {
				$return['ret'] = "1";
				$return['data'] = $data;
				$this -> ajaxReturn($return);
			  }
		//获取分类下的商品失败
		    else {
			   $return["ret"] = "0";
			   $this -> ajaxReturn($return);
		       }
		}
		else{
			$return["ret"] = "0";
			$return["data"] = "分类不存在";
			$this -> ajaxReturn($return);
		}
	
	 }
	
	
	
	/*
	 * 商品搜索
	 */
	 public function proSearch()
	 {
	 	$pro = M("pro");
		$searchtext = $_GET['searchtext'];
		$text['pName'] = array('like', "%{$searchtext}%");
		$text['pSn'] = array('like', "%{$searchtext}%");
		$text['_logic'] = 'OR';
		$data = $pro -> where($text) ->select();
		if ($data != NULL) {
			$return['ret'] = "1";
			$return['data'] = $data;
			$this -> ajaxReturn($return);
    }
		//不存在有带关键字的商品
		else {
			$return["ret"] = "0";
			$return["data"] = "无此相关商品";
			$this -> ajaxReturn($return);
		}	
	 }
	
	/*
	 * 商品分类
	 */
//	 public function proCateList()
//	 {
//      $model = new Model();
//	 	$data = $model -> query("select * from `cate` where pid=0 ");
//		var_dump($data);
//		$this -> ajaxReturn($data);
//	 }
//	 public function proCateList()
//	 {
//      $model = new Model();
//	 	$count = $model -> query("select count(*) from `cate` where pid=0 ");
//		$count = (int)($count[0]['count(*)']);
////		var_dump($count);
//		for($i=0;$i<$count;$i++)
//		{
//			$pid = $model -> query("select pid from (select * from cate where pid=0 ) as A limit $i,1");
//			$pid = (int)$pid[0]['cId'];
//			$pid +=1;
//			$data[$i] = $model -> query("select * from cate where pid=$pid");
//			
//			$this -> ajaxReturn($data);
//		}
//		
////		$this -> ajaxReturn($count);
//	 }
	/*
	 * 获取商品一级分类
	 */
	public function getFirstCate()
	{
	 	$cate = M("cate");
		$data = $cate -> field('cateName,cId') -> where('pid=0') ->select();
		if ($data != NULL) {
			$return['ret'] = "1";
			$return['data'] = $data;
			$this -> ajaxReturn($return);
    }
		//获取一级分类失败
		else {
			$return["ret"] = "0";
			$this -> ajaxReturn($return);
		}	
		
	}
	
	/*
	 * 获取商品二级分类,传入第一级分类的pid
	 */
	 public function getSecondCate()
	 {
	 	$cate = M("cate");
		$firstCateId = $_GET['firstCateId'];
		try{
		$data = $cate -> field('cateName,pid') -> where('pid='.$firstCateId) ->select();
		if ($data != NULL) {
			$return['ret'] = "1";
			$return['data'] = $data;
			$this -> ajaxReturn($return);
    }
		//获取二级分类失败
		else {
			$return["ret"] = "0";
			$this -> ajaxReturn($return);
		}	
	 	
	 }
	 catch(\Exception $e)
	 {
	 	$return["ret"] = "0";
	 	$return["data"] = "错误请求";
			$this -> ajaxReturn($return);
	 }
	 }
	 
	 /*
	 * 为你精选
	 */
	 public function makeChoiceForYou()
	 {
    	$pro = M("pro");
	    $data['basicInfo'] = $pro -> field('pImg,pSn') ->limit(0,4) -> select();
			  if ($data['basicInfo'] != NULL) 
			  {
				$return['ret'] = "1";
				$return['data'] = $data;
				$this -> ajaxReturn($return);
			  }
		//获取失败
		    else {
			   $return["ret"] = "0";
			   $this -> ajaxReturn($return);
		       }
		}
	 
		

	 
	 
	
	 

}
