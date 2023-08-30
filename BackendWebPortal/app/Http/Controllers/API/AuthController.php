<?php
   
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Models\User;
use Illuminate\Support\Facades\Password;

class AuthController extends BaseController
{
    public function signin(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $authUser = Auth::user(); 
			if($authUser->status == '1'){
				$success['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken;

                if($authUser->profile_pic){
                    $authUser->profile_pic = url("public/uploads/profile_pic/".$authUser->profile_pic);
                }	

				$success['data'] =  $authUser;
				return $this->sendResponse($success, 'User logged in successfully!');
			}elseif($authUser->status == '0'){
				
				return $this->sendError('Unauthorised.', ['error'=>'Unauthorized user!']);
			}				
        }else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }
    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'code' => 'required',
            'mobile' => 'required',
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$code               = $this->generateRandomNumber();
   
        $input = $request->all();		
        $input['password'] = bcrypt($input['password']);
		$input['role']   	= 'customer';
		$input['code']   	= $input['code'];
		$input['mobile']   	= $input['mobile'];
		$input['mobile_verification_code']   	= $code;
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyAuthApp')->plainTextToken;
        if($user->profile_pic){
            $user->profile_pic = url("public/uploads/profile_pic/".$user->profile_pic);
        }
        $success['data'] =  $user;
   
        return $this->sendResponse($success, 'User created successfully.');
    }
	
	
	/** 
     * Verify Token
     * 
     * @return \Illuminate\Http\Response 
     */ 
	 
    public function verifyOTP(Request $request) {
		
		$validator = Validator::make($request->all(), [
            'mobile'  				=> 'required',
			'otp'      				=> 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$userData = User::where('mobile', $request->mobile)->where('mobile_verification_code', $request->otp)->first();
		if(!empty($userData->id)){
			
			$userData->mobile_verification_code = null;
			$userData->status = "1";
			$userData->save();
			$success['token'] =  $userData->createToken('MyAuthApp')->plainTextToken;

            if($userData->profile_pic){
                $userData->profile_pic = url("public/uploads/profile_pic/".$userData->profile_pic);
            }

			$success['data']  =  $userData;
	   
			return $this->sendResponse($success, 'User verify successfully.');			
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}			
    }
	
	public function resendOTP(Request $request){
		$validator = Validator::make($request->all(), [
            'mobile'  				=> 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$code               = $this->generateRandomNumber();
		
		$userData = User::where('mobile', $request->mobile)->first();
		if(!empty($userData->mobile)){
			
			$userData->mobile_verification_code = $code;
			$userData->save();
			$success['token'] =  $userData->createToken('MyAuthApp')->plainTextToken;
			
			return $this->sendResponse($success, 'Send successfully otp your mobile');
		}else{
			
			return $this->sendError('Unauthorised.', ['error'=>'Invalid Mobile number!']);
		}
	}
	
	public function logout(Request $request){
		
		auth()->user()->tokens()->delete();
		return $this->sendResponse([], 'Successfully logout');
		
	}

    public function forgotPassword(Request $request) {

        $validator = Validator::make($request->all(), [
            'mobile'  				=> 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$code               = $this->generateRandomNumber();

        $userData = User::where('mobile', $request->mobile)->first();
		if(!empty($userData->mobile)){
			
			$userData->mobile_verification_code = $code;
			$userData->save();
			$success['token'] =  $userData->createToken('MyAuthApp')->plainTextToken;

            if($userData->profile_pic){
                $userData->profile_pic = url("public/uploads/profile_pic/".$userData->profile_pic);
            }	

			$success['data'] =  $userData;
			
			return $this->sendResponse($success, 'Send successfully otp your mobile');
		}else{
			
			return $this->sendError('Unauthorised.', ['error'=>'Invalid Mobile number!']);
		}
    }
   
}