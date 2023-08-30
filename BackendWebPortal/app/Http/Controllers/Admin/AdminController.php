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

class AdminController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
		
        return view('admin.dashboard');
    }
	
	#CUSTOMER
	public function all_customer(){
		
		$users = User::select('users.*')->whereIn('role',array('customer'))->orderBy('id', 'desc')->get();  
		
        return view('admin.customer.list',compact('users'));
    }
	public function add_customer(){ 
		
        return view('admin.customer.add');
    }
	
	public function add_customer_action(Request $request){
		
		$request->validate([
            'name'          => ['required'],
            'email'         => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'code'   		=> ['required'],
			'mobile'   		=> ['required'],
			'password'      => ['required', 'string', 'min:8', 'confirmed'],
            'profile_pic'   => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
		if(isset($request->profile_pic)){
		    $imageName = time().'.'.$request->profile_pic->extension();  
            $request->profile_pic->move(public_path('uploads/customer/'), $imageName); 
		}
		
		$User = new User;
		$User->name            	= $request->name;		
		$User->role           	= 'customer';		
		$User->email           	= $request->email;		
		$User->code           	= $request->code;		
		$User->mobile           = $request->mobile;		
		$User->password         = Hash::make($request->password);		
		$User->profile_pic      = $imageName;
		$User->save();
		
		
        return redirect('/admin/customer/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_customer($user_id){
		
		$userInfo = User::where('id',$user_id)->first();
				
        return view('admin.customer.edit',compact('userInfo'));
	}
	
	public function edit_customer_action(Request $request){
		
		$request->validate([
            'name'          => ['required'],
            'email'         => ['required'],
            'code'   		=> ['required'],
			'mobile'   		=> ['required'],
            'profile_pic'   => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
				
		$dataArray = array();
		$dataArray['name']            = $request->name;	
		$dataArray['email']           = $request->email;		
		$dataArray['code']            = $request->code;		
		$dataArray['mobile']          = $request->mobile;
		
		if(isset($request->profile_pic)){			
			$UserInfo = User::where('id',$request->user_id)->first();
			if(!empty($UserInfo->profile_pic)){
				$getFilePath = public_path('uploads/customer/').$UserInfo->profile_pic;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->profile_pic->extension();  
            $request->profile_pic->move(public_path('uploads/customer/'), $imageName);
			$dataArray['profile_pic']  = $imageName;			
		}
		
		User::where('id',$request->user_id)->update($dataArray);
		
				
        return redirect('/admin/customer/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_customer($user_id){
		
		$userInfo = User::where('id',$user_id)->first();
		if(!empty($userInfo->profile_pic)){
			$getFilePath = public_path('uploads/customer/').$userInfo->profile_pic;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		User::where('id',$user_id)->delete();
		return redirect('/admin/customer/list')->with('success', 'You have successfully deleted!');
	}
	
	#Moods
	public function all_moods(){
		
		$moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.mood.list',compact('moods'));
    }
	public function add_mood(){ 
		
        return view('admin.mood.add');
    }
	
	public function add_mood_action(Request $request){
		
		$request->validate([
            'name'          => ['required','unique:moods'],
            'description'   => ['required'],
            'image'         => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
		if(isset($request->image)){
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/moods/'), $imageName); 
		}
		
		$Moods = new Moods;
		$Moods->name            = $request->name;		
		$Moods->color           = $request->color;		
		$Moods->description     = $request->description;
		$Moods->image           = $imageName;
		$Moods->save();
		$mood_id 				= $Moods->id;
		
		if(isset($request->sub_mood_name[0])){
			for($i=0; $i<count($request->sub_mood_name);$i++){				
				$Moodssub 					 		= new Moodssub;
				$Moodssub->mood_id              	= $mood_id;
				$Moodssub->sub_mood_name            = $request->sub_mood_name[$i];
				$Moodssub->sub_mood_color           = $request->sub_mood_color[$i];
				$Moodssub->save();
			}
		}
		
        return redirect('/admin/mood/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_mood($id){
		
		$moodInfo = Moods::where('id',$id)->first();
		$moodSubInfo = Moodssub::where('mood_id',$id)->get();
				
        return view('admin.mood.edit',compact('moodInfo','moodSubInfo'));
	}
	
	public function edit_mood_action(Request $request){
		
		$request->validate([
            'name'          => ['required'],            
            'description'   => ['required'],
        ]);
		
				
		$dataArray = array();
		$dataArray['name']          = $request->name;
		$dataArray['color']         = $request->color;
		$dataArray['description']   = $request->description;
		$dataArray['status']   		= $request->status;
		
		if(isset($request->image)){			
			$moodInfo = Moods::where('id',$request->mood_id)->first();
			if(!empty($moodInfo->image)){
				$getFilePath = public_path('uploads/moods/').$moodInfo->image;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/moods/'), $imageName);
			$dataArray['image']  = $imageName;			
		}
		
		Moods::where('id',$request->mood_id)->update($dataArray);
		
		Moodssub::where('mood_id',$request->mood_id)->delete();
		if(isset($request->sub_mood_name[0])){
			for($i=0; $i<count($request->sub_mood_name);$i++){				
				$Moodssub 					 		= new Moodssub;
				$Moodssub->mood_id              	= $request->mood_id;
				$Moodssub->sub_mood_name            = $request->sub_mood_name[$i];
				$Moodssub->sub_mood_color           = $request->sub_mood_color[$i];
				$Moodssub->save();
			}
		}
		
        return redirect('/admin/mood/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_mood($mood_id){
		
		$moodInfo = Moods::where('id',$mood_id)->first();
		if(!empty($moodInfo->image)){
			$getFilePath = public_path('uploads/moods/').$moodInfo->image;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		Moods::where('id',$mood_id)->delete();
		Moodssub::where('mood_id',$mood_id)->delete();
		return redirect('/admin/mood/list')->with('success', 'You have successfully deleted!');
	}
	
	#RECOMMENDATION
	public function all_recommendation(){
		
		$moodRecommendation = MoodRecommendation::select('moods_recommendation.*','moods.name as mood_name','moods_sub.sub_mood_name as sub_mood_name')->leftJoin('moods','moods.id','=','moods_recommendation.mood_id')->leftJoin('moods_sub','moods_sub.id','=','moods_recommendation.sub_mood_id')->orderBy('id', 'desc')->get();  
		
        return view('admin.recommendation.list',compact('moodRecommendation'));
    }
	public function add_recommendation(){ 
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();  
		$MoodSub = Moodssub::select('moods_sub.*')->orderBy('id', 'desc')->get();  
        return view('admin.recommendation.add',compact('Moods','MoodSub'));
    }
	
	public function add_recommendation_action(Request $request){
		
		$request->validate([
			'mood_id'          	=> ['required'],
            'sub_mood_id'       => ['required'],
            'description'       => ['required'], 
        ]);
		
		$MoodRecommendation = new MoodRecommendation;
		$MoodRecommendation->mood_id            	= $request->mood_id;		
		$MoodRecommendation->sub_mood_id           	= $request->sub_mood_id;
		$MoodRecommendation->description     		= $request->description;		
		$MoodRecommendation->save();

        return redirect('/admin/mood/recommendation/list')->with('success', 'You have successfully added!');
    }

	public function upload_recommendation_action(Request $request)
    {
        $request->validate([
            'audio_video' => 'required',
        ]);
   
        /*if(isset($request->audio_video)){
		   $imageName = time().'.'.$request->audio_video->extension();
            $request->audio_video->move(public_path('uploads/recommendation/'), $imageName); 
		}*/
		if(isset($request->audio_video)){
			$fileName = time().'.'.request()->audio_video->getClientOriginalExtension();
	
			request()->audio_video->move(public_path('uploads/recommendation/'), $fileName);

			$Audiovideo = new Audiovideo;
			$Audiovideo->recommendation_id            	= $request->recommendation_id;		
			$Audiovideo->type           				= $request->type;
			$Audiovideo->title           				= $request->title;
			$Audiovideo->link     						= $fileName;		
			$Audiovideo->save();
		}
   
        return response()->json(['success'=>'You have successfully upload file.','file_name'=>$fileName]);
    }	

	public function delete_recommendation_file($recommendation_id){
		
		Audiovideo::where('id',$recommendation_id)->delete();
		return redirect('/admin/mood/recommendation/list')->with('success', 'You have successfully deleted!');
	}
	
	public function edit_recommendation($id){
		
		$moodRecommendationInfo = MoodRecommendation::where('id',$id)->first();
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();  
		$MoodSub = Moodssub::select('moods_sub.*')->orderBy('id', 'desc')->get();
				
        return view('admin.recommendation.edit',compact('moodRecommendationInfo','Moods','MoodSub'));
	}
	
	public function edit_recommendation_action(Request $request){
		
		$request->validate([
            'mood_id'          	=> ['required'],
            'sub_mood_id'       => ['required'],
            'description'       => ['required'],
        ]);
		
		$dataArray = array();
		$dataArray['mood_id']            	= $request->mood_id;		
		$dataArray['sub_mood_id']           = $request->sub_mood_id;
		$dataArray['description']     		= $request->description;
		
		MoodRecommendation::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/mood/recommendation/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_recommendation($recommendation_id){
		
		MoodRecommendation::where('id',$recommendation_id)->delete();
		return redirect('/admin/mood/recommendation/list')->with('success', 'You have successfully deleted!');
	}
	
	#QUESTION
	public function all_question(){
		
		$moodQuestion = MoodQuestion::select('moods_question.*','moods.name as mood_name','moods_sub.sub_mood_name as sub_mood_name')->leftJoin('moods','moods.id','=','moods_question.mood_id')->leftJoin('moods_sub','moods_sub.id','=','moods_question.sub_mood_id')->orderBy('id', 'desc')->get();  
		
        return view('admin.question.list',compact('moodQuestion'));
    }
	public function add_question(){ 
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();  
		$MoodSub = Moodssub::select('moods_sub.*')->orderBy('id', 'desc')->get();  
        return view('admin.question.add',compact('Moods','MoodSub'));
    }
	
	public function add_question_action(Request $request){
		
		$request->validate([
            'mood_id'          		=> ['required'],
            'sub_mood_id'          	=> ['required'],
            'question'          	=> ['required'],
        ]);
		
				
		$MoodQuestion = new MoodQuestion;
		$MoodQuestion->mood_id            		= $request->mood_id;		
		$MoodQuestion->sub_mood_id           	= $request->sub_mood_id;		
		$MoodQuestion->question     			= $request->question;
		$MoodQuestion->answer     				= $request->answer;		
		$MoodQuestion->save();
		
		
        return redirect('/admin/mood/question/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_question($id){
		
		$moodQuestionInfo = MoodQuestion::where('id',$id)->first();
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();  
		$MoodSub = Moodssub::select('moods_sub.*')->orderBy('id', 'desc')->get();
				
        return view('admin.question.edit',compact('moodQuestionInfo','Moods','MoodSub'));
	}
	
	public function edit_question_action(Request $request){
		
		$request->validate([
            'mood_id'          		=> ['required'],
            'sub_mood_id'          	=> ['required'],
            'question'          	=> ['required'],
        ]);
		
		$dataArray = array();
		$dataArray['mood_id']            		= $request->mood_id;		
		$dataArray['sub_mood_id']           	= $request->sub_mood_id;		
		$dataArray['question']     				= $request->question;
		$dataArray['answer']     				= $request->answer;	
		
		MoodQuestion::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/mood/question/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_question($id){
		
		MoodQuestion::where('id',$id)->delete();
		return redirect('/admin/mood/question/list')->with('success', 'You have successfully deleted!');
	}
	
	#Moods Tracker
	public function all_mood_tracker($user_id){
		$Moodstracker = Moodstracker::select('moods_tracker.*','users.name as user_name','moods.name as mood_name','moods_sub.sub_mood_name as sub_mood_name')->leftJoin('users','users.id','=','moods_tracker.user_id')->leftJoin('moods','moods.id','=','moods_tracker.mood_id')->leftJoin('moods_sub','moods_sub.id','=','moods_tracker.sub_mood_id')->where('moods_tracker.user_id',$user_id)->orderBy('moods_tracker.id', 'desc')->get();  

        return view('admin.mood.tracker_list',compact('Moodstracker'));
    }
	#Moods Academic
	public function all_academic($user_id){
		
		$Usersacademic = Usersacademic::select('users_academic.*','users.name as user_name','moods.name as mood_name','moods_sub.sub_mood_name as mood_sub_name')->leftJoin('users','users.id','=','users_academic.user_id')->leftJoin('moods','moods.id','=','users_academic.mood_id')->leftJoin('moods_sub','moods_sub.id','=','users_academic.sub_mood_id')->where('users_academic.user_id',$user_id)->orderBy('users_academic.id', 'desc')->get();  
		
        return view('admin.question.academic_list',compact('Usersacademic'));
    }
	#Moods breathin
	public function all_breathin($user_id){
		
		$Usersbreathin = Usersbreathin::select('users_breathin.*','users.name as user_name','moods.name as mood_name','moods_sub.sub_mood_name as mood_sub_name')->leftJoin('users','users.id','=','users_breathin.user_id')->leftJoin('moods','moods.id','=','users_breathin.mood_id')->leftJoin('moods_sub','moods_sub.id','=','users_breathin.sub_mood_id')->where('users_breathin.user_id',$user_id)->orderBy('users_breathin.id', 'desc')->get();  
		
        return view('admin.recommendation.breathin_list',compact('Usersbreathin'));
    }
	
}
