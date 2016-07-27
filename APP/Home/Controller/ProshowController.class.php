<?php
namespace Home\Controller;
use Think\Controller;
use Think\Model;
class ProshowController extends Controller {
	
    /** 
	* proAdd 
	* 
	* 发布商品
	* 
	* @param string $pName
	* @param string $price
	* @param string $pIntro
	* @param string $pImg
    * @param string $userName
	* @param string $pNum (可选)
	* 
	* @return json
	*/ 
	public function proAdd()
	{
	    $pro = M("pro");
		$addData['pName'] = $_GET['pName'];
		$addData['price'] = $_GET['price'];
		$addData['pIntro'] = $_GET['pIntro'];
		$addData['pImg'] = $_GET['pImg'];
		$addData['userName'] = $_GET['userName'];
		$addData['pNum'] = $_GET['pNum'];
		
		try {
		$result = $pro -> add($addData);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//发布商品异常
			$return["data"] = "";
			$return["msg"] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "20";
			$return["data"] = "商品发布成功";
			$return["msg"] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "0";
			//注册失败
			$return["data"] = "发布商品失败";
			$return["msg"] = "";
			$this -> ajaxReturn($return);
		}
		
	}
	    /** 
		* updateProInfo 
		* 
		* 更改商品信息
		* 
		* @param string $proId
		* @param string $pName
		* @param string $price
		* @param string $pIntro
		* @param string $pImg
		* @param string $pNum
		* 
		* @return json
		*/ 	
		public function updateProInfo()
		{
			$pro = M("pro");
			$proId['proId'] = $_GET['proId'];
			$updateData['pName'] = $_GET['pName'];
			$updateData['price'] = $_GET['price'];
			$updateData['pIntro'] = $_GET['pIntro'];
			$updateData['pImg'] = $_GET['pImg'];
			$updateData['pNum'] = $_GET['pNum'];
			
			try {
			$result = $pro ->where($proId)->save($updateData);
			
			} catch(\Exception $e) {
				$return["ret"] = "400";
				//发布商品异常
				$return["data"] = "";
				$return["msg"] = "错误请求";
				$this -> ajaxReturn($return);
			}
			if ($result > 0) {
				$return["ret"] = "20";
				$return["data"] = "更新商品信息成功";
				$return["msg"] = "";
				$this -> ajaxReturn($return);
			} else {
				$return["ret"] = "0";
				//注册失败
				$return["data"] = "更新商品信息失败";
				$return["msg"] = "";
				$this -> ajaxReturn($return);
			}
		}
		
		/** 
		* ProDelete 
		* 
		* 删除商品
		* 
		* @param string $proId
		* 
		* @return json
		*/ 
        public function ProDelete()
		{
			$pro = M("pro");
			$id['proId'] = $_GET['proId'];
			//判断是否存在此商品
			$ifExist = $pro -> where($id) ->find();
			//不存在此商品
			if(!$ifExist)
			{
				$return["ret"] = "400";
				$return["data"] = "";
				$return["msg"] = "不存在此商品";
				$this -> ajaxReturn($return);
			}
			else{
				$result = $pro -> where($id) ->delete();
				$return["ret"] = "200";
				$return["data"] = "删除成功";
				$return["msg"] = "";
				$this -> ajaxReturn($return);
			}
		}


		/** 
		* proShow 
		* 
		* 商品详情展示
		* 
		* @param int $proId 
		* @return json
		*
		*/ 
	    public function proShow(){
    	$pro = M("pro");
		$where['proId'] = $_GET['proId'];
		$proId = $_GET['proId'];  //缓存下标
		$cacheIndex = "$proId";
		$cache=S("$cacheIndex");
		if($cache==NULL){    
		$data = $pro -> where($where) -> select();
        //没有缓存数据
		if ($data != NULL) {
			$return['ret'] = "200";
			$return['data'] = $data;
			$return['msg'] = "";
			 
			S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);
    }
		//获取商品失败
		else {
			$return["ret"] = "400";
			$return['data'] = "获取商品信息失败";
			$return['msg'] = "";
			S("$cacheIndex",$return,120); 
			$this -> ajaxReturn($return);
		}
	 }
	 //有缓存数据
		 else
		 {
		 	$this -> ajaxReturn($cache);
		 }

	    } 
   
	    /** 
		* secondCateProList 
		* 
		* 商品分类列表，点击二级分类出现的商品列表
		* 
		* @param int $secondCateId (二级分类的id) 
		* @return json
		*
		*/ 
	 	public function secondCateProList()
	    {
	 	$cate = M("cate");
    	$pro = M("pro");
		$cId = $_GET['secondCateId'];
		$cacheIndex = "$cId";
		$cache=S("$cacheIndex");
		if($cache==NULL){   
		try
		{
		$result = $pro -> $data = $pro -> field('proId,pname,price,pimg') -> where('cId='.$cId) ->select();
		}
		catch(\Exception $e)
		 {
		 	$return["ret"] = "400";
		 	$return["data"] = "";
		 	$return['msg'] = "错误请求，参数错误";
		 	S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);
		 }
	    if ($result != NULL) {

			$return["ret"] = "200";
			$return["data"] = $result;
			$return["msg"] = "";
			S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);
		} 
		else 
		{
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "此分类暂无商品";
			$return["msg"] = "";
			S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);
		}
	
	 }
	 //有缓存数据
		 else
		 {
		 	$this -> ajaxReturn($cache);
		 }

	    
    }
	

	    /** 
		* getFirstCate 
		* 
		* 获取商品一级分类
		* 
		* @param  无
		* @return json
		*
		*/ 
	public function getFirstCate()
	{
	 	$cate = M("cate");

		$cache=S("cache");
		if($cache==NULL){  
		$data = $cate -> field('cateName,cId') -> where('pid=0') ->select();
		if ($data != NULL) {
			$return['ret'] = "20";
			$return['data'] = $data;
			$return['msg'] = "";
			S("cache",$return,120);
			$this -> ajaxReturn($return);
    }
		//获取一级分类失败
		else {
			$return["ret"] = "400";
			$return['data'] = "一级分类不存在";
			$return['msg'] = "";
			S("cache",$return,120);
			$this -> ajaxReturn($return);
		}	
		
	}

	     //有缓存数据
		 else
		 {
		 	$this -> ajaxReturn($cache);
		 } 
    }

	
    /** 
	* getSecondCate 
	* 
	* 获取商品二级分类
	* 
	* @param  firstCateId  (第一级分类的id,即cId)
	* @return json
	*
	*/ 
	
