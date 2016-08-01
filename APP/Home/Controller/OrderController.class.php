<?php
namespace Home\Controller;
use Think\Controller;
class OrderController extends Controller{
	public function orderSubmit(){
		$order = M("order");
		$data['num'] = $_GET['num'];  //must
		$data['price'] = $_GET['price'];  //must
		$data['amount'] = $_GET['amount'];  //must
		$data['pName'] = $_GET['pName']; 
		$data['payStatus'] = $_GET['payStatus'];
//		$data['deliverStatus'] = $_GET['deliverStatus'];
		$data['sellerName'] = $_GET['sellerName'];
		$data['buyerName'] = $_GET['buyerName'];
		$data['address'] = $_GET['address'];
		$data['startTime'] = time();
//		$data['isSuccess'] = $_GET['isSuccess'];
		try {
			//$data['oNo'] = $_GET['oNo'];
			$result = $order -> add($data);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = "订单提交成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "订单提交失败";
			$this -> ajaxReturn($return);
		}
	}
	public function orderDelete(){
		$order = M("order");
		$map['oNo'] = $_GET['oNo'];
		$deliverStatus = $order -> where($map)-> where('deliverStatus') ->select();
		try {
			if($deliverStatus == "已发货"){
				$result = $order->where($map)->delete();
			}
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = "订单撤销成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "订单撤销失败";
			$this -> ajaxReturn($return);
		}
	}
	public function getOrderInfo(){
		$order = M("order");
		$map['oNo'] = $_GET['oNo'];
		try {
			$result = $order->where($map)->select();
//			var_dump($result);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = $result;
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "不存在该用户";
			$this -> ajaxReturn($return);
		}
	}
	public function orderEnd(){
		$order = M("order");
		$data['endTime'] = time();
		$data['isSuccess'] = $_GET['isSuccess'];//此状态需要文字对应
		try {
			$result = $order -> add($data);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = "交易成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "交易失败";
			$this -> ajaxReturn($return);
		}
	}
    public function orderPay(){
    	$order = M("order");
		$map['oNo'] = $_GET['oNo'];
		$data['payStatus'] = $_GET['payStatus'];
		try {
			$result = $order ->where($map)-> add($data);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = "付款成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "付款失败";
			$this -> ajaxReturn($return);
		}
    }
	public function orderDeliver(){
    	$order = M("order");
		$map['oNo'] = $_GET['oNo'];
		$data['deliverStatus'] = $_GET['deliverStatus'];
		try {
			$result = $order ->where($map)-> add($data);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "200";
			//注册成功
			$return["data"] = "发货确认成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "发货确认失败";
			$this -> ajaxReturn($return);
		}
    }
}

