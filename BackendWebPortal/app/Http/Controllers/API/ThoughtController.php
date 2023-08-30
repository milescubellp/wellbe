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
use App\Models\Thought;
use App\Models\Thoughtcategory;
use App\Models\Usersthought;
use App\Models\Consultdoctorsappointment;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Carbon;

class ThoughtController extends BaseController
{
   
    public function getThoughtCategory(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Thoughtcategory = Thoughtcategory::select('thought_category.*')->orderBy('id', 'desc')->get();  
          
           
          	foreach($Thoughtcategory as $key=>$value){
              if($value['image']){
                $Thoughtcategory[$key]['image'] = url("public/uploads/thought/".$value['image']);
              }         
               
            }
          
			$success['data']  =  $Thoughtcategory;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    public function getThoughts(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Thought = Thought::select('thought.*')->orderBy('id', 'desc')->get();
           
          	foreach($Thought as $key=>$value){
              if($value['audio_video']){
                $Thought[$key]['audio_video'] = url("public/uploads/thought/".$value['audio_video']);
              }              
            }
          
			$success['data']  =  $Thought;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    
    public function get_thoughtByCategory($category_id) { 
        $user = Auth::user(); 
        if($user){
          	$Thought = Thought::select('thought.*')->where('category_id',$category_id)->orderBy('id', 'desc')->get();  
          
            $question = array();
          	foreach($Thought as $key=>$value){
              if($value['audio_video']){
                $Thought[$key]['audio_video'] = url("public/uploads/thought/".$value['audio_video']);
              }              
              $Thoughtcategory = Thoughtcategory::where('id',$value['category_id'])->orderBy('id', 'desc')->get();
              
                foreach($Thoughtcategory as $key1=>$value1){
                    if($value1['image']){
                        $Thoughtcategory[$key1]['image'] = url("public/uploads/thought/".$value1['image']);
                    }   
                }
              $Thought[$key]['category_info'] = $Thoughtcategory;  
            }
          
			$success['data']  =  $Thought;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
    
    public function addUserThought(Request $request) {
	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'thought_id' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			
            $Usersthought                     = new Usersthought;
            $Usersthought->user_id            = $request->user_id;
          	$Usersthought->thought_id         = $request->thought_id;
            $Usersthought->save();

			$success['data'] =  $Usersthought;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}
    }

     public function getUserThoughts(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Usersthought = Usersthought::select('users_thought.*')->where('user_id',$user->id)->orderBy('id', 'desc')->get();
           
          	foreach($Usersthought as $key=>$value){

                $Thought = Thought::select('thought.*')->where('id',$value['thought_id'])->orderBy('id', 'desc')->get(); 
                foreach($Thought as $key1=>$value1){
                    if($value1['audio_video']){
                        $Thought[$key1]['audio_video'] = url("public/uploads/thought/".$value1['audio_video']);
                    }     
                } 
                $Usersthought[$key]['thoughtdetails'] = $Thought;         
            }
          
			$success['data']  =  $Usersthought;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  	
}