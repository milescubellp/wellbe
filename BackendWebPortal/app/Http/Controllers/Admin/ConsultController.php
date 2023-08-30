<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use URL;
use App;
use DB;
use Auth;
use Illuminate\Support\Str;
use file;
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
use App\Models\Consultdoctorsappointment;

class ConsultController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

   
	public function get_doctors(){
		
		$Consultdoctors = Consultdoctors::select('consult_doctors.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.doctor.list',compact('Consultdoctors'));
    }
	public function add_doctor(){ 
		
        return view('admin.doctor.add');
    }
	
	public function add_doctor_action(Request $request){
		
		$request->validate([
            'name'              => ['required'],
            'email'             => ['required', 'string', 'email', 'max:255', 'unique:users'],
			'mobile'   		    => ['required'],
            'profession'   		=> ['required'],
            'profile_pic'       => 'required|image|mimes:jpg,png,jpeg,gif,svg',
            'about'   		    => ['required'],
            'experience'   	    => ['required'],
            'availability'      => ['required'],
            'expertise'         => ['required'],
            'language'          => ['required'],
            'available_type'    => ['required'],
            'conslt_fee'        => ['required'],
        ]);
		
		if(isset($request->profile_pic)){
		    $imageName = time().'.'.$request->profile_pic->extension();  
            $request->profile_pic->move(public_path('uploads/doctor/'), $imageName); 
		}
		
		$Consultdoctors                               = new Consultdoctors;
        $Consultdoctors->user_id           	          = Auth::id();
		$Consultdoctors->name            	          = $request->name;
		$Consultdoctors->email           	          = $request->email;	
		$Consultdoctors->mobile                       = $request->mobile;
        $Consultdoctors->profession                   = $request->profession;
        $Consultdoctors->about                        = $request->about;        
        $Consultdoctors->experience                   = $request->experience;
        $Consultdoctors->availability                 = $request->experience;
        $Consultdoctors->expertise                    = $request->expertise;
        $Consultdoctors->language                     = $request->language;
        $Consultdoctors->available_type               = $request->available_type;
        $Consultdoctors->conslt_fee                   = $request->conslt_fee;				
		$Consultdoctors->profile_pic                  = $imageName;
		$Consultdoctors->save();		
		
        return redirect('/admin/doctor/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_doctor($id){
		
		$consultdoctorsInfo = Consultdoctors::where('id',$id)->first();
				
        return view('admin.doctor.edit',compact('consultdoctorsInfo'));
	}
	
	public function edit_doctor_action(Request $request){
		
		$request->validate([
            'name'              => ['required'],
            'email'             => ['required', 'string', 'email', 'max:255', 'unique:users'],
			'mobile'   		    => ['required'],
            'profession'   		=> ['required'],
            'profile_pic'       => 'required|image|mimes:jpg,png,jpeg,gif,svg',
            'about'   		    => ['required'],
            'experience'   	    => ['required'],
            'availability'      => ['required'],
            'expertise'         => ['required'],
            'language'          => ['required'],
            'available_type'    => ['required'],
            'conslt_fee'        => ['required'],
        ]);
		
				
		$dataArray = array();
		$dataArray['name']            	           = $request->name;
        $dataArray['email']           	           = $request->email;	
        $dataArray['mobile']                       = $request->mobile;
        $dataArray['profession']                   = $request->profession;
        $dataArray['about']                        = $request->about;        
        $dataArray['experience']                   = $request->experience;
        $dataArray['availability']                 = $request->experience;
        $dataArray['expertise']                    = $request->expertise;
        $dataArray['language']                     = $request->language;
        $dataArray['available_type']               = $request->available_type;
        $dataArray['conslt_fee']                   = $request->conslt_fee;
		
		if(isset($request->profile_pic)){			
			$ConsultdoctorsInfo = Consultdoctors::where('id',$request->id)->first();
			if(!empty($ConsultdoctorsInfo->profile_pic)){
				$getFilePath = public_path('uploads/doctor/').$ConsultdoctorsInfo->profile_pic;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->profile_pic->extension();  
            $request->profile_pic->move(public_path('uploads/doctor/'), $imageName);
			$dataArray['profile_pic']                  = $imageName;			
		}
		
		Consultdoctors::where('id',$request->id)->update($dataArray);
		
				
        return redirect('/admin/doctor/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_doctor($id){
		
		$ConsultdoctorsInfo = Consultdoctors::where('id',$id)->first();
		if(!empty($ConsultdoctorsInfo->profile_pic)){
			$getFilePath = public_path('uploads/doctor/').$ConsultdoctorsInfo->profile_pic;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		Consultdoctors::where('id',$id)->delete();
		return redirect('/admin/doctor/list')->with('success', 'You have successfully deleted!');
	}
		
	public function get_appointment_list(){
		
		$appointments = Consultdoctorsappointment::select('consult_doctors_appointment.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.doctor.appointment_list',compact('appointments'));
    }
}
