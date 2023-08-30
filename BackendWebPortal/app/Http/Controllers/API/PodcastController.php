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
use App\Models\Journal;
use App\Models\Journalquestion;
use App\Models\Usersjournalquestion;
use App\Models\Podcast;
use App\Models\Podcastaudio;
use App\Models\Userspodcast;
use App\Models\Consultdoctorsappointment;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Carbon;

class PodcastController extends BaseController
{
   
    public function get_podcasts(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$podcasts = Podcast::select('podcast.*')->orderBy('id', 'desc')->get();  
          
            $question = array();
          	foreach($podcasts as $key=>$value){
              if($value['image']){
                $podcasts[$key]['image'] = url("public/uploads/podcast/".$value['image']);
              }              
              $Podcastaudio = Podcastaudio::where('podcast_id',$value['id'])->orderBy('id', 'desc')->get();

                foreach($Podcastaudio as $key1=>$value1){
                    if($value1['audio']){
                        $Podcastaudio[$key1]['audio'] = url("public/uploads/podcast/".$value1['audio']);
                    }   
                }
              
              $podcasts[$key]['podcastaudio'] = $Podcastaudio;  
            }
          
			$success['data']  =  $podcasts;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    
    public function get_podcastsByMood($mood_id) { 
        $user = Auth::user(); 
        if($user){
          	$podcasts = Podcast::select('podcast.*')->where('mood_id',$mood_id)->orderBy('id', 'desc')->get();  
          
            $question = array();
          	foreach($podcasts as $key=>$value){
              if($value['image']){
                $podcasts[$key]['image'] = url("public/uploads/podcast/".$value['image']);
              }              
              $Podcastaudio = Podcastaudio::where('podcast_id',$value['id'])->orderBy('id', 'desc')->get();
              
                foreach($Podcastaudio as $key1=>$value1){
                    if($value1['audio']){
                        $Podcastaudio[$key1]['audio'] = url("public/uploads/podcast/".$value1['audio']);
                    }   
                }
              $podcasts[$key]['podcastaudio'] = $Podcastaudio;  
            }
          
			$success['data']  =  $podcasts;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
    
    public function addUserPodcast(Request $request) {
	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'podcast_audio_id' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			
            $Userspodcast                     = new Userspodcast;
            $Userspodcast->user_id            = $request->user_id;
          	$Userspodcast->podcast_audio_id            = $request->podcast_audio_id;
            $Userspodcast->save();

			$success['data'] =  $Userspodcast;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

    public function get_Userpodcasts(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Userspodcast = Userspodcast::select('users_podcast.*')->where('user_id',$user->id)->orderBy('id', 'desc')->get();  
          
            $question = array();
          	foreach($Userspodcast as $key=>$value){
                        
              $Podcastaudio = Podcastaudio::where('id',$value['podcast_audio_id'])->orderBy('id', 'desc')->get();

                foreach($Podcastaudio as $key1=>$value1){
                    if($value1['audio']){
                        $Podcastaudio[$key1]['audio'] = url("public/uploads/podcast/".$value1['audio']);
                    }   
                }
              
              $Userspodcast[$key]['podcastaudio'] = $Podcastaudio;  
            }
          
			$success['data']  =  $Userspodcast;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  	
}