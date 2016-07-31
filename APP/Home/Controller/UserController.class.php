<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller{
	/*
	 * 用户注册
	 */
	public function register() {
		$user = M("user");
		$data['userName'] = $_POST['userName'];
		$data['password'] = md5($_POST['password']);
		$data['sex'] = $_POST['sex'];
		$data['phone'] = $_POST['phone'];
		$data['email'] = $_POST['email'];
		$data['face'] = $_POST['face'];
		$data['address'] = $_POST['address'];
		try {
			$result = $user -> add($data);
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
			$return["data"] = "注册成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "注册失败";
			$this -> ajaxReturn($return);
		}
	}
	public function userUpdate(){
		$user = M("user");
		$map['id'] = $_GET['id'];
		$data['userName'] = $_GET['newUserName'];
		$data['password'] = md5($_GET['newPassword']);
//		$data['sex'] = $_GET['sex'];
		$data['phone'] = $_GET['newPhone'];
		$data['email'] = $_GET['newEmail'];
		$data['face'] = $_GET['newFace'];
		$data['address'] = $_GET['newAddress'];
		try {
			$result = $user->where($map)->save($data);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "400";
			//注册成功
			$return["data"] = "信息修改成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "信息修改失败";
			$this -> ajaxReturn($return);
		}
		
	}
	public function userDelete(){
		$user = M("user");
		$map['id'] = $_GET['id'];
		try {
			$result = $user->where($map)->delete();
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "400";
			//注册成功
			$return["data"] = "信息删除成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "信息删除失败";
			$this -> ajaxReturn($return);
		}	
	}
	public function login(){
		$user = M("user");
		$map['id'] = $_GET['id'];
		try {
			$result = $user->where($map)->select();
//			var_dump($result);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if($result[0]['username'] == $_GET['userName']&&
		$result[0]['password'] == md5($_GET['password'])){
		$return["ret"] = "200";
			//注册成功
			$return["data"] = "用户登录成功";
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "用户登录失败";
			$this -> ajaxReturn($return);
		}	
	}
	public function getUserInfo(){
		$user = M("user");
		$map['id'] = $_GET['id'];
		try {
			$result = $user->where($map)->select();
//			var_dump($result);
		} catch(\Exception $e) {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "400";
			//注册成功
			$return["data"] = $result[0];
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
	public function getUserList(){
		$user = M("user");
		try {
			$result = $user->select();
		} catch(\Exception $e) {
			$return["ret"] = "400";
			$return["data"] = "";
			$return['msg'] = "错误请求";
			$this -> ajaxReturn($return);
		}
		if ($result > 0) {
			$return["ret"] = "400";
			//注册成功
			$return["data"] = $result;
			$return['msg'] = "";
			$this -> ajaxReturn($return);
		} else {
			$return["ret"] = "400";
			//注册失败
			$return["data"] = "";
			$return['msg'] = "不存在用户";
			$this -> ajaxReturn($return);
		}
	}
//	public function verify(){
//          $config =    array( 
//          'fontSize'    =>    20,    // 验证码字体大小  
//          'length'      =>    4,     // 验证码位数   
////          'bg' => array(30,10,33),
//          'expire' => 60,     //验证码的有效期（60秒）
//          'useImgBg' => false,
//          //'useImgBg' => true,
////            'useZh' => true
//          'codeSet' => '0123456789'  //指定验证码的字符
//          );
//          $Verify = new \Think\Verify($config);
//          $Verify->entry();
//     }
// 
//  public function check_verify()
//  {    
//    $verify = new \Think\Verify();    
//     $b=$verify->check($_GET['code'], $id);
//    if($b==true){
//      $return["ret"] = "400";
//			//注册成功
//			$return["data"] = "验证码正确";
//			$return['msg'] = "";
//			$this -> ajaxReturn($return);
//		} else {
//			$return["ret"] = "400";
//			//注册失败
//			$return["data"] = "";
//			$return['msg'] = "验证码错误";
//			$this -> ajaxReturn($return);
//		}
//  }
}
	