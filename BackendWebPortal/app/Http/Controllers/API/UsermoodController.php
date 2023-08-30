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
use App\Models\Usersvideo;
use App\Models\Usersaudio;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Carbon;

class UsermoodController extends BaseController
{
   
    public function getAllmoods(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
          
          	foreach($moods as $key=>$value){
              if($value['image']){
                $moods[$key]['image'] = url("public/uploads/moods/".$value['image']);
              }
            }
          
			$success['data']  =  $moods;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  
  	public function getAllSubmoods($mood_id) { 
        $user = Auth::user(); 
        if($user){
          	$moodSubInfo = Moodssub::where('mood_id',$mood_id)->get();
          
			$success['data']  =  $moodSubInfo;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    /** 
     * Add Mood Tracker
     * 
     * @return \Illuminate\Http\Response 
    */ 
	
    public function addMoodTracker(Request $request) {

		$validator = Validator::make($request->all(), [
            'user_id'   => 'required',
            'mood_id'   => 'required',
            'sub_mood_id'   => 'required',
            'journal_it_down'   => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
		
		$user 	= Auth::user();
		if($user){
						
			$Moodstracker = new Moodstracker;
            $Moodstracker->user_id            = $request->user_id;
          	$Moodstracker->mood_id            = $request->mood_id;
            $Moodstracker->sub_mood_id        = $request->sub_mood_id;
            $Moodstracker->journal_it_down    = $request->journal_it_down;
            $Moodstracker->save();
          	
			$success['data'] =  $Moodstracker;
   
			return $this->sendResponse($success, 'Save Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}
		
    }
	
    #Today
	public function getMoodToday(Request $request) { 
        $user = Auth::user(); 
        if($user){

            $moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
          
          	foreach($moods as $key=>$value){
              if($value['image']){
                $moods[$key]['image'] = url("public/uploads/moods/".$value['image']);
              }
                
                $Moodstracker = Moodstracker::query();
          	
                $Moodstracker = $Moodstracker->select('moods_tracker.*');
                $today_start = Carbon::now()->format('Y-m-d 00:00:00');
                $today_end = Carbon::now()->format('Y-m-d 23:59:59');
                $Moodstracker = $Moodstracker->whereBetween('moods_tracker.created_at',[$today_start,$today_end]);          	
                $MoodstrackerList = $Moodstracker->where('moods_tracker.mood_id',$value->id)->where('moods_tracker.user_id',$user->id)->get();
                $totalMoodRow = $MoodstrackerList->count();

                $moods[$key]['mood_count'] = $totalMoodRow;
            }

			$success['data']  =  $moods; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    #week
	public function getMoodWeek(Request $request) { 
        $user = Auth::user(); 
        if($user){

            $moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
          
          	foreach($moods as $key=>$value){
              if($value['image']){
                $moods[$key]['image'] = url("public/uploads/moods/".$value['image']);
              }
                
                $Moodstracker = Moodstracker::query();
          	
                $Moodstracker = $Moodstracker->select('moods_tracker.*');

                $now = Carbon::now();
                $weekStartDate = $now->startOfWeek()->format('Y-m-d 00:00:00');
                $weekEndDate = $now->endOfWeek()->format('Y-m-d 23:59:59');

                $Moodstracker = $Moodstracker->whereBetween('moods_tracker.created_at',[$weekStartDate,$weekEndDate]);          	
                $MoodstrackerList = $Moodstracker->where('moods_tracker.mood_id',$value->id)->where('moods_tracker.user_id',$user->id)->get();
                $totalMoodRow = $MoodstrackerList->count();

                $moods[$key]['mood_count'] = $totalMoodRow;
            }

			$success['data']  =  $moods; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    #Month
	public function getMoodMonth(Request $request) { 
        $user = Auth::user(); 
        if($user){

            $moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
          
          	foreach($moods as $key=>$value){
              if($value['image']){
                $moods[$key]['image'] = url("public/uploads/moods/".$value['image']);
              }
                
                $Moodstracker = Moodstracker::query();
          	
                $Moodstracker = $Moodstracker->select('moods_tracker.*');

                $now = Carbon::now();
                $monthStartDate = $now->startOfMonth()->format('Y-m-d 00:00:00');
                $monthEndDate = $now->endOfMonth()->format('Y-m-d 23:59:59');

                $Moodstracker = $Moodstracker->whereBetween('moods_tracker.created_at',[$monthStartDate,$monthEndDate]);          	
                $MoodstrackerList = $Moodstracker->where('moods_tracker.mood_id',$value->id)->where('moods_tracker.user_id',$user->id)->get();
                $totalMoodRow = $MoodstrackerList->count();

                $moods[$key]['mood_count'] = $totalMoodRow;
            }

			$success['data']  =  $moods; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    #Date Range Search
	public function getMoodDateRange(Request $request) { 
        $user = Auth::user(); 
        if($user){

            $moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
          
          	foreach($moods as $key=>$value){
              if($value['image']){
                $moods[$key]['image'] = url("public/uploads/moods/".$value['image']);
              }
                
                $Moodstracker = Moodstracker::query();
          	
                $Moodstracker = $Moodstracker->select('moods_tracker.*');

                $now = Carbon::now();
                
                $StartDate  = date('Y-m-d 00:00:00', strtotime($request->start_date));
                $EndDate    = date('Y-m-d 23:59:59', strtotime($request->end_date));

                $Moodstracker = $Moodstracker->whereBetween('moods_tracker.created_at',[$StartDate,$EndDate]);          	
                $MoodstrackerList = $Moodstracker->where('moods_tracker.mood_id',$value->id)->where('moods_tracker.user_id',$user->id)->get();
                $totalMoodRow = $MoodstrackerList->count();

                $moods[$key]['mood_count'] = $totalMoodRow;
            }

			$success['data']  =  $moods; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  
  	public function getVideoMoodsBased($mood_id) { 
      	
        $user = Auth::user(); 
        if($user){
          	$moods = MoodRecommendation::select('moods_recommendation.*','moods.name as mood_name','moods_sub.sub_mood_name as sub_mood_name')->leftJoin('moods','moods.id','=','moods_recommendation.mood_id')->leftJoin('moods_sub','moods_sub.id','=','moods_recommendation.sub_mood_id')->where('moods_recommendation.mood_id',$mood_id)->get();
            $moodArr = array();
            foreach($moods as $list){
                $videoList = Audiovideo::where('recommendation_id',$list->id)->where('type','Video')->get();
                $audioList = Audiovideo::where('recommendation_id',$list->id)->where('type','Audio')->get();

                foreach($videoList as $key=>$value){
                    if($value['link']){
                        $videoList[$key]['link'] = url("public/uploads/recommendation/".$value['link']);
                    }
                }

                foreach($audioList as $key=>$value){
                    if($value['link']){
                        $audioList[$key]['link'] = url("public/uploads/recommendation/".$value['link']);
                    }                    
                }
                $moodArr[] = array(
                    'id'                => $list->id,
                    'mood_id'           => $list->mood_id,
                    'sub_mood_id'       => $list->sub_mood_id,
                    'description'       => strip_tags($list->description),
                    'created_at'        => $list->created_at,
                    'updated_at'        => $list->updated_at,
                    'mood_name'         => $list->mood_name,
                    'sub_mood_name'     => $list->sub_mood_name,
                    'videos'            => $videoList,
                    'audios'            => $audioList,
                );
            }

			$success['data']  =  $moodArr; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }	

    public function addUsersBreathin(Request $request) {
	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'mood_id' => 'required',
            'sub_mood_id' => 'required',
            'set_time' => 'required',
            'end_time' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			
            $Usersbreathin                     = new Usersbreathin;
            $Usersbreathin->user_id            = $request->user_id;
          	$Usersbreathin->mood_id            = $request->mood_id;
            $Usersbreathin->sub_mood_id        = $request->sub_mood_id;
            $Usersbreathin->set_time           = $request->set_time;
            $Usersbreathin->end_time           = $request->end_time;
            $Usersbreathin->save();

			$success['data'] =  $Usersbreathin;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }


    public function addUsersAcademic(Request $request) {

	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'mood_id' => 'required',
            'sub_mood_id' => 'required',
            'title' => 'required',
            'question_id_1' => 'required',
            'ans_1' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			//if(isset($request->question_id[0])){
                $saveArr = array();
			    //for($i=1; $i<=3; $i++){ 

                    if(!empty($request->question_id_1)){

                        $Usersacademic                     = new Usersacademic;
                        $Usersacademic->user_id            = $request->user_id;
                        $Usersacademic->mood_id            = $request->mood_id;
                        $Usersacademic->sub_mood_id        = $request->sub_mood_id;
                        $Usersacademic->title              = $request->title;
                        $Usersacademic->question_id        = $request->question_id_1;
                        $Usersacademic->ans                = $request->ans_1;
                        $Usersacademic->save();

                        $saveArr[] = $Usersacademic;
                    }

                    if(!empty($request->question_id_2)){

                        $Usersacademic                     = new Usersacademic;
                        $Usersacademic->user_id            = $request->user_id;
                        $Usersacademic->mood_id            = $request->mood_id;
                        $Usersacademic->sub_mood_id        = $request->sub_mood_id;
                        $Usersacademic->title              = $request->title;
                        $Usersacademic->question_id        = $request->question_id_2;
                        $Usersacademic->ans                = $request->ans_2;
                        $Usersacademic->save();

                        $saveArr[] = $Usersacademic;
                    }

                    if(!empty($request->question_id_3)){

                        $Usersacademic                     = new Usersacademic;
                        $Usersacademic->user_id            = $request->user_id;
                        $Usersacademic->mood_id            = $request->mood_id;
                        $Usersacademic->sub_mood_id        = $request->sub_mood_id;
                        $Usersacademic->title              = $request->title;
                        $Usersacademic->question_id        = $request->question_id_3;
                        $Usersacademic->ans                = $request->ans_3;
                        $Usersacademic->save();

                        $saveArr[] = $Usersacademic;
                    }
                //}
            //}

			$success['data'] =  $saveArr;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

    public function getAllQuestion($mood_id) { 
      	
        $user = Auth::user(); 
        if($user){
          	$moods = MoodQuestion::select('moods_question.*')->where('moods_question.mood_id',$mood_id)->get();
          
			$success['data']  =  $moods; 
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }	

    public function addUsersVideo(Request $request) {
	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'mood_id' => 'required',
            'sub_mood_id' => 'required',
            'video_id'     => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			
            $Usersvideo                     = new Usersvideo;
            $Usersvideo->user_id            = $request->user_id;
          	$Usersvideo->mood_id            = $request->mood_id;
            $Usersvideo->sub_mood_id        = $request->sub_mood_id;
            $Usersvideo->video_id           = $request->video_id;
            $Usersvideo->save();

			$success['data'] =  $Usersvideo;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

    public function addUsersAudio(Request $request) {
	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'mood_id' => 'required',
            'sub_mood_id' => 'required',
            'audio_id'     => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			
            $Usersaudio                     = new Usersaudio;
            $Usersaudio->user_id            = $request->user_id;
          	$Usersaudio->mood_id            = $request->mood_id;
            $Usersaudio->sub_mood_id        = $request->sub_mood_id;
            $Usersaudio->audio_id           = $request->audio_id;
            $Usersaudio->save();

			$success['data'] =  $Usersaudio;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

}