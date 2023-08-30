<?php
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use File;
use App\Models\User;
use Illuminate\Support\Facades\Password;

class UserController extends BaseController
{
   
    public function getUserInfo() { 
        $user = Auth::user(); 
        if($user){
            if($user->profile_pic){
                $user->profile_pic = url("public/uploads/profile_pic/".$user->profile_pic);
            }			
			$success['data']  =  $user;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    /** 
     * Updates User Info api 
     * 
     * @return \Illuminate\Http\Response 
    */ 
	
    public function updateProfile(Request $request) {

		$validator = Validator::make($request->all(), [
            'name'   => 'required',
            'email'   => 'required',
            'mobile'   => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$user 	= Auth::user();
		$input 	= $request->all();
		if($user){

            if(isset($request->profile_pic)){
                $path = public_path("uploads/profile_pic/".$user->profile_pic);
                $isExists = File::exists($path);
                if($isExists && $user->profile_pic){
                    unlink("uploads/profile_pic/".$user->profile_pic);
                }
                $imageName = time().'.'.$request->profile_pic->extension();  
                $request->profile_pic->move(public_path('uploads/profile_pic/'), $imageName);
                $user->profile_pic = $imageName;
                $user->save();
            }
						
			$user->name 	= $input['name'];
			$user->email 	= $input['email'];
			$user->mobile 	= $input['mobile'];
			$user->save();
            if($user->profile_pic){
                $user->profile_pic = url("public/uploads/profile_pic/".$user->profile_pic);
            }	
			$success['data'] =  $user;
   
			return $this->sendResponse($success, 'Update Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

		
    }

	public function changePasssword(Request $request) {
	    $validator = Validator::make($request->all(), [
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
						
			$user->password 	= bcrypt($input['password']);
			$user->save();
            if($user->profile_pic){
                $user->profile_pic = url("public/uploads/profile_pic/".$user->profile_pic);
            }	
			$success['data'] =  $user;
   
			return $this->sendResponse($success, 'Update Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

}