public function getSecondCate()
	 {
	 	$cate = M("cate");
		$firstCateId = $_GET['firstCateId'];
		$cacheIndex = "$firstCateId";
		$secondCateScahe=S("$cacheIndex");
		if($secondCateScahe==NULL){   
		try{
		$data = $cate -> field('cateName,pid,cId') -> where('pid='.$firstCateId) ->select();
		if ($data != NULL) {
			$return['ret'] = "200";
			$return['data'] = $data;
			$return['msg'] = "";	
		    S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);

			
    }
		//获取二级分类失败
		else {
			$return["ret"] = "400";
			$return['data'] = "获取二级分类失败";
			$return['msg'] = "";
			S("$cacheIndex",$return,120); //写入缓存，时间120s  
			$this -> ajaxReturn($return);
			
		}	
	 	
	 }
	 catch(\Exception $e)
	 {
	 	$return["ret"] = "400";
	 	$return["data"] = "";
	 	$return['msg'] = "错误请求";
	 	S("$cacheIndex",$return,120); //写入缓存，时间120s  
		$this -> ajaxReturn($return);
			
	     }
	  }
	   else
		 {
		 	$this -> ajaxReturn($secondCateScahe);
		 } 

	}	
	    /** 
		* proSearch 
		* 
		* 商品搜索
		* 
		* @param string $searchtext(可以为模糊的通过商品名称查询，也可以通过商品编号查询) 
		* @return json
		*
		*/ 
	 public function proSearch()
	 {
	 	$pro = M("pro");
		$searchtext = $_GET['searchtext'];
		//判断传入的参数是否为空
		if(!$searchtext)
		{
			$return["ret"] = "400";
			//发布商品异常
			$return["data"] = "";
			$return["msg"] = "错误请求,请输入搜索内容";
			$this -> ajaxReturn($return);
		}
		else{
			$text['pName'] = array('like', "%{$searchtext}%");
			$text['pSn'] = array('eq', "{$searchtext}");
			$text['_logic'] = 'OR';
			$data = $pro -> field('proid,pname,price,pimg') -> where($text) ->select();
			if ($data != NULL) {
				$return['ret'] = "200";
				$return['data'] = $data;
				$return["msg"] = "";
				$this -> ajaxReturn($return);
	    }
			//不存在有带关键字的商品
			else {
				$return["ret"] = "400";
				$return["data"] = "无此相关商品";
				$return["msg"] = "";
				$this -> ajaxReturn($return);
			}	
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


    /** 
	* makeChoiceForYou 
	* 
	* 为你精选
	* 
	* @param string $searchtext(可以为模糊的通过商品名称查询，也可以通过商品编号查询) 
	* @return json
	*
	*/
	 public function makeChoiceForYou()
	 {
    	$pro = M("pro");
	    $data['basicInfo'] = $pro -> field('pImg,proId') ->limit(0,4) -> select();
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




		/*
		*测试缓存
		*/
     
   public function cache(){       
       //如果有缓存，则读取缓存数据       
       //如果没有缓存，则读取数据库当中的数据放入缓存       
       $firstCateId = $_GET['firstCateId'];
       // $lists = "$lists";
       $listsIndex = "$firstCateId";
       var_dump($lists);
           
               $lists=S("$listsIndex");
       if($lists==NULL){                           
        $cate = M("cate");
		
	
		$data = $cate -> field('cateName,pid,cId') -> where('pid='.$firstCateId) ->select();
         S("$listsIndex",$data,5);   
         echo '这是直接读取数据库的数据';  
         dump($data);     
          }
          else{
          	 dump($lists);
          }   
      
       } 

      /*
       * 首页的某个类别对应的5张图片，价格，名字，iproId
       */
      public function getCateList()
      {
    	$pro = M("pro");
          

      }



}
