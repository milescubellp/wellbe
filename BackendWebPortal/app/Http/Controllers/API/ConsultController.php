<?php
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;
use App\Models\User;
use App\Models\Moods;
use App\Models\Moodssub;
use App\Models\Moodstracker;
use App\Models\MoodRecommendation;
use App\Models\MoodQuestion;
use App\Models\Usersacademic;
use App\Models\Usersbreathin;
use App\Models\Audiovideo;
use App\Models\Consultdoctors;
use App\Models\Expertise;
use App\Models\Language;
use App\Models\Availabletype;
use App\Models\Consultdoctorsappointment;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Carbon;

class ConsultController extends BaseController
{
   
    public function get_doctors(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Consultdoctors = Consultdoctors::select('consult_doctors.*')->orderBy('id', 'desc')->get();  
          
          	foreach($Consultdoctors as $key=>$value){
              if($value['profile_pic']){
                $Consultdoctors[$key]['profile_pic'] = url("public/uploads/doctor/".$value['profile_pic']);
              }
            }
          
			$success['data']  =  $Consultdoctors;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    
    public function add_appointment(Request $request) { 
        $validator = Validator::make($request->all(), [            
            'doctor_id'   => 'required',
            'appointment_date'   => 'required',
            'session_mode'   => 'required',
            'time_slot'   => 'required',
            'session_duration'   => 'required',
            'session_price'   => 'required',
            'client_details'   => 'required',
            'client_mobile'   => 'required',
        ]);

        if($request->under_18 > 0){
            $validator = Validator::make($request->all(), [            
                'guardian_name'   => 'required',
                'guardian_email'   => 'required',
                'guardian_mobile'   => 'required',
            ]);
        }
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$user 	= Auth::user();
		if($user){
						
			$Consultdoctorsappointment                          = new Consultdoctorsappointment;
            $Consultdoctorsappointment->user_id                 = $user->id;
          	$Consultdoctorsappointment->doctor_id               = $request->doctor_id;
            $Consultdoctorsappointment->appointment_date        = $request->appointment_date;
            $Consultdoctorsappointment->session_mode            = $request->session_mode;
            $Consultdoctorsappointment->time_slot               = $request->time_slot;
            $Consultdoctorsappointment->session_duration        = $request->session_duration;
            $Consultdoctorsappointment->session_price           = $request->session_price;
            $Consultdoctorsappointment->client_details          = $request->client_details;
            $Consultdoctorsappointment->client_mobile           = $request->client_mobile;
            $Consultdoctorsappointment->under_18                = $request->under_18;
            $Consultdoctorsappointment->guardian_name           = $request->guardian_name;
            $Consultdoctorsappointment->guardian_email          = $request->guardian_email;
            $Consultdoctorsappointment->guardian_mobile          = $request->guardian_mobile;
            $Consultdoctorsappointment->save();
          	
			$success['data'] =  $Consultdoctorsappointment;
   
			return $this->sendResponse($success, 'Save Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}
    }

    public function get_appointment(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Consultdoctorsappointment = Consultdoctorsappointment::select('consult_doctors_appointment.*')->orderBy('id', 'desc')->get();  
          
          	          
			$success['data']  =  $Consultdoctorsappointment;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  
  	public function get_expertise(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Expertise = Expertise::select('expertise.*')->orderBy('id', 'desc')->get();  
                    
			$success['data']  =  $Expertise;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    public function get_languages(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$language = Language::select('language.*')->orderBy('id', 'desc')->get();  
                    
			$success['data']  =  $language;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    public function get_available_type(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Availabletype = Availabletype::select('available_type.*')->orderBy('id', 'desc')->get();  
                    
			$success['data']  =  $Availabletype;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
